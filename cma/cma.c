/* cma.c - ARM specific Linux driver for allocating physically contigious memory.
 *
 *
 * The MIT License (MIT)
 *
 * COPYRIGHT (C) 2017 Institute of Electronics and Computer Science (EDI), Latvia.
 * AUTHOR: Rihards Novickis (rihards.novickis@edi.lv)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 *
 * DESCRIPTION:
 * In some DMA use cases there is a need or it is more efficient to use large
 * physically contigous memory regions. When Linux kernel is compiled with CMA
 * (Contigous Memory Allocator) feature, this module allows to allocate this 
 * contigous memory and pass it to the user space. Memory can be either cached
 * or uncached. 
 *
 * For api description, see "cma_api.h" header file.
 *
 */

/* Linux driver includes */
#include <linux/init.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/device.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/mutex.h>

/* CMA specific includes */
#include <linux/dma-mapping.h>
#include <linux/dma-contiguous.h>

#include <linux/mm.h>
#include <asm/cacheflush.h>

/* IOCTL description */
#include "cma.h"

/* Handle defines */
#ifndef CONFIG_DMA_CMA
#error "CMA configuration not set in kernel!"
#endif
#ifndef CMA_DEBUG
#define CMA_DEBUG 0
#endif
#ifndef DRIVER_NODE_NAME
#define DRIVER_NODE_NAME "cma"
#endif

#define MY_DEBUG 0

/* Commonly used printk statements */
#define __ERROR(fmt, args...) printk(KERN_ERR "CMA_ERROR: " fmt, ##args)
#define __INFO(fmt, args...) printk(KERN_INFO "CMA_INFO: " fmt, ##args)

#if CMA_DEBUG == 1
#define __DEBUG(fmt, args...) //printk(KERN_INFO "CMA_DEBUG: " fmt, ##args)
#else
#define __DEBUG(fmt, args...) 
#endif

/* cma entry flags */
#define CMA_ENTRY_CACHED 0
#define CMA_ENTRY_MAPPED (1 << 0)
#define CMA_ENTRY_NONCACHED (1 << 1)

/* fops declarations */
static long cma_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
static int cma_mmap(struct file *filp, struct vm_area_struct *vm_area_dscr);

static ssize_t cma_read(struct file *filp, char __user *buff, size_t count, loff_t *offp);
static ssize_t cma_write(struct file *filp, const char __user *buff, size_t count, loff_t *offp);

/* ioctl interface commands */
static long cma_ioctl_alloc(struct file *filp, unsigned int cmd, unsigned long arg, int cached_flag);
static long cma_ioctl_free(struct file *filp, unsigned int cmd, unsigned long arg);
static long cma_ioctl_get_phy_addr(struct file *filp, unsigned int cmd, unsigned long arg);
static long cma_ioctl_get_size(struct file *filp, unsigned int cmd, unsigned long arg);
static struct cma_entry *cma_ioctl_get_entry_from_v_usr_addr(unsigned int cmd, unsigned long arg);
//static long cma_ioctl_set_wrt_target_addr(struct file *filp, unsigned int cmd, unsigned long arg);
//static long cma_ioctl_get_read_src_addr(struct file *filp, unsigned int cmd, unsigned long arg);

/* CMA entry specific functions */
struct cma_entry *cma_entry_get_by_phy_addr(unsigned long phy_addr);
struct cma_entry *cma_entry_get_by_v_usr_addr(unsigned long v_usr_addr);
static int cma_entry_add(struct cma_entry *entry);
static int cma_entry_release(unsigned long v_usr_addr);


/* mmap ops declarations */
void cma_mmap_close(struct vm_area_struct *vma);

/* File operations */
struct file_operations fops = {
	.owner = THIS_MODULE,
	.unlocked_ioctl = cma_ioctl,
	.mmap = cma_mmap,
	.read = cma_read,
	.write = cma_write,
};

/* mmap operation structure */
static struct vm_operations_struct cma_ops = {
	.close = cma_mmap_close};

/* List structure for containing memory allocation information */
struct cma_entry
{
	struct cma_entry *next;
	pid_t pid;			 /* calling process id */
	unsigned long size;		 /* size of allocation */
	dma_addr_t phy_addr; /* physical address */
	void *v_ptr;		 /* kernel-space pointer */
	unsigned long v_usr_addr; /* user-space addr */
	int flags;			 /* memory allocation related flags */
};

/* Global variables */
int major;
static struct class *class;
static struct device *device;
struct cma_entry *cma_start = NULL;
struct cma_entry *cma_target_entry_ptr = NULL;
struct cma_entry *cma_src_entry_ptr = NULL;
static struct mutex mutex_cma_list_modify;
extern void __flush_dcache_area(void *addr, size_t len);

static unsigned long *c_out = NULL;
static unsigned int c_out_cntr = 0;

struct cma_entry *cma_entry_get_by_phy_addr(unsigned long phy_addr)
{
	struct cma_entry *walk = cma_start;

	__DEBUG("cma_entry_get_by_phy_addr()\n");

	if (mutex_lock_interruptible(&mutex_cma_list_modify))
		return NULL;

	/* search for physical address */
	while (walk != NULL)
	{
		if (walk->phy_addr == phy_addr)
			goto leave;

		walk = walk->next;
	}

leave:
	mutex_unlock(&mutex_cma_list_modify);
	return walk;
}

struct cma_entry *cma_entry_get_by_v_usr_addr(unsigned long v_usr_addr)
{
	struct cma_entry *walk = cma_start;

	__DEBUG("cma_entry_get_by_v_usr_addr()\n");

//	if (mutex_lock_interruptible(&mutex_cma_list_modify))
//		return NULL;
	mutex_lock(&mutex_cma_list_modify);

	/* search for user virtual address */
	while (walk != NULL)
	{
		if (walk->v_usr_addr == v_usr_addr)
			goto leave;

		walk = walk->next;
	}

leave:
	mutex_unlock(&mutex_cma_list_modify);
	return walk;
}

static int cma_entry_add(struct cma_entry *entry)
{
	__DEBUG("cma_entry_add() - phy_addr 0x%x; pid 0x%x\n", entry->phy_addr, entry->pid);

	if (mutex_lock_interruptible(&mutex_cma_list_modify))
		return -EAGAIN;

	/* add entry in start - this is more effective */
	entry->next = cma_start;
	cma_start = entry;

	mutex_unlock(&mutex_cma_list_modify);

	return 0;
}

static int cma_entry_release(unsigned long v_usr_addr)
{
	int err;
	struct cma_entry *walk_prev, *walk_curr;

	__DEBUG("cma_entry_release() - v_usr_addr 0x%x; pid 0x%x\n", v_usr_addr, current->pid);

	if (mutex_lock_interruptible(&mutex_cma_list_modify))
		return -EAGAIN;

	walk_prev = NULL;
	walk_curr = cma_start;

	while (walk_curr != NULL)
	{
		if ((walk_curr->pid == current->pid) && (walk_curr->v_usr_addr == v_usr_addr))
		{

			/* Check if mapped */
			if (walk_curr->flags & CMA_ENTRY_MAPPED)
			{
				err = -1;
				goto leave;
			}

			/* Check if not the first entry */
			if (walk_prev != NULL)
				walk_prev->next = walk_curr->next;

			//dma_free_coherent(NULL, walk_curr->size, walk_curr->v_ptr, walk_curr->phy_addr);
			dmam_free_coherent(device, walk_curr->size, walk_curr->v_ptr, walk_curr->phy_addr);
			kfree(walk_curr);
			err = 0;
			goto leave;
		}

		/* Prepare next walk */
		walk_prev = walk_curr;
		walk_curr = walk_curr->next;
	}

	err = -1;

leave:
	mutex_unlock(&mutex_cma_list_modify);
	return err;
}

/* inline function for readability */
inline int check_entry_accordance(struct cma_entry *entry, struct vm_area_struct *vma)
{
	if (entry == NULL)
		return -EFAULT;

	if (entry->phy_addr != vma->vm_pgoff << PAGE_SHIFT)
		return -EFAULT;

	if (entry->size != vma->vm_end - vma->vm_start)
		return -EFAULT;

	if (entry->pid != current->pid)
		return -EACCES;

	return 0;
}

static int cma_mmap(struct file *filp, struct vm_area_struct *vma)
{
	int err;
	struct cma_entry *entry;

	__DEBUG("cma_mmap() - phy_addr 0x%lx, v_user_addr 0x%lx\n", vma->vm_pgoff << PAGE_SHIFT, vma->vm_start);

	entry = cma_entry_get_by_phy_addr(vma->vm_pgoff << PAGE_SHIFT);

	/* check if mmap is alligned with according entry */
	err = check_entry_accordance(entry, vma);
	if (err)
		return err;
	__DEBUG("cma_mmap - 1\n");

	/* set user address for later reference (used when freeing the memory ) */
	entry->v_usr_addr = vma->vm_start;
	__DEBUG("Set user space entry->v_usr_addr  = vma->vm_start = 0x%llx \n", entry->v_usr_addr);

	/* should memory be uncached? */
	if (entry->flags & CMA_ENTRY_NONCACHED)
		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);

	/* map memory to user space */
	__DEBUG("map memory to user space vm_start:0x%llx, phy_addr 0x%lx, size:0x%llx, vm_page_prot:0x%llx \n", \
	vma->vm_start, vma->vm_pgoff, vma->vm_end - vma->vm_start, vma->vm_page_prot);
	if ( remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff, vma->vm_end - vma->vm_start, vma->vm_page_prot))
	{
		up_write(&current->mm->mmap_sem);
		return -EAGAIN;
	}
	__DEBUG("cma_mmap - 2\n");

	/* save mmap ops and set entry mapped flag */
	vma->vm_ops = &cma_ops;
	entry->flags = (entry->flags & (~CMA_ENTRY_MAPPED)) | CMA_ENTRY_MAPPED;
	__DEBUG("cma_mmap - 3\n");

	return 0;
}

void cma_mmap_close(struct vm_area_struct *vma)
{
	struct cma_entry *entry;

	__DEBUG("cma_mmap_close()\n");

	/* remove custom mapped flag */
	entry = cma_entry_get_by_phy_addr(vma->vm_pgoff << PAGE_SHIFT);
	if (entry != NULL)
		entry->flags &= (~CMA_ENTRY_MAPPED);
}

/* ECE699 ==> */
static ssize_t cma_read(struct file *filp, char __user *buff, size_t count, loff_t *offp){
	void * from = NULL;
	unsigned long read_len = 0;
	if (cma_src_entry_ptr == NULL)
	{
		__DEBUG("Coresponding source cma entry has not been found\n");
		return -EFAULT;
	}
	from = (void *)cma_src_entry_ptr->v_ptr;

	__DEBUG("Read() got source address 0x%llx, mapped addr 0x%llx, DMA_addr 0x%llx\n", from, cma_src_entry_ptr->v_usr_addr, cma_src_entry_ptr->phy_addr );
	if (from){
		__DEBUG("Start to read from Kernel for %d bytes to 0x%llx\n", count, buff);
		read_len = copy_to_user(buff, from, count);
		#if MY_DEBUG
		  unsigned short* data_ptr = (unsigned short*)from;
		  unsigned int loop, offset;
		  offset = 0;
		  if ( count < 0x1000){
			while(offset < count){
				__DEBUG("0x%08llx: ", data_ptr);
			  for ( loop = 0; loop < 8; loop++ ){
				  __DEBUG("0x%04x ", *data_ptr++);
				offset+=2;
			  }
			  __DEBUG("\n");
			}
		  }


/************Debug*************/
		  int8_t *ptr;
		  if ( (c_out != NULL) && (count == 0x400 || count == 0x100) ){
			offset = 0;
			ptr = (int8_t*)c_out;
			while(offset < count){
				__DEBUG("0x%08llx: ", ptr);
			  for ( loop = 0; loop < 16; loop++ ){
				__DEBUG("%i %i %i %i %i %i %i %i ", *ptr++,*ptr++,*ptr++,*ptr++,*ptr++,*ptr++,*ptr++,*ptr++);
				offset+=8;
			  }
			  __DEBUG("\n");
			}
		  }
/************Debug*************/
		#endif
	}
	else{
		read_len = count;
	}
	__DEBUG("Read from kernel %d bytes\n", count-read_len);
	return read_len;
}

static ssize_t cma_write(struct file *filp, const char __user *buff, size_t count, loff_t *offp){
	void *to = NULL;
	unsigned long wrt_len = 0;
	if (cma_target_entry_ptr == NULL)
	{
		__DEBUG("Coresponding target cma entry has not been found\n");
		return -EFAULT;
	}
	to = (void *)cma_target_entry_ptr->v_ptr;
	__DEBUG("Write() got target address 0x%llx, mapped addr 0x%llx, DMA_addr 0x%llx\n", to, cma_target_entry_ptr->v_usr_addr, cma_target_entry_ptr->phy_addr );
	#if MY_DEBUG
	/************Debug*************/
	if ( (c_out == NULL) && (count == 0x400 || count == 0x100) ){
		c_out_cntr++;
		if ( c_out_cntr == 1 && count == 0x400)
			c_out = to;
		else if (c_out_cntr == 2 && count == 0x100)
		{
			c_out = to;
		}
		
	}
	/************Debug*************/
	#endif
	if ( to ){
		__DEBUG("Start to write to Kernel for %d bytes from 0x%llx\n", count, buff);
		wrt_len = copy_from_user(to, buff, count );
		#if MY_DEBUG
		  unsigned short* data_ptr = (unsigned short*)to;
		  unsigned int loop, offset;
		  offset = 0;
		  if ( count < 0x1000){
			while(offset < count){
				__DEBUG("0x%08llx: ", data_ptr);
			  for ( loop = 0; loop < 8; loop++ ){
				  __DEBUG("0x%04x ", *data_ptr++);
				offset+=2;
			  }
			  __DEBUG("\n");
			}
		  }
		#endif
  }
	else{
		wrt_len = count;
	}
	__DEBUG("Write to Kernel %d bytes\n", count-wrt_len);
	return wrt_len;
}
/*<== ECE699 */


static long cma_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
	/* routine check */

	/* check validity of the cmd */
	if (_IOC_TYPE(cmd) != CMA_IOCTL_MAGIC)
	{
		__ERROR("IOCTL Incorrect magic number\n");
		return -ENOTTY;
	}
	if (_IOC_NR(cmd) > CMA_IOCTL_MAXNR)
	{
		__ERROR("IOCTL Command is not valid\n");
		return -ENOTTY;
	}

	/* get size from userspace */
	switch (cmd)
	{
	case CMA_ALLOC_CACHED:
		__DEBUG("IOCTL command CMA_ALLOC_CACHED issued\n");
		__DEBUG("cma_ioctl() called to call cma_ioctl_alloc for %d buffer\n", *(unsigned*)arg);
		return cma_ioctl_alloc(filp, cmd, arg, CMA_ENTRY_CACHED);
	case CMA_ALLOC_NONCACHED:
		__DEBUG("IOCTL command CMA_ALLOC_NONCACHED issued\n");
		__DEBUG("cma_ioctl() called to call cma_ioctl_alloc NONCACHED for %d buffer\n", *(unsigned*)arg);
		return cma_ioctl_alloc(filp, cmd, arg, CMA_ENTRY_NONCACHED);
	case CMA_FREE:
		__DEBUG("IOCTL command CMA_FREE issued\n");
		__DEBUG("cma_ioctl() called to call cma_ioctl_free for 0x%llx buffer\n", *(unsigned long*)arg);
		return cma_ioctl_free(filp, cmd, arg);
	case CMA_GET_PHY_ADDR:
		__DEBUG("IOCTL command CMA_GET_PHY_ADDR issued\n");
		__DEBUG("cma_ioctl() called to call cma_ioctl_get_phy_addr for buffer 0x%llx \n", *(unsigned long*)arg);
		return cma_ioctl_get_phy_addr(filp, cmd, arg);
	case CMA_GET_SIZE:
		__DEBUG("IOCTL command CMA_GET_SIZE issued\n");
		__DEBUG("cma_ioctl() called to call cma_ioctl_get_size for 0x%llx buffer\n", *(unsigned long*)arg);
		return cma_ioctl_get_size(filp, cmd, arg);
	case CMA_SET_WRITE_TARGET_ADDR:
		/* get entry */
		__DEBUG("IOCTL command CMA_SET_WRITE_TARGET_ADDR issued\n");
		cma_target_entry_ptr = cma_ioctl_get_entry_from_v_usr_addr(cmd, arg);
		if (cma_target_entry_ptr == NULL)
		{
			__DEBUG("Coresponding target cma entry has not been found\n");
			return -EFAULT;
		}
		break;
	case CMA_GET_READ_SRC_ADDR:
		__DEBUG("IOCTL command CMA_GET_READ_SRC_ADDR issued\n");
		cma_src_entry_ptr = cma_ioctl_get_entry_from_v_usr_addr(cmd, arg);
		if (cma_src_entry_ptr == NULL)
		{
			__DEBUG("Coresponding source cma entry has not been found\n");
			return -EFAULT;
		}
		__DEBUG("IOCTL command CMA_GET_READ_SRC_ADDR got kernel vir_addr 0x%llx, mapped vir addr 0x%llx for phy addr 0x%x \n", \
			cma_src_entry_ptr->v_ptr, cma_src_entry_ptr->v_usr_addr, cma_src_entry_ptr->phy_addr);
		break;
	default:
		__DEBUG("This should never happen!\n");
	}

	return 0;
}

static long cma_ioctl_alloc(struct file *filp, unsigned int cmd, unsigned long arg, int cached_flag)
{
	int err;
	struct cma_entry *entry;
	__DEBUG("cma_ioctl_alloc_cached() called!\n");

	if (!access_ok((void __user *)arg, _IOC_SIZE(cmd)))
		return -EFAULT;
	if (!access_ok((void __user *)arg, _IOC_SIZE(cmd)))
		return -EFAULT;

	/* create new cma entry  */
	__DEBUG("kmalloc() called to create new cma entry!\n");
	entry = kmalloc(sizeof(struct cma_entry), GFP_KERNEL);
	//entry = kmalloc(sizeof(*entry), GFP_KERNEL);

	/* set entry params */
	__DEBUG("set entry params!\n");
	__get_user(entry->size, (typeof(&entry->size))arg);
	entry->pid = current->pid;
	entry->flags = cached_flag;
	entry->size = *((unsigned*)arg);

	/* allocate contigous memory */
	__DEBUG("Calling dma_alloc_coherent() to allocate contigous memory, size:%d\n",entry->size);
	//entry->v_ptr = dma_alloc_coherent(NULL, entry->size, &entry->phy_addr, GFP_KERNEL);
	if (device){
		device->coherent_dma_mask = DMA_BIT_MASK(32);
		//entry->v_ptr = dma_alloc_coherent(device, entry->size, &entry->phy_addr, GFP_KERNEL );
		//__DEBUG("dma_alloc_coherent() allocated contigous memory, size:%d,virtual mem addr:0x%llx phy_addr:0x%llx\n",entry->size, entry->v_ptr, entry->phy_addr );
		entry->v_ptr = dmam_alloc_coherent(device, entry->size, &entry->phy_addr, GFP_KERNEL );
		__DEBUG("dmam_alloc_coherent() allocated contigous memory, size:%d,virtual mem addr:0x%llx phy_addr:0x%llx\n",entry->size, entry->v_ptr, entry->phy_addr );
	}
	else{
		err = -ENOMEM;
		goto error_dma_alloc_coherent;
	}
	if (entry->v_ptr == NULL)
	{
		__DEBUG("dma_alloc_coherent() call error, return null!\n");
		err = -ENOMEM;
		goto error_dma_alloc_coherent;
	}

	/* add entry */
	err = cma_entry_add(entry);
	if (err)
		goto error_cma_entry_add;

	/* put physical address to user space */
	__put_user(entry->phy_addr, (typeof(&entry->phy_addr))arg);

	__DEBUG("cma_ioctl_alloc() return phy_addr:0x%llx \n", entry->phy_addr);
	return entry->phy_addr;

error_cma_entry_add:
	//dma_free_coherent(NULL, entry->size, entry->v_ptr, entry->phy_addr);
	dma_free_coherent(device, entry->size, entry->v_ptr, entry->phy_addr);
error_dma_alloc_coherent:
	kfree(entry);

	return err;
}

static long cma_ioctl_free(struct file *filp, unsigned int cmd, unsigned long arg)
{
	//dma_addr_t v_usr_addr;
	unsigned long v_usr_addr;
	__DEBUG("cma_ioctl_free() called!\n");

	if (!access_ok((void __user *)arg, _IOC_SIZE(cmd)))
		return -EFAULT;

	__get_user(v_usr_addr, (typeof(&v_usr_addr))arg);

	return cma_entry_release(v_usr_addr);
}

static struct cma_entry *cma_ioctl_get_entry_from_v_usr_addr(unsigned int cmd, unsigned long arg)
{
	unsigned long v_usr_addr;

	__DEBUG("cma_ioctl_get_entry_from_v_usr_addr() called!\n");

	/* routine check */
	if (!access_ok((void __user *)arg, _IOC_SIZE(cmd)))
		return NULL;
	if (!access_ok((void __user *)arg, _IOC_SIZE(cmd)))
		return NULL;

	/* get process user address */
	__get_user(v_usr_addr, (typeof(&v_usr_addr))arg);

	/* search for appropriate entry */
	return cma_entry_get_by_v_usr_addr(v_usr_addr);
}

static long cma_ioctl_get_phy_addr(struct file *filp, unsigned int cmd, unsigned long arg)
{

	struct cma_entry *entry;

	//__DEBUG("cma_ioctl_get_phy_addr() called!\n");

	/* get entry */
	entry = cma_ioctl_get_entry_from_v_usr_addr(cmd, arg);
	if (entry == NULL)
	{
		__DEBUG("cma entry has not been found\n");
		return -EFAULT;
	}

	/* put physical address into user space */
	__put_user(entry->phy_addr, (typeof(&entry->phy_addr))arg);

	__DEBUG("cma_ioctl_get_phy_addr() 0x%llx => 0x%lx !\n", entry->phy_addr, arg);

	return 0;
}

static long cma_ioctl_get_size(struct file *filp, unsigned int cmd, unsigned long arg)
{
	struct cma_entry *entry;

	__DEBUG("cma_ioctl_get_size() called!\n");

	/* get entry */
	entry = cma_ioctl_get_entry_from_v_usr_addr(cmd, arg);
	if (entry == NULL)
		return -EFAULT;

	/* put size into user space */
	__put_user(entry->size, (typeof(&entry->size))arg);

	return 0;
}

static int cma_init(void)
{
	int err;
	__INFO("Initializeing Contigous Memory Allocator module\n");

	/* obtain major number */
	major = register_chrdev(0, DRIVER_NODE_NAME, &fops);
	if (major < 0)
	{
		__ERROR("Failed to allocate major number\n");
		return -major;
	}

	/* create class */
	class = class_create(THIS_MODULE, DRIVER_NODE_NAME);
	if (IS_ERR(class))
	{
		__ERROR("Failed to create class\n");
		err = PTR_ERR(class);
		goto error_class_create;
	}

	/* create device node */
	device = device_create(class, NULL, MKDEV(major, 0), NULL, DRIVER_NODE_NAME);
	if (IS_ERR(device))
	{
		__ERROR("Failed to create device\n");
		err = PTR_ERR(device);
		goto error_device_create;
	}

	mutex_init(&mutex_cma_list_modify);

	return 0;

error_device_create:
	class_destroy(class);

error_class_create:
	unregister_chrdev(major, DRIVER_NODE_NAME);

	return err;
}

static void cma_exit(void)
{
	__INFO("Releasing Contigous Memory Allocator module\n");

	/* TODO: walk_list_remove_pid */

	device_destroy(class, MKDEV(major, 0));

	class_destroy(class);

	unregister_chrdev(major, DRIVER_NODE_NAME);
}

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Driver for allocating cached and noncached physically contigous memory. Exploits kernel CMA feature.");
module_init(cma_init);
module_exit(cma_exit);

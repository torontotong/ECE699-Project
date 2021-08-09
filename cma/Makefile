# The MIT License (MIT)
# 
# COPYRIGHT (C) 2017 Institute of Electronics and Computer Science (EDI), Latvia.
# AUTHOR: Rihards Novickis (rihards.novickis@edi.lv)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

PATH_SETTINGS?=$(PWD)/settings.mk

# Driver configuration file
include $(PATH_SETTINGS)

ifeq ($(KERNELRELEASE),)
# kbuild

default:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSOURCE_DIR) M=`pwd` -I/home/tliu/UW/ECE699/terasic/linux-socfpga/include cma.ko

clean:
	make -C $(KSOURCE_DIR) M=`pwd` clean

else
# run from Kernel Makefile

obj-m 	  := cma.o
ccflags-y := -DDRIVER_NODE_NAME="\"$(DRIVER_NODE_NAME)\"" \
			 -DCMA_DEBUG=$(CMA_DEBUG) \
			 -DCMA_IOC_MAGIC=$(CMA_IOC_MAGIC)
endif

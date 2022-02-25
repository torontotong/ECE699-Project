# University of Waterloo Spring 2021 ECE699 - Master of Engineering Project
## Bring up An AI accelarator on Intel DE10-Pro FPGA Development Board
1. In Sd card boot partition , make sure all files in SDCARD_BOOT folder are copied to boot partition.
2. And, the uboot enviroment should match contents in de10pro-u-boot_env.txt. This will make sure the De10pro linux will program fpga during bootup, and the fpga modules are setup with proper value.
3. After Linux system booted up on de10pro, login to the linux wtih Username=terasic, Password=123
4. Use ifconfig to determine the ip address of de10pro
5. On PC side, under TVM working folder setup environment Variables
- export TVM_PATH=$(pwd)
- export PYTHONPATH=$TVM_PATH/python:$TVM_PATH/vta/python
- export VTA_HW_PATH=$TVM_PATH/3rdparty/vta-hw
- export VTA_RPC_HOST=de10pro_ip_address
- export VTA_RPC_PORT=9091

6. On De10pro, run command "./run_setting.sh" under home directory
7. On PC , run tutorial app by running command "python vta/tutorials/vta_get_started.py"
8. Wait until application done
9. On De10pro run command "sudo rmmod cma", release allocated contigous memory
10. Repeat 6 to 9 by only changing PC side application if needed.  


export TVM_PATH=$(pwd)
#export TVM_PATH=/media/tliu/ECE699/tvm-repo/tvm
export PYTHONPATH=$TVM_PATH/python:$TVM_PATH/vta/python
export VTA_HW_PATH=$TVM_PATH/3rdparty/vta-hw
export VTA_RPC_HOST=192.168.101.$1
export VTA_RPC_PORT=9091


# ==================== COMPILATION RELATED SETTINGS ====================
# Path to the kernel sources (from "./driver", if relative path is used)
KSOURCE_DIR=/home/tliu/UW/ECE699/terasic/linux-socfpga

# Cross compiler "prepend" string
CROSS_COMPILE=aarch64-linux-gnu-

# Architecture
ARCH=arm64

# Compile with debug information
CMA_DEBUG?=1

# ==================== DRIVER RELATED SETTINGS ====================
# Node name used in "/dev" folder
DRIVER_NODE_NAME="cma"

# Unique (across system) ioctl magic number. Every ioctl interface should have one.
CMA_IOC_MAGIC=0xf2

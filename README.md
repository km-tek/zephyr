# Zephyr RTOS
https://github.com/zephyrproject-rtos/zephyr

# Documentation: 
https://docs.zephyrproject.org/2.5.0/

# Getting Started

## 1. Update OS
- `sudo apt update`
- `sudo apt upgrade`

## 2. Install dependencies

### 2.1. Use `apt` to install dependencies:
- `sudo apt install --no-install-recommends git ninja-build gperf ccache dfu-util`
- `sudo apt install --no-install-recommends python3-dev python3-pip python3-setuptools python3-tk python3-wheel`
- `sudo apt install --no-install-recommends xz-utils file device-tree-compiler wget`
- `sudo apt install --no-install-recommends make gcc gcc-multilib g++-multilib libsdl2-dev`

### 2.2. Use `snap` to install dependencies:
- `sudo snap install cmake --classic`

### 2.3. Verify the version of cmake installed on your system using:
- `cmake --version`

## 3. Get Zephyr and install Python dependencies

### 3.1. Install west, and make sure `~/.local/bin` is on your **PATH** environment variable:
- `pip3 install --user -U west`
- `echo 'export PATH=~/.local/bin:"$PATH"' >> ~/.bashrc`
- `source ~/.bashrc`

### 3.2. Get the Zephyr source code:
- `west init -m https://github.com/km-tek/zephyr.git --mr zephyr-v2.5.0 ~/zephyrkmt`
- `cd ~/zephyrkmt`
- `west update`

### 3.3. Export a Zephyr CMake package. This allows CMake to automatically load boilerplate code required for building Zephyr applications.
- `west zephyr-export`

### 3.4. Zephyr’s `scripts/requirements.txt` file declares additional Python dependencies. Install them with pip3.
- `pip3 install --user -r ~/zephyrkmt/zephyr/scripts/requirements.txt`

## 4. Install a Toolchain

### 4.1. Download the latest SDK installer:
- `cd ~`
- `wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.12.2/zephyr-sdk-0.12.2-x86_64-linux-setup.run`

### 4.2. Run the installer, installing the SDK in ~/zephyr-sdk-0.12.2:
- `chmod +x zephyr-sdk-0.12.2-x86_64-linux-setup.run`
- `./zephyr-sdk-0.12.2-x86_64-linux-setup.run -- -d ~/zephyr-sdk-0.12.2`

### 4.3. Install `udev` rules, which allow you to flash most Zephyr boards as a regular user:
- `sudo cp ~/zephyr-sdk-0.12.2/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d`
- `sudo udevadm control --reload`

## 5. Programming and Debugging Sample

### 5.1. Connect the board to your host computer using the USB port, then run a serial host program to connect with your board
- `minicom -D /dev/ttyUSB0` or `minicom -D /dev/ttyACM0`

### 5.2. Build and flash your application.
- `cd ~/zephyrkmt/zephyr`
- `west build -b <your-board-name> samples/hello_world`
- `west flash`

### 5.3. Debugging
- `west build -b <your-board-name> samples/hello_world`
- `west debug`

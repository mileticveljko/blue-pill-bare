 # BLUE-PILL BARE MINIMUM
 ## 1. Dependencies
 Install necessery packages for host sistem:  
 - On Debian/Ubuntu:  
 `apt-get install make openocd`  
 - On RHEL:  
 `dnf install make openocd`  
 
    **make** - build tool that automatically builds executable programs and libraries from source code by reading files called Makefile.   
    **openocd** - tool that provides debugging and in-system programming for embedded devices.  

Download cross-compiling toolchain for arm:  
- Download from official site [ARM Developer](https://developer.arm.com/downloads/-/gnu-rm) for your host architecture. For x86_64 use command:   
`wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2`
- Unpack it somewhere and add path to bin directory of it to PATH variable:  
`export PATH=$PATH:<path/to/toolchain/bin>`  
(It is suggested to put previous command to **~/.bashrc** file, so it will be added automatically every time new terminal instance is created)

## 2. Usage
- To build project run `make` command.  
- To flash firmware to MCU run `make flash` command.  
- To clear project run `make clean` command.

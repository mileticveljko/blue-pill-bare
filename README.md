 # BLUE-PILL BARE MINIMUM
 ## Dependencies
 Install necessery packages for host sistem:  
 - On Debian/Ubuntu:  
 ```
 apt-get install make openocd
 ```  
 - On RHEL:  
 ```
 dnf install make openocd
 ```  

**make** - build tool that automatically builds executable programs and libraries from source code by reading files called Makefile.   
**openocd** - tool that provides debugging and in-system programming for embedded devices.  

Download cross-compiling toolchain for arm:  
- Download from official site [ARM Developer](https://developer.arm.com/downloads/-/gnu-rm) for your host architecture. For x86_64 use command:   
```
wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
```
- Unpack it somewhere and add path to bin directory of it to PATH variable:  
```
export PATH=$PATH:<path/to/toolchain/bin>
```  
(It is suggested to put previous command to **~/.bashrc** file, so it will be added automatically every time new terminal instance is created)

## Usage
- Clone this repo and enter repo directory.
```
git clone https://github.com/mileticveljko/blue-pill-bare.git && cd blue-pill-bare
```
- To build project run `make` command.  
- To flash firmware with **ST-LINK** run `make flash` command.  
- To clear project run `make clean` command.

## Tutorials
### 1. Cross-compilation and Toolchains
***Cross compilation*** is a process in which cross-toolchain runs on the host machine and creates executables that run on different machine.  
***Toolchain*** or a ***Cross-compilation toolchain*** is a collection of binaries which allows you to compile, assemble, link and analize your applications.  
Meaning of binaries from **GNU Tools (GCC)** for ARM processors which can be downloaded from official ARM site ([ARM Developer](https://developer.arm.com/downloads/-/gnu-rm)):  
- **m-none-eabi-gcc**: The GNU C compiler for ARM.
- **arm-none-eabi-gcc-10.3.1**: A specific version of the GNU C compiler for ARM.
- **arm-none-eabi-as**: The GNU assembler for ARM.
- **arm-none-eabi-ld**: The GNU linker for ARM.
- **arm-none-eabi-c++**: The GNU C++ compiler for ARM
- **arm-none-eabi-g++**: Another name for the GNU C++ compiler for ARM.
- **arm-none-eabi-ar**: A utility for creating, modifying, and extracting from archives.
- **arm-none-eabi-cpp**: The C preprocessor for ARM.
- **arm-none-eabi-nm**: Lists symbols from object files.
- **arm-none-eabi-gdb**: The GNU Debugger for ARM, used to debug programs.
- **arm-none-eabi-objcopy**: Copies and translates object files.
- **arm-none-eabi-objdump**: Displays information from object files.
- **arm-none-eabi-ranlib**: Generates index to archive.
- **arm-none-eabi-readelf**: Displays information about ELF files.
- **arm-none-eabi-size**: Lists section sizes and total size.
- **arm-none-eabi-gcc-ar**: A version of ar that works with GCC.
- **arm-none-eabi-gcc-nm**: A version of nm that works with GCC.
- **arm-none-eabi-gcc-ranlib**: A version of ranlib that works with GCC.
- **arm-none-eabi-gcov:** Coverage testing tool.
- **arm-none-eabi-gcov-dump**: Dumps coverage information.
- **arm-none-eabi-gcov-tool**: Merges coverage data files.
- **arm-none-eabi-strings**: Lists printable strings from files.
- **arm-none-eabi-strip**: Discards symbols from object files.
- **arm-none-eabi-elfedit**: A tool to update ELF headers.
- **arm-none-eabi-gprof**: A performance analysis tool for profiling applications.
- **arm-none-eabi-ld.bfd**: The BFD (Binary File Descriptor) linker for ARM.
- **arm-none-eabi-lto-dump**: A tool to dump LTO (Link Time Optimization) information.
- **arm-none-eabi-addr2line**: Converts addresses into file names and line numbers, useful for debugging.
- **arm-none-eabi-c++filt**: Demangles C++ and Java symbols.
- **arm-none-eabi-gdb-add-index**: Adds an index to GDB for faster symbol lookup.
- **arm-none-eabi-gdb-add-index-py**: Python script for adding an index to GDB.
- **arm-none-eabi-gdb-py**: Python-enabled version of GDB.
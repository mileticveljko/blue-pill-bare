TOOLCHAIN_PREFIX = arm-none-eabi-
CC = $(TOOLCHAIN_PREFIX)gcc
CFLAGS = -Wall -Werror -Wno-main
LDFLAGS = -T src/devices/stm32f103/linker.ld -mcpu=cortex-m3 -mthumb -nostdlib

SRC = 	\
	src/core/app/main.c \
	src/devices/stm32f103/startup.c

all: blinky

blinky: $(SRC) build_dir
	$(CC) $(SRC) $(CFLAGS) $(LDFLAGS) -o bin/blinky.elf

build_dir:
	mkdir -p bin

.PHONY: clean
clean:
	rm -rf bin

.PHONY: flash
flash:
	openocd -f interface/stlink.cfg -f target/stm32f1x.cfg \
	-c "program bin/blinky.elf verify reset exit"
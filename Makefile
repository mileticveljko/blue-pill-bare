CC = arm-none-eabi-gcc
CFLAGS = -Wall -Werror -pedantic -mcpu=cortex-m3 -mthumb
LDFLAGS = -Tsrc/devices/stm32f103/linker.ld -nostdlib

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


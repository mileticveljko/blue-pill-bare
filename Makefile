# Compiler and flags
CC = arm-none-eabi-gcc
CFLAGS = -Wall -Werror -pedantic -mcpu=cortex-m3 -mthumb
LDFLAGS = -Tsrc/devices/stm32f103/linker.ld -nostdlib

# Source files
SRC = \
	src/core/app/main.c \
	src/devices/stm32f103/startup.c

# Output directory and binary
OUT_DIR = bin
OUT_BIN = $(OUT_DIR)/blinky.elf

# Default target
all: $(OUT_BIN)

# Build target
$(OUT_BIN): $(SRC) | $(OUT_DIR)
	$(CC) $(SRC) $(CFLAGS) $(LDFLAGS) -o $@

# Create output directory if it doesn't exist
$(OUT_DIR):
	mkdir -p $@

# Clean target
.PHONY: clean
clean:
	rm -rf $(OUT_DIR)

# Flash target
.PHONY: flash
flash:
	openocd -f interface/stlink.cfg -f target/stm32f1x.cfg \
	-c "program $(OUT_BIN) verify reset exit"
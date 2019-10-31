PWD ?= $(shell pwd)
IMAGE := kernel.elf

OUT_DIR=$(PWD)/target
COMPILE=aarch64-linux-gnu
CC=$(COMPILE)-as
LD=$(COMPILE)-ld

CFLAGS= -Wall 

build: clean prepare $(OUT_DIR)/$(IMAGE)

$(OUT_DIR)/main.o: main.s
	@$(CC) main.s -c -g -o $(OUT_DIR)/main.o
	
$(OUT_DIR)/$(IMAGE): $(OUT_DIR)/main.o
	@$(LD) $(OUT_DIR)/main.o -o $(OUT_DIR)/$(IMAGE)
	# @$(LD) $(OUT_DIR)/main.o -T default.ld -o $(OUT_DIR)/$(IMAGE)

clean:
	@rm -rf $(OUT_DIR)

prepare:
	@mkdir $(OUT_DIR)


.PHONY: all build clean prepare
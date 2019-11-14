#!/bin/bash
COMMAND="qemu-system-arm -machine virt -smp 1 -gdb tcp::8887 -cpu cortex-a15 -nographic -S -drive format=raw,file=target/kernel.elf -kernel target/kernel.elf"
PID=$(docker run -d -p 8887:8887 -v $PWD:/code -v $PWD:/build -w /code -u $(id -u):$(id -u) qemu ${COMMAND})
printf ${PID} > dpid
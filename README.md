# ARMv8 using Qemu and GDB

This repo contains information, small examples, build scripts to support
the aspiring learner in his undertaking of understanding arm v8 assembly.

## Prerequisites

You need docker, `gdb-multiarch` and `make` installed. 

install via 

```bash
apt install -y make gdb-multiarch
```

and docker, if not already installed:

```bash
curl -fsSL https://get.docker.com | sh
```

## Quickstart

_This repository contains a script to get everything setup properly. 
Run `./config.sh` to get started._

To compile everything

```bash
make
```
_this will use an image called `qemu`, which will be created using the config script_


## Visual Code Remote GDB Setup

This configuration can be used for remote debugging. Put it in `.vscode/launch.json`

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Attach Debug to Qemu",
            "type": "gdb",
            "request": "attach",
            "gdbpath": "/usr/bin/gdb-multiarch",
            "executable": "${workspaceFolder}/target/kernel.elf",
            "target": "localhost:8887",
            "remote": true,
            "cwd": "${workspaceRoot}",
            "valuesFormatting": "parseText",
            "preLaunchTask": "launch",
            "postDebugTask": "stop"
        }
    ]
}
```

additionally, we also need a `tasks.json` as well

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "type": "shell",
            "command" : "make"
        },
        {
            "label": "launch",
            "dependsOn" : "build",
            "command" : "./launch.sh"
        },
        {
            "label": "stop",
            "command" : "./stop.sh"
        }
    ]
}
```

**NOTE**: This repo already contains these scripts. 

To debug the main assembly file ( `main.s` ) you should have `Native Debug` for Visual Code installed. Pressing F5 will build the program, and start qemu with a gdb server run. 
Ending the debug session will clean up the running container. 

## Debugging

Visual Code does not have a register or memory view [yet](https://github.com/Microsoft/vscode-cpptools/issues/941). However it is possible to obtain information from the registers by typing `info registers` in the debug console during a debug sessions.

# Resources / References

1) Azeria Labs - https://azeria-labs.com/writing-arm-assembly-part-1/
2) The linker script is shamelessly stolen from [Jim Huang (JServ)](https://github.com/jserv/armv8-hello)
3) [Armv8 Programmers Guide](https://static.docs.arm.com/den0024/a/DEN0024A_v8_architecture_PG.pdf)
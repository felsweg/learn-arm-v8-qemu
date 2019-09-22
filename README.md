# ARMv8 using Qemu and GDB

This repo contains information, small examples, build scripts to support
the aspiring learning in his undertaking of understanding arm v8 assembly.

As I always wanted to learn Arm Assembly, now this is the collected effort of all
ressources I found on this topics.

## Quickstart

This repository contains a script to get everything setup properly. 
Run `./config.sh` to get started. Notes:

* It can install docker, so you can have an isolated environment


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
            "executable": "kernel.elf",
            "target": "localhost:8887",
            "remote": true,
            "cwd": "${workspaceRoot}",
            "valuesFormatting": "parseText"
        }
    ]
}
```


# Resources

[1]: Azeria Labs - https://azeria-labs.com/writing-arm-assembly-part-1/


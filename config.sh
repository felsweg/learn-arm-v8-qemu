#!/bin/bash 

set -euo pipefail

# prelude
printf "# config script install all dependencies\n"
printf "# ------\n\n"

# install docker
printf "install docker (y/n)? "
read INSTALL_DOCKER

if [[ "$INSTALL_DOCKER" == "y" ]];
then
    sudo curl -fSL https://get.docker.com | sudo sh 
fi

# build container
printf "build and install docker container? (y/n)? "
read BUILD 

if [[ "$BUILD" == "y" ]];
then
    SUFFIX=$(date +"%d%m%Y%H%M%s")
    # docker build . -t qemu-${SUFFIX} -f ${PWD}/docker/Dockerfile
    docker build . -t qemu -f ${PWD}/docker/Dockerfile
    # printf "qemu-${SUFFIX}" >> .container
fi

# qemu-system-arm -machine virt -singlestep -gdb tcp::8887 -semihosting-config enable=on,target=native -S -nographic main
# install gdb
printf "install gdb-multiarch (y/n)? "
read INSTALL_GDB
if [ "$INSTALL_GDB" == "y" ]; then
    sudo apt install -y gdb-multiarch
fi

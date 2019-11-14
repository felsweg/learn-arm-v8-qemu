FROM debian:buster-slim
EXPOSE 8887

RUN apt update && apt upgrade -y
RUN apt install -y gcc-aarch64-linux-gnu gcc-arm-none-eabi qemu-system-arm gdb-multiarch make

CMD ["/bin/bash"]

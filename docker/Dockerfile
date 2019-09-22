FROM debian:buster-slim
EXPOSE 8887

RUN apt update && apt upgrade -y
RUN apt install -y gcc-aarch64-linux-gnu qemu-system-arm gdb gdb-multiarch

CMD ["/bin/bash"]

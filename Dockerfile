FROM debian:buster-slim

RUN apt update && apt upgrade -y
RUN apt install -y gcc-aarch64-linux-gnu qemu-system-arm

CMD ["/bin/bash"]

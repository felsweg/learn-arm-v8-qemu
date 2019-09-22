CONTAINER_DIR:=$(PWD)/docker

build:
	@docker run -ti -v $(PWD):/code -v $(CONTAINER_DIR):/build -w /code -u 1001:1001 qemu make -f /build/Makefile
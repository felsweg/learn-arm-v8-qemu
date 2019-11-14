CONTAINER_DIR:=$(PWD)/docker
USER_ID:=$(shell id -u)

build:
	@docker run -ti -u $(USER_ID):$(USER_ID) -v $(PWD):/code -v $(CONTAINER_DIR):/build -w /code qemu /usr/bin/make -f /build/Makefile	
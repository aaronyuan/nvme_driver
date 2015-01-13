KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

# Autoload nvme driver at startup time, we should config:
# /etc/sysconfig/modules/nvme.modules on centos
install:
	cp -f ./nvme.ko /lib/modules/`uname -r`/kernel/drivers/block/ && depmod -a
	modprobe nvme
	touch /etc/sysconfig/modules/nvme.modules
	echo "#!/bin/bash" >> /etc/sysconfig/modules/nvme.modules
	echo "/sbin/modprobe nvme" >> /etc/sysconfig/modules/nvme.modules
	chmod +x /etc/sysconfig/modules/nvme.modules

uninstall:
	if [ -e /lib/modules/`uname -r`/kernel/drivers/block/nvme.ko ]; then \
		rm -f /lib/modules/`uname -r`/kernel/drivers/block/nvme.ko; \
	fi
	if [ -e /etc/sysconfig/modules/nvme.modules ]; then \
		rm -f /etc/sysconfig/modules/nvme.modules; \
	fi

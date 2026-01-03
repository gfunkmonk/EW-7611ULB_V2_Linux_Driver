ifneq ($(KERNELRELEASE),)
	obj-m := edimax_bt.o
	edimax_bt-y = rtk_coex.o rtk_misc.o rtk_bt.o
else
	PWD := $(shell pwd)
	KVER := $(shell uname -r)
	KDIR := /lib/modules/$(KVER)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	rm -rf *.o *.mod.c *.mod.o *.ko *.symvers *.order *.a

endif

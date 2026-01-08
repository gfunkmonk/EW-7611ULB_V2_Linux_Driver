GREEN := \033[0;32m
RED := \033[0;31m
BLUE := \033[0;34m
YELLOW := \033[0;33m
CYAN := \033[0;36m
PURPLE := \033[0;35m
RESET := \033[0m

SRC_DIR := $(shell pwd)
MDL_DIR := /lib/modules/$(shell uname -r)
DRV_DIR := $(MDL_DIR)/kernel/drivers/bluetooth
FW_DIR  := /lib/firmware/rtl_bt
BTMOD := rtk_btusb

# Kernel module configuration (must be at top level, not in targets)
obj-m := $(BTMOD).o
$(BTMOD)-y := rtk_coex.o rtk_misc.o rtk_bt.o

# Compiler flags
ccflags-y += -Wno-missing-prototypes -Wno-missing-declarations -Wno-attribute-warning

##############################################################################

.PHONY: build firmware install uninstall clean all help

build_modules : rtk_btusb.o rtk_coex.o rtk_misc.o rtk_bt.o rtk_btusb.ko

build : build_modules
	@echo "$(PURPLE)Building $(BTMOD) modules...$(RESET)"
	$(MAKE) -C $(MDL_DIR)/build M=$(PWD) modules
	@echo "$(BLUE)Modules were successfully built!"

firmware :
	@echo "$(YELLOW)Copying RTL8723D fw/config to $(FW_DIR)$(RESET)"
	@mkdir -p $(FW_DIR)
	@if [ -f rtl8723du_fw ]; then \
		cp -f rtl8723du_fw $(FW_DIR)/rtl8723du_fw; \
		echo "$(GREEN)  - Copied rtl8723du_fw"; \
	else \
		echo "$(RED)Warning: rtl8723du_fw not found!$(RESET)"; \
	fi
	@if [ -f rtl8723du_config ]; then \
		cp -f rtl8723du_config $(FW_DIR)/rtl8723du_config; \
		echo "$(GREEN)  - Copied rtl8723du_config"; \
	else \
		echo "$(RED)Warning: rtl8723du_config not found!$(RESET)"; \
	fi

install : build firmware
	@echo "$(BLUE)Installing $(BTMOD) module...$(RESET)"
	-@rmmod btusb 2>/dev/null || true
	#-@ mv $(DRV_DIR)/btusb.ko $(DRV_DIR)/btusb_bak
	-@rmmod $(BTMOD) 2>/dev/null || true
	@mkdir -p $(DRV_DIR)
	@cp -f $(BTMOD).ko $(DRV_DIR)/$(BTMOD).ko
	@depmod -a $(shell uname -r)
	@echo "$(PURPLE)✓ Install $(BTMOD) success!$(RESET)"

uninstall :
	@echo "$(BLUE)Uninstalling $(BTMOD) module...$(RESET)"
        #-@mv -n $(DRV_DIR)/btusb_bak $(DRV_DIR)/btusb.ko
	-@rmmod $(BTMOD) 2>/dev/null || true
	@rm -f $(DRV_DIR)/$(BTMOD).ko
	@depmod -a $(shell uname -r)
	@echo "$(RED)✓ Uninstall $(BTMOD) success!$(RESET)"

clean :
	@rm -rf *.o *.mod.c *.mod.o *.ko *.symvers *.order *.markers .*.o .*.cmd
	@rm -rf *.a *.cmd *.mod .*.cmd .tmp_versions Module.symvers modules.order
	@echo "$(CYAN)✓ All clean!$(RESET)"

all : install

help :
	@echo "$(PURPLE)═══════════════════════════════════════════════════════$(RESET)"
	@echo "$(PURPLE)  RTK Bluetooth USB Driver Build System$(RESET)"
	@echo "$(PURPLE)═══════════════════════════════════════════════════════$(RESET)"
	@echo "$(CYAN)Available targets:$(RESET)"
	@echo "  $(GREEN)build$(RESET)      - Compile the kernel module"
	@echo "  $(GREEN)firmware$(RESET)   - Copy firmware files to $(FW_DIR)"
	@echo "  $(GREEN)install$(RESET)    - Build, install firmware & module"
	@echo "  $(GREEN)uninstall$(RESET)  - Remove installed module"
	@echo "  $(GREEN)clean$(RESET)      - Remove build artifacts"
	@echo "  $(GREEN)all$(RESET)        - Build and install (default)"
	@echo "$(PURPLE)═══════════════════════════════════════════════════════$(RESET)"

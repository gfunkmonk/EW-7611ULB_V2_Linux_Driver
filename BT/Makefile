SRC_DIR := $(shell pwd)
MDL_DIR := /lib/modules/$(shell uname -r)
DRV_DIR := $(MDL_DIR)/kernel/drivers/bluetooth
FW_DIR := /lib/firmware/rtl_bt
BTMOD := rtk_btusb

# Kernel module configuration (must be at top level, not in targets)
obj-m := $(BTMOD).o
$(BTMOD)-y := rtk_coex.o rtk_misc.o rtk_bt.o

# Compiler flags
ccflags-y += -Wno-missing-prototypes -Wno-missing-declarations -Wno-attribute-warning

GREEN := [1;32m
RED := [1;31m
BLUE := [1;34m
YELLOW := [1;33m
CYAN := [1;36m
PURPLE := [1;35m
DKPURPLE := [0;35m
BROWN := [0;33m
TEAL := [2;36m
BWHITE := [1;37m
RESET := [0m
NC := [0m

##############################################################################

.PHONY: build firmware install uninstall clean all help

build:
	@if [ ! -f $(BTMOD).ko ]; then \
		echo "$(DKPURPLE)Building $(BTMOD) modules...$(RESET)"; \
		$(MAKE) -C $(MDL_DIR)/build M=$(PWD) modules; \
		echo "$(BLUE)✓ Modules were successfully built!$(RESET)"; \
	else \
		echo "$(RED)Modules already built, skipping compilation.$(RESET)"; \
	fi

firmware:
	@echo "$(BROWN)Copying RTL8723D fw/config to $(FW_DIR)$(RESET)"
	@mkdir -p $(FW_DIR)
	@if [ -f rtl8723du_fw ]; then \
		cp -f rtl8723du_fw $(FW_DIR)/rtl8723du_fw; \
		echo "$(GREEN)  ✓ Copied rtl8723du_fw$(RESET)"; \
	else \
		echo "$(RED)  ✗ Warning: rtl8723du_fw not found!$(RESET)"; \
	fi
	@if [ -f rtl8723du_config ]; then \
		cp -f rtl8723du_config $(FW_DIR)/rtl8723du_config; \
		echo "$(GREEN)  ✓ Copied rtl8723du_config$(RESET)"; \
	else \
		echo "$(RED)  ✗ Warning: rtl8723du_config not found!$(RESET)"; \
	fi

install: firmware
	@if [ ! -f $(BTMOD).ko ]; then \
		echo "$(BLUE)Building $(BTMOD) modules...$(RESET)"; \
		$(MAKE) -C $(MDL_DIR)/build M=$(PWD) modules; \
		echo "$(PURPLE)✓ Modules were successfully built!$(RESET)"; \
	fi
	@echo "$(TEAL)Installing $(BTMOD) module...$(RESET)"
	-@rmmod btusb 2>/dev/null || true
	-@if [ -f $(DRV_DIR)/btusb.* ]; then \
	#	mv $(DRV_DIR)/btusb.ko $(DRV_DIR)/btusb_bak 2>/dev/null || true; \
	#fi
	-@rmmod $(BTMOD) 2>/dev/null || true
	@mkdir -p $(DRV_DIR)
	@cp -f $(BTMOD).ko $(DRV_DIR)/$(BTMOD).ko
	@depmod -a $(shell uname -r)
	@echo "$(GREEN)✓ Install $(BTMOD) success!$(RESET)"

uninstall:
	@echo "$(YELLOW)Uninstalling $(BTMOD) module...$(RESET)"
	#-@if [ -f $(DRV_DIR)/btusb_bak ]; then \
	#	mv -n $(DRV_DIR)/btusb_bak $(DRV_DIR)/btusb.ko 2>/dev/null || true; \
	#fi
	-@rmmod $(BTMOD) 2>/dev/null || true
	@rm -f $(DRV_DIR)/$(BTMOD).ko
	@depmod -a $(shell uname -r)
	@echo "$(RED)✓ Uninstall $(BTMOD) success!$(RESET)"

clean:
	@rm -rf *.o *.mod.c *.mod.o *.ko *.symvers *.order *.markers .*.o .*.cmd
	@rm -rf *.a *.cmd *.mod .tmp_versions Module.symvers modules.order
	@echo "$(CYAN)✓ All clean!$(RESET)"

all: install

help:
	@echo "$(GREEN)═══════════════════════════════════════════════════════$(RESET)"
	@echo "$(GREEN)  RTK Bluetooth USB Driver Build System$(RESET)"
	@echo "$(GREEN)═══════════════════════════════════════════════════════$(RESET)"
	@echo "$(PURPLE)Available targets:$(RESET)"
	@echo "  $(BLUE)build$(RESET)      $(BWHITE)- Compile the kernel module"$(NC)
	@echo "  $(BLUE)firmware$(RESET)   $(BWHITE)- Copy firmware files to $(FW_DIR)"$(NC)
	@echo "  $(BLUE)install$(RESET)    $(BWHITE)- Build, install firmware & module"$(NC)
	@echo "  $(BLUE)uninstall$(RESET)  $(BWHITE)- Remove installed module"$(NC)
	@echo "  $(BLUE)clean$(RESET)      $(BWHITE)- Remove build artifacts"$(NC)
	@echo "  $(BLUE)all$(RESET)        $(BWHITE)- Build and install (default)"$(NC)
	@echo "  $(BLUE)help$(RESET)       $(BWHITE)- Show this help message"$(NC)
	@echo "$(GREEN)═══════════════════════════════════════════════════════$(RESET)"
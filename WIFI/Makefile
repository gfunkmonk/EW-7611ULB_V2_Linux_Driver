# Install location of module
MODDESTDIR := /lib/modules/$(shell uname -r)/kernel/drivers/net/wireless/

# Filename of finished module
MODULE_NAME := 8723bu

# Default architecture and cross-compile prefix (empty means native build)
ARCH :=
CROSS_COMPILE :=

##################### Optimization Flags ##########################
ccflags-y += $(USER_EXTRA_CFLAGS)
ccflags-y += -O2 -fno-pic -fno-pie -fno-jump-tables
#ccflags-y += -Wall -Wextra -Werror -pedantic
#ccflags-y += -Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
ldflags-y += --strip-all -O3

##################### Compile-time Warnings #######################
ccflags-y += -Wno-missing-include-dirs -Wno-missing-prototypes -Wno-missing-declarations
ccflags-y += -Wno-unused-variable -Wno-unused-value -Wno-unused-label -Wno-unused-parameter
ccflags-y += -Wno-unused -Wno-unused-function -Wno-unused-const-variable
ccflags-y += -Wno-implicit-function-declaration -Wno-implicit-fallthrough
ccflags-y += -Wno-missing-format-attribute -Wno-format-truncation
ccflags-y += -Wno-incompatible-pointer-types
ccflags-y += -Wno-misleading-indentation
ccflags-y += -Wno-old-style-declaration
ccflags-y += -Wno-discarded-qualifiers
ccflags-y += -Wno-implicit-fallthrough
ccflags-y += -Wno-cast-function-type
ccflags-y += -Wno-ignored-attributes
ccflags-y += -Wno-stringop-overread
ccflags-y += -Wno-sizeof-array-div
ccflags-y += -Wno-enum-conversion
ccflags-y += -Wno-uninitialized
ccflags-y += -Wno-empty-body
ccflags-y += -Wno-attributes
ccflags-y += -Wno-date-time
ccflags-y += -Wno-address
ccflags-y += -Wno-undef
ccflags-y += -Wno-vla

############## CLANG/LLVM  #################
ifeq ($(CC), clang)
ccflags-y += -Wno-uninitialized -Wno-enum-conversion -Wno-fortify-source
ccflags-y += -Wno-invalid-source-encoding -Wno-tautological-pointer-compare
ccflags-y += -Wno-tautological-overlap-compare -Wno-pointer-bool-conversion
ccflags-y += -Wno-misleading-indentation -Wno-self-assign -Wno-header-guard
endif

################# GCC ######################
ifeq ($(CC), gcc)
ccflags-y += -Wno-date-time     # Fix compile error && warning on gcc 4.9 and later
ccflags-y += -Wno-address -Wframe-larger-than=1648 -Wno-cast-function-type
ccflags-y += -Wno-enum-int-mismatch -Wno-stringop-overread -Wno-enum-conversion
ccflags-y += -Wno-int-in-bool-context -Wno-missing-prototypes -Wno-missing-declarations
endif

############# SOURCE & HEADERS #############
src := $(PWD)
export TopDIR ?= $(shell pwd)
ccflags-y += -I$(src)/hal/phydm -I$(src)/hal  -I$(src)/platform  -I$(src)/include -I$(src)/hal/btc

########################## WIFI IC ############################
CONFIG_RTL8723B = y
########################## Features ###########################
CONFIG_AUTOCFG_CP = n
CONFIG_MP_INCLUDED = y
CONFIG_CONCURRENT_MODE = n
CONFIG_POWER_SAVING = y
CONFIG_IPS_MODE = default
CONFIG_LPS_MODE = default
CONFIG_USB_AUTOSUSPEND = n
CONFIG_HW_PWRP_DETECTION = n
CONFIG_BT_COEXIST = y
CONFIG_WAPI_SUPPORT = n
CONFIG_EFUSE_CONFIG_FILE = y
CONFIG_EXT_CLK = n
CONFIG_TRAFFIC_PROTECT = n
CONFIG_LOAD_PHY_PARA_FROM_FILE = y
CONFIG_TXPWR_BY_RATE = y
CONFIG_TXPWR_BY_RATE_EN = n
CONFIG_TXPWR_LIMIT = y
CONFIG_TXPWR_LIMIT_EN = n
CONFIG_RTW_CHPLAN = 0xFF
CONFIG_RTW_ADAPTIVITY_EN = disable
CONFIG_RTW_ADAPTIVITY_MODE = normal
CONFIG_SIGNAL_SCALE_MAPPING = n
CONFIG_80211W = y
CONFIG_REDUCE_TX_CPU_LOADING = n
CONFIG_BR_EXT = y
CONFIG_TDLS = n
CONFIG_WIFI_MONITOR = n
CONFIG_MCC_MODE = n
CONFIG_APPEND_VENDOR_IE_ENABLE = n
CONFIG_RTW_NAPI = y
CONFIG_RTW_GRO = y
CONFIG_RTW_NETIF_SG = y
CONFIG_RTW_IPCAM_APPLICATION = n
CONFIG_RTW_REPEATER_SON = n
CONFIG_RTW_WIFI_HAL = n
CONFIG_ICMP_VOQ = n
CONFIG_IP_R_MONITOR = n #arp VOQ and high rate
# user priority mapping rule : tos, dscp
CONFIG_RTW_UP_MAPPING_RULE = tos

########################## Debug ##############################
CONFIG_RTW_DEBUG = n
CONFIG_RTW_LOG_LEVEL = 3 # default log level is _DRV_INFO_ = 2
CONFIG_PROC_DEBUG = n # enable /proc/net/rtlxxxx/ interfaces

######################## Wake On Lan ##########################
CONFIG_WOWLAN = n
#bit2: deauth, bit1: unicast, bit0: magic pkt.
CONFIG_WAKEUP_TYPE = 0x7
CONFIG_WOW_LPS_MODE = default
#bit0: disBBRF off, #bit1: Wireless remote controller (WRC)
CONFIG_SUSPEND_TYPE = 0
CONFIG_WOW_STA_MIX = n
CONFIG_GPIO_WAKEUP = n
CONFIG_WAKEUP_GPIO_IDX = default
CONFIG_HIGH_ACTIVE_DEV2HST = n
CONFIG_ONE_PIN_GPIO = n
CONFIG_HIGH_ACTIVE_HST2DEV = n
CONFIG_PNO_SUPPORT = n
CONFIG_PNO_SET_DEBUG = n
CONFIG_AP_WOWLAN = n
######### Notify SDIO Host Keep Power During Syspend ##########
CONFIG_RTW_SDIO_PM_KEEP_POWER = y
###################### MP HW TX MODE FOR VHT #######################
CONFIG_MP_VHT_HW_TX_MODE = n
########### COMMON  #################################

SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc/powerpc/; s/armv.l/arm/; s/aarch64/arm64/; s/riscv.*/riscv/; s/mipseb/mips/; s/loong.*64/loongarch/;")
ifndef ARCH
    ARCH := $(SUBARCH)
endif

CROSS_COMPILE ?=

ccflags-y += -DCONFIG_LITTLE_ENDIAN
ccflags-y += -DCONFIG_IOCTL_CFG80211
ccflags-y += -DRTW_USE_CFG80211_STA_EVENT
ccflags-y += -DCONFIG_RTL8723B

KVER ?= $(shell if [ -n "${NEW_VERSION}" ] && [ -n "${FLAVOR}" ]; then echo "${NEW_VERSION}-${FLAVOR}"; else uname -r; fi)
KSRC := /lib/modules/$(KVER)/build

NC := \033[0m
RED := \033[1;31m
GREEN := \033[1;32m
YELLOW := \033[1;33m
BLUE := \033[1;34m
PURPLE := \033[1;35m
CYAN := \033[1;36m
WHITE := \033[0;37m
DKPURPLE := \033[0;35m
BROWN := \033[0;33m
TEAL := \033[2;36m
BWHITE := \033[1;37m
RESET := \033[0m


_OS_INTFS_FILES :=	os_dep/osdep_service.o \
			os_dep/linux/os_intfs.o \
			os_dep/linux/usb_intf.o \
			os_dep/linux/usb_ops_linux.o \
			os_dep/linux/ioctl_linux.o \
			os_dep/linux/xmit_linux.o \
			os_dep/linux/mlme_linux.o \
			os_dep/linux/recv_linux.o \
			os_dep/linux/ioctl_cfg80211.o \
			os_dep/linux/rtw_cfgvendor.o \
			os_dep/linux/wifi_regd.o \
			os_dep/linux/rtw_android.o \
			os_dep/linux/rtw_proc.o \
			os_dep/linux/rtw_rhashtable.o

ifeq ($(CONFIG_MP_INCLUDED), y)
_OS_INTFS_FILES += os_dep/linux/ioctl_mp.o
endif

_HAL_INTFS_FILES :=	hal/hal_intf.o \
			hal/hal_com.o \
			hal/hal_com_phycfg.o \
			hal/hal_phy.o \
			hal/hal_dm.o \
			hal/hal_dm_acs.o \
			hal/hal_btcoex_wifionly.o \
			hal/hal_btcoex.o \
			hal/hal_mp.o \
			hal/hal_mcc.o \
			hal/hal_hci/hal_usb.o \
			hal/led/hal_led.o \
			hal/led/hal_usb_led.o

_PLATFORM_FILES := platform/platform_ops.o

########### HAL_RTL8723B #################################

_HAL_INTFS_FILES += hal/HalPwrSeqCmd.o \
					hal/rtl8723b/Hal8723BPwrSeq.o\
					hal/rtl8723b/rtl8723b_sreset.o

_HAL_INTFS_FILES +=	hal/rtl8723b/rtl8723b_hal_init.o \
			hal/rtl8723b/rtl8723b_phycfg.o \
			hal/rtl8723b/rtl8723b_rf6052.o \
			hal/rtl8723b/rtl8723b_dm.o \
			hal/rtl8723b/rtl8723b_rxdesc.o \
			hal/rtl8723b/rtl8723b_cmd.o \
			hal/rtl8723b/hal8723b_fw.o

_HAL_INTFS_FILES +=	\
			hal/rtl8723b/usb/usb_halinit.o \
			hal/rtl8723b/usb/rtl$(MODULE_NAME)_led.o \
			hal/rtl8723b/usb/rtl$(MODULE_NAME)_xmit.o \
			hal/rtl8723b/usb/rtl$(MODULE_NAME)_recv.o

_HAL_INTFS_FILES += hal/rtl8723b/usb/usb_ops.o

_HAL_INTFS_FILES +=hal/efuse/rtl8723b/HalEfuseMask8723B_USB.o

_BTC_FILES += hal/btc/halbtc8723bwifionly.o

ifeq ($(CONFIG_BT_COEXIST), y)
_BTC_FILES += hal/btc/halbtc8723b1ant.o \
				hal/btc/halbtc8723b2ant.o
endif

########### AUTO_CFG  #################################

ifeq ($(CONFIG_AUTOCFG_CP), y)
$(shell cp $(TopDIR)/autoconf_rtl8723b_usb_linux.h $(TopDIR)/include/autoconf.h)
endif

########### END OF PATH  #################################

ifeq ($(CONFIG_USB_AUTOSUSPEND), y)
ccflags-y += -DCONFIG_USB_AUTOSUSPEND
endif

ifeq ($(CONFIG_MP_INCLUDED), y)
#MODULE_NAME := $(MODULE_NAME)_mp
ccflags-y += -DCONFIG_MP_INCLUDED
endif

ifeq ($(CONFIG_CONCURRENT_MODE), y)
ccflags-y += -DCONFIG_CONCURRENT_MODE
endif

ifeq ($(CONFIG_POWER_SAVING), y)
ifneq ($(CONFIG_IPS_MODE), default)
ccflags-y += -DRTW_IPS_MODE=$(CONFIG_IPS_MODE)
endif
ifneq ($(CONFIG_LPS_MODE), default)
ccflags-y += -DRTW_LPS_MODE=$(CONFIG_LPS_MODE)
endif
ifneq ($(CONFIG_WOW_LPS_MODE), default)
ccflags-y += -DRTW_WOW_LPS_MODE=$(CONFIG_WOW_LPS_MODE)
endif
ccflags-y += -DCONFIG_POWER_SAVING
endif

ifeq ($(CONFIG_HW_PWRP_DETECTION), y)
ccflags-y += -DCONFIG_HW_PWRP_DETECTION
endif

ifeq ($(CONFIG_BT_COEXIST), y)
ccflags-y += -DCONFIG_BT_COEXIST
endif

ifeq ($(CONFIG_WAPI_SUPPORT), y)
ccflags-y += -DCONFIG_WAPI_SUPPORT
endif

ifeq ($(CONFIG_EFUSE_CONFIG_FILE), y)
ccflags-y += -DCONFIG_EFUSE_CONFIG_FILE

#EFUSE_MAP_PATH
USER_EFUSE_MAP_PATH ?=
ifneq ($(USER_EFUSE_MAP_PATH),)
ccflags-y += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8723bs.map\"
else
ccflags-y += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_$(MODULE_NAME).map\"
endif

#WIFIMAC_PATH
USER_WIFIMAC_PATH ?=
ifneq ($(USER_WIFIMAC_PATH),)
ccflags-y += -DWIFIMAC_PATH=\"$(USER_WIFIMAC_PATH)\"
else
ccflags-y += -DWIFIMAC_PATH=\"/data/wifimac.txt\"
endif
endif

ifeq ($(CONFIG_EXT_CLK), y)
ccflags-y += -DCONFIG_EXT_CLK
endif

ifeq ($(CONFIG_TRAFFIC_PROTECT), y)
ccflags-y += -DCONFIG_TRAFFIC_PROTECT
endif

ifeq ($(CONFIG_LOAD_PHY_PARA_FROM_FILE), y)
ccflags-y += -DCONFIG_LOAD_PHY_PARA_FROM_FILE
#ccflags-y += -DREALTEK_CONFIG_PATH_WITH_IC_NAME_FOLDER
ccflags-y += -DREALTEK_CONFIG_PATH=\"/lib/firmware/\"
endif

ifeq ($(CONFIG_TXPWR_BY_RATE), n)
ccflags-y += -DCONFIG_TXPWR_BY_RATE=0
else ifeq ($(CONFIG_TXPWR_BY_RATE), y)
ccflags-y += -DCONFIG_TXPWR_BY_RATE=1
endif
ifeq ($(CONFIG_TXPWR_BY_RATE_EN), n)
ccflags-y += -DCONFIG_TXPWR_BY_RATE_EN=0
else ifeq ($(CONFIG_TXPWR_BY_RATE_EN), y)
ccflags-y += -DCONFIG_TXPWR_BY_RATE_EN=1
else ifeq ($(CONFIG_TXPWR_BY_RATE_EN), auto)
ccflags-y += -DCONFIG_TXPWR_BY_RATE_EN=2
endif

ifeq ($(CONFIG_TXPWR_LIMIT), n)
ccflags-y += -DCONFIG_TXPWR_LIMIT=0
else ifeq ($(CONFIG_TXPWR_LIMIT), y)
ccflags-y += -DCONFIG_TXPWR_LIMIT=1
endif
ifeq ($(CONFIG_TXPWR_LIMIT_EN), n)
ccflags-y += -DCONFIG_TXPWR_LIMIT_EN=0
else ifeq ($(CONFIG_TXPWR_LIMIT_EN), y)
ccflags-y += -DCONFIG_TXPWR_LIMIT_EN=1
else ifeq ($(CONFIG_TXPWR_LIMIT_EN), auto)
ccflags-y += -DCONFIG_TXPWR_LIMIT_EN=2
endif

ifneq ($(CONFIG_RTW_CHPLAN), 0xFF)
ccflags-y += -DCONFIG_RTW_CHPLAN=$(CONFIG_RTW_CHPLAN)
endif

ifeq ($(CONFIG_CALIBRATE_TX_POWER_BY_REGULATORY), y)
ccflags-y += -DCONFIG_CALIBRATE_TX_POWER_BY_REGULATORY
endif

ifeq ($(CONFIG_CALIBRATE_TX_POWER_TO_MAX), y)
ccflags-y += -DCONFIG_CALIBRATE_TX_POWER_TO_MAX
endif

ifeq ($(CONFIG_RTW_ADAPTIVITY_EN), disable)
ccflags-y += -DCONFIG_RTW_ADAPTIVITY_EN=0
else ifeq ($(CONFIG_RTW_ADAPTIVITY_EN), enable)
ccflags-y += -DCONFIG_RTW_ADAPTIVITY_EN=1
endif

ifeq ($(CONFIG_RTW_ADAPTIVITY_MODE), normal)
ccflags-y += -DCONFIG_RTW_ADAPTIVITY_MODE=0
else ifeq ($(CONFIG_RTW_ADAPTIVITY_MODE), carrier_sense)
ccflags-y += -DCONFIG_RTW_ADAPTIVITY_MODE=1
endif

ifeq ($(CONFIG_SIGNAL_SCALE_MAPPING), y)
ccflags-y += -DCONFIG_SIGNAL_SCALE_MAPPING
endif

ifeq ($(CONFIG_80211W), y)
ccflags-y += -DCONFIG_IEEE80211W
endif

ifeq ($(CONFIG_WOWLAN), y)
ccflags-y += -DCONFIG_WOWLAN -DRTW_WAKEUP_EVENT=$(CONFIG_WAKEUP_TYPE)
ccflags-y += -DRTW_SUSPEND_TYPE=$(CONFIG_SUSPEND_TYPE)
ifeq ($(CONFIG_WOW_STA_MIX), y)
ccflags-y += -DRTW_WOW_STA_MIX
endif
ifeq ($(CONFIG_SDIO_HCI), y)
ccflags-y += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
endif
endif

ifeq ($(CONFIG_AP_WOWLAN), y)
ccflags-y += -DCONFIG_AP_WOWLAN
ifeq ($(CONFIG_SDIO_HCI), y)
ccflags-y += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
endif
endif

ifeq ($(CONFIG_PNO_SUPPORT), y)
ccflags-y += -DCONFIG_PNO_SUPPORT
ifeq ($(CONFIG_PNO_SET_DEBUG), y)
ccflags-y += -DCONFIG_PNO_SET_DEBUG
endif
endif

ifeq ($(CONFIG_GPIO_WAKEUP), y)
ccflags-y += -DCONFIG_GPIO_WAKEUP
ifeq ($(CONFIG_ONE_PIN_GPIO), y)
ccflags-y += -DCONFIG_RTW_ONE_PIN_GPIO
endif
ifeq ($(CONFIG_HIGH_ACTIVE_DEV2HST), y)
ccflags-y += -DHIGH_ACTIVE_DEV2HST=1
else
ccflags-y += -DHIGH_ACTIVE_DEV2HST=0
endif
endif

ifeq ($(CONFIG_HIGH_ACTIVE_HST2DEV), y)
ccflags-y += -DHIGH_ACTIVE_HST2DEV=1
else
ccflags-y += -DHIGH_ACTIVE_HST2DEV=0
endif

ifneq ($(CONFIG_WAKEUP_GPIO_IDX), default)
ccflags-y += -DWAKEUP_GPIO_IDX=$(CONFIG_WAKEUP_GPIO_IDX)
endif

ifeq ($(CONFIG_RTW_SDIO_PM_KEEP_POWER), y)
ifeq ($(CONFIG_SDIO_HCI), y)
ccflags-y += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
endif
endif

ifeq ($(CONFIG_REDUCE_TX_CPU_LOADING), y)
ccflags-y += -DCONFIG_REDUCE_TX_CPU_LOADING
endif

ifeq ($(CONFIG_BR_EXT), y)
BR_NAME = br0
ccflags-y += -DCONFIG_BR_EXT
ccflags-y += '-DCONFIG_BR_EXT_BRNAME="'$(BR_NAME)'"'
endif


ifeq ($(CONFIG_TDLS), y)
ccflags-y += -DCONFIG_TDLS
endif

ifeq ($(CONFIG_WIFI_MONITOR), y)
ccflags-y += -DCONFIG_WIFI_MONITOR
endif

ifeq ($(CONFIG_MCC_MODE), y)
ccflags-y += -DCONFIG_MCC_MODE
endif

ifeq ($(CONFIG_RTW_NAPI), y)
ccflags-y += -DCONFIG_RTW_NAPI
endif

ifeq ($(CONFIG_RTW_GRO), y)
ccflags-y += -DCONFIG_RTW_GRO
endif

ifeq ($(CONFIG_RTW_REPEATER_SON), y)
ccflags-y += -DCONFIG_RTW_REPEATER_SON
endif

ifeq ($(CONFIG_RTW_IPCAM_APPLICATION), y)
ccflags-y += -DCONFIG_RTW_IPCAM_APPLICATION
ifeq ($(CONFIG_WIFI_MONITOR), n)
ccflags-y += -DCONFIG_WIFI_MONITOR
endif
endif

ifeq ($(CONFIG_RTW_NETIF_SG), y)
ccflags-y += -DCONFIG_RTW_NETIF_SG
endif

ifeq ($(CONFIG_ICMP_VOQ), y)
ccflags-y += -DCONFIG_ICMP_VOQ
endif

ifeq ($(CONFIG_IP_R_MONITOR), y)
ccflags-y += -DCONFIG_IP_R_MONITOR
endif

ifeq ($(CONFIG_RTW_WIFI_HAL), y)
#ccflags-y += -DCONFIG_RTW_WIFI_HAL_DEBUG
ccflags-y += -DCONFIG_RTW_WIFI_HAL
ccflags-y += -DCONFIG_RTW_CFGVEDNOR_LLSTATS
ccflags-y += -DCONFIG_RTW_CFGVENDOR_RANDOM_MAC_OUI
ccflags-y += -DCONFIG_RTW_CFGVEDNOR_RSSIMONITOR
ccflags-y += -DCONFIG_RTW_CFGVENDOR_WIFI_LOGGER
endif

ifeq ($(CONFIG_MP_VHT_HW_TX_MODE), y)
ccflags-y += -DCONFIG_MP_VHT_HW_TX_MODE
ifeq ($(CONFIG_PLATFORM_I386_PC), y)
## For I386 X86 ToolChain use Hardware FLOATING
ccflags-y += -mhard-float
else
## For ARM ToolChain use Hardware FLOATING
ccflags-y += -mfloat-abi=hard
endif
endif

ifeq ($(CONFIG_APPEND_VENDOR_IE_ENABLE), y)
ccflags-y += -DCONFIG_APPEND_VENDOR_IE_ENABLE
endif

ifeq ($(CONFIG_RTW_DEBUG), y)
ccflags-y += -DCONFIG_RTW_DEBUG
ccflags-y += -DRTW_LOG_LEVEL=$(CONFIG_RTW_LOG_LEVEL)
endif

ifeq ($(CONFIG_PROC_DEBUG), y)
ccflags-y += -DCONFIG_PROC_DEBUG
endif

ifeq ($(CONFIG_RTW_UP_MAPPING_RULE), dscp)
ccflags-y += -DCONFIG_RTW_UP_MAPPING_RULE=1
else
ccflags-y += -DCONFIG_RTW_UP_MAPPING_RULE=0
endif

ccflags-y += -DDM_ODM_SUPPORT_TYPE=0x04

ifneq ($(KERNELRELEASE),)
endif
########### this part for *.mk ############################
include $(src)/hal/phydm/phydm.mk

rtk_core :=	core/rtw_cmd.o \
		core/rtw_security.o \
		core/rtw_debug.o \
		core/rtw_io.o \
		core/rtw_ioctl_query.o \
		core/rtw_ioctl_set.o \
		core/rtw_ieee80211.o \
		core/rtw_mlme.o \
		core/rtw_mlme_ext.o \
		core/rtw_mi.o \
		core/rtw_wlan_util.o \
		core/rtw_vht.o \
		core/rtw_pwrctrl.o \
		core/rtw_rf.o \
		core/rtw_chplan.o \
		core/rtw_recv.o \
		core/rtw_sta_mgt.o \
		core/rtw_ap.o \
		core/mesh/rtw_mesh.o \
		core/mesh/rtw_mesh_pathtbl.o \
		core/mesh/rtw_mesh_hwmp.o \
		core/rtw_xmit.o	\
		core/rtw_p2p.o \
		core/rtw_rson.o \
		core/rtw_tdls.o \
		core/rtw_br_ext.o \
		core/rtw_iol.o \
		core/rtw_sreset.o \
		core/rtw_btcoex_wifionly.o \
		core/rtw_btcoex.o \
		core/rtw_beamforming.o \
		core/rtw_odm.o \
		core/rtw_rm.o \
		core/rtw_rm_fsm.o \
		core/rtw_rm_util.o \
		core/efuse/rtw_efuse.o 

$(MODULE_NAME)-y += $(rtk_core)

$(MODULE_NAME)-$(CONFIG_WAPI_SUPPORT) += core/rtw_wapi.o	\
					core/rtw_wapi_sms4.o

$(MODULE_NAME)-y += $(_OS_INTFS_FILES)
$(MODULE_NAME)-y += $(_HAL_INTFS_FILES)
$(MODULE_NAME)-y += $(_PHYDM_FILES)
$(MODULE_NAME)-y += $(_BTC_FILES)
$(MODULE_NAME)-y += $(_PLATFORM_FILES)

$(MODULE_NAME)-$(CONFIG_MP_INCLUDED) += core/rtw_mp.o

$(MODULE_NAME)-$(CONFIG_MP_INCLUDED)+= core/rtw_bt_mp.o

obj-m := $(MODULE_NAME).o

all: modules strip install

modules:
	@if [ ! -f $(MODULE_NAME).ko ]; then \
		echo "$(YELLOW)Building $(MODULE_NAME) modules...$(NC)"; \
		$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd) modules; \
		echo "$(TEAL)✓ Modules were successfully built!$(NC)"; \
	else \
		echo "$(BROWN)Module $(MODULE_NAME).ko already exists, skipping compilation."; \
	fi

strip:
	$(CROSS_COMPILE)strip $(MODULE_NAME).ko --strip-unneeded

install:
	@if [ ! -f $(MODULE_NAME).ko ]; then \
		echo "$(BLUE)Building $(MODULE_NAME) modules...$(NC)"; \
		$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd) modules; \
		echo "$(RED)✓ Modules were successfully built!$(NC)"; \
	fi
	@echo "$(PURPLE)Installing $(MODULE_NAME) module...$(NC)"
	@mkdir -p $(MODDESTDIR)
	install -p -m 644 $(MODULE_NAME).ko  $(MODDESTDIR)
	/sbin/depmod -a ${KVER}

uninstall:
	@echo "$(CYAN)Uninstalling $(MODULE_NAME) module...$(NC)"
	rm -f $(MODDESTDIR)/$(MODULE_NAME).ko
	/sbin/depmod -a ${KVER}
	@echo "$(GREEN)✓ Uninstall $(MODULE_NAME) success!$(NC)"

.PHONY: modules clean

clean:
	#$(MAKE) -C $(KSRC) M=$(shell pwd) clean
	cd hal ; rm -fr */*/*/*.mod.c */*/*/*.mod */*/*/*.o */*/*/.*.cmd */*/*/*.ko
	cd hal ; rm -fr */*/*.mod.c */*/*.mod */*/*.o */*/.*.cmd */*/*.ko
	cd hal ; rm -fr */*.mod.c */*.mod */*.o */.*.cmd */*.ko
	cd hal ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	cd core ; rm -fr */*.mod.c */*.mod */*.o */.*.cmd */*.ko
	cd core ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	cd os_dep/linux ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	cd os_dep ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	cd platform ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	rm -fr Module.symvers ; rm -fr Module.markers ; rm -fr modules.order
	rm -fr *.mod.c *.mod *.o .*.cmd *.ko *~
	rm -fr .tmp_versions
	@echo "$(DKPURPLE)✓ All clean!$(NC)"

help:
	@echo "$(BLUE)═══════════════════════════════════════════════════════$(NC)"
	@echo "$(BLUE)  RTL8723DU WIFI USB Driver Build System$(NC)"
	@echo "$(BLUE)═══════════════════════════════════════════════════════$(NC)"
	@echo "$(GREEN)Available targets:$(NC)"
	@echo "  $(YELLOW)modules$(NC)    $(BWHITE)- Compile the kernel module$(NC)"
	@echo "  $(YELLOW)strip$(NC)      $(BWHITE)- remove debug symbols from .ko$(NC)"
	@echo "  $(YELLOW)install$(NC)    $(BWHITE)- Build and install module$(NC)"
	@echo "  $(YELLOW)uninstall$(NC)  $(BWHITE)- Remove installed module$(NC)"
	@echo "  $(YELLOW)clean$(NC)      $(BWHITE)- Remove build artifacts$(NC)"
	@echo "  $(YELLOW)all$(NC)        $(BWHITE)- Build, strip & install (default)$(NC)"
	@echo "  $(YELLOW)help$(NC)       $(BWHITE)- Show this help message$(NC)"
	@echo "$(BLUE)═══════════════════════════════════════════════════════$(NC)"

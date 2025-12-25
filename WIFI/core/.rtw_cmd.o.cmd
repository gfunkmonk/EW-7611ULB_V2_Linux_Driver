savedcmd_/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o := gcc-13 -Wp,-MMD,/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/.rtw_cmd.o.d -nostdinc -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h -I./ubuntu/include -include ./include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=./= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=none -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -mtune=generic -mno-red-zone -mcmodel=kernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -mharden-sls=all -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=zero -fno-stack-clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=16 -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=1024 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5 -fno-pie -O2 -Wno-unused-variable -Wno-unused-value -Wno-unused-label -Wno-unused-parameter -Wno-unused-function -Wno-unused -Wno-address -Wno-cast-function-type -Wno-uninitialized -Wno-sometimes-uninitialized -Wno-enum-conversion -Wno-vla -Wno-date-time -Wno-implicit-fallthrough -I/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include -I/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/platform -I/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/hal/btc -DCONFIG_RTL8723D -DCONFIG_AP_MODE -DCONFIG_P2P -DCONFIG_MP_INCLUDED -DCONFIG_POWER_SAVING -DCONFIG_BT_COEXIST -DCONFIG_EFUSE_CONFIG_FILE -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8723du.map\" -DWIFIMAC_PATH=\"/data/wifimac.txt\" -DCONFIG_LOAD_PHY_PARA_FROM_FILE -DREALTEK_CONFIG_PATH=\"/lib/firmware/\" -DCONFIG_TXPWR_BY_RATE=1 -DCONFIG_TXPWR_BY_RATE_EN=1 -DCONFIG_TXPWR_LIMIT=1 -DCONFIG_TXPWR_LIMIT_EN=0 -DCONFIG_RTW_ADAPTIVITY_EN=0 -DCONFIG_RTW_ADAPTIVITY_MODE=0 -DCONFIG_IEEE80211W -DCONFIG_LAYER2_ROAMING -DCONFIG_ROAMING_FLAG=0x3 -DHIGH_ACTIVE_HST2DEV=0 -DCONFIG_BR_EXT '-DCONFIG_BR_EXT_BRNAME="'br0'"' -DCONFIG_RTW_NAPI -DCONFIG_RTW_GRO -DCONFIG_RTW_NETIF_SG -DCONFIG_PROC_DEBUG -DCONFIG_RTW_UP_MAPPING_RULE=0 -DDM_ODM_SUPPORT_TYPE=0x04 -DRTW_AMSDU_MODE=0 -DCONFIG_LITTLE_ENDIAN -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -I/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/crypto -I/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/hal/phydm  -fsanitize=bounds-strict -fsanitize=shift -fsanitize=bool -fsanitize=enum  -fsanitize=signed-integer-overflow  -DMODULE  -DKBUILD_BASENAME='"rtw_cmd"' -DKBUILD_MODNAME='"8723du"' -D__KBUILD_MODNAME=kmod_8723du -c -o /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.c   ; ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --retpoline --rethunk --sls --stackval --static-call --uaccess --prefix=16   --module /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o

source_/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o := /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.c

deps_/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o := \
    $(wildcard include/config/C2H_WK) \
    $(wildcard include/config/H2CLBK) \
    $(wildcard include/config/EVENT_THREAD_MODE) \
    $(wildcard include/config/SDIO_HCI) \
    $(wildcard include/config/GSPI_HCI) \
    $(wildcard include/config/MAC_LOOPBACK_DRIVER) \
    $(wildcard include/config/CONCURRENT_MODE) \
    $(wildcard include/config/LPS_LCLK) \
    $(wildcard include/config/DFS) \
    $(wildcard include/config/LPS) \
    $(wildcard include/config/P2P_PS) \
    $(wildcard include/config/MP_INCLUDED) \
    $(wildcard include/config/AP_MODE) \
    $(wildcard include/config/80211N_HT) \
    $(wildcard include/config/80211AC_VHT) \
    $(wildcard include/config/WMMPS_STA) \
    $(wildcard include/config/RTW_80211R) \
    $(wildcard include/config/RTW_TOKEN_BASED_XMIT) \
    $(wildcard include/config/TDLS) \
    $(wildcard include/config/IEEE80211W) \
    $(wildcard include/config/REGD_SRC_FROM_OS) \
    $(wildcard include/config/80211AX_HE) \
    $(wildcard include/config/SUPPORT_STATIC_SMPS) \
    $(wildcard include/config/CTRL_TXSS_BY_TP) \
    $(wildcard include/config/LPS_CHK_BY_TP) \
    $(wildcard include/config/FW_MULTI_PORT_SUPPORT) \
    $(wildcard include/config/LPS_SLOW_TRANSITION) \
    $(wildcard include/config/DYNAMIC_DTIM) \
    $(wildcard include/config/TRAFFIC_PROTECT) \
    $(wildcard include/config/BT_COEXIST) \
    $(wildcard include/config/TDLS_AUTOSETUP) \
    $(wildcard include/config/BEAMFORMING) \
    $(wildcard include/config/ACTIVE_KEEP_ALIVE_CHECK) \
    $(wildcard include/config/RTW_MESH) \
    $(wildcard include/config/RTW_CFGVENDOR_RSSIMONITOR) \
    $(wildcard include/config/RTW_MULTI_AP) \
    $(wildcard include/config/DFS_MASTER) \
    $(wildcard include/config/IPS_CHECK_IN_WD) \
    $(wildcard include/config/MCC_MODE) \
    $(wildcard include/config/LPS_1T1R) \
    $(wildcard include/config/ANTENNA_DIVERSITY) \
    $(wildcard include/config/P2P) \
    $(wildcard include/config/IOCTL_CFG80211) \
    $(wildcard include/config/BT_COEXIST_SOCKET_TRX) \
    $(wildcard include/config/RF_POWER_TRIM) \
    $(wildcard include/config/NEW_NETDEV_HDL) \
    $(wildcard include/config/RTL8723B) \
    $(wildcard include/config/USB_HCI) \
    $(wildcard include/config/FOR_RTL8723BS_VQ0) \
    $(wildcard include/config/RTW_CUSTOMER_STR) \
    $(wildcard include/config/FW_C2H_REG) \
    $(wildcard include/config/FW_C2H_PKT) \
    $(wildcard include/config/WFD) \
    $(wildcard include/config/RTW_REPEATER_SON) \
    $(wildcard include/config/BR_EXT) \
    $(wildcard include/config/WRITE_BCN_LEN_TO_FW) \
  include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/UBSAN_SIGNED_WRAP) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  include/linux/compiler_attributes.h \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/drv_types.h \
    $(wildcard include/config/ARP_KEEP_ALIVE) \
    $(wildcard include/config/RTW_WNM) \
    $(wildcard include/config/RTW_80211K) \
    $(wildcard include/config/RTW_MBO) \
    $(wildcard include/config/RTW_WDS) \
    $(wildcard include/config/WIFI_MONITOR) \
    $(wildcard include/config/PREALLOC_RX_SKB_BUFFER) \
    $(wildcard include/config/WAPI_SUPPORT) \
    $(wildcard include/config/IOL) \
    $(wildcard include/config/WOWLAN) \
    $(wildcard include/config/TX_EARLY_MODE) \
    $(wildcard include/config/NARROWBAND_SUPPORTING) \
    $(wildcard include/config/TX_AC_LIFETIME) \
    $(wildcard include/config/RTW_AP_DATA_BMC_TO_UC) \
    $(wildcard include/config/RTW_MESH_DATA_BMC_TO_UC) \
    $(wildcard include/config/RTW_TX_NPATH_EN) \
    $(wildcard include/config/RTW_PATH_DIV) \
    $(wildcard include/config/ADAPTOR_INFO_CACHING_FILE) \
    $(wildcard include/config/LAYER2_ROAMING) \
    $(wildcard include/config/80211D) \
    $(wildcard include/config/TXPWR_LIMIT) \
    $(wildcard include/config/IEEE80211_BAND_5GHZ) \
    $(wildcard include/config/LOAD_PHY_PARA_FROM_FILE) \
    $(wildcard include/config/RTW_ACS) \
    $(wildcard include/config/BACKGROUND_NOISE_MONITOR) \
    $(wildcard include/config/RTW_NAPI) \
    $(wildcard include/config/RTW_NAPI_DYNAMIC) \
    $(wildcard include/config/RTW_GRO) \
    $(wildcard include/config/SUPPORT_TRX_SHARED) \
    $(wildcard include/config/PCI_HCI) \
    $(wildcard include/config/ADVANCE_OTA) \
    $(wildcard include/config/FW_OFFLOAD_PARAM_INIT) \
    $(wildcard include/config/DYNAMIC_SOML) \
    $(wildcard include/config/FW_HANDLE_TXBCN) \
    $(wildcard include/config/TDMADIG) \
    $(wildcard include/config/RTL8822C_XCAP_NEW_POLICY) \
    $(wildcard include/config/DBG_COUNTER) \
    $(wildcard include/config/CLIENT_PORT_CFG) \
    $(wildcard include/config/IFACE_NUMBER) \
    $(wildcard include/config/PROTSEL_MACSLEEP) \
    $(wildcard include/config/DFS_SLAVE_WITH_RADAR_DETECT) \
    $(wildcard include/config/MBSSID_CAM) \
    $(wildcard include/config/HW_P0_TSF_SYNC) \
    $(wildcard include/config/RTL8814B) \
    $(wildcard include/config/SDIO_INDIRECT_ACCESS) \
    $(wildcard include/config/SYSON_INDIRECT_ACCESS) \
    $(wildcard include/config/SUPPORT_MULTI_BCN) \
    $(wildcard include/config/SWTIMER_BASED_TXBCN) \
    $(wildcard include/config/RTW_WIFI_HAL) \
    $(wildcard include/config/SDIO_TX_ENABLE_AVAL_INT) \
    $(wildcard include/config/USB_VENDOR_REQ_MUTEX) \
    $(wildcard include/config/USB_VENDOR_REQ_BUFFER_PREALLOC) \
    $(wildcard include/config/PLATFORM_RTK129X) \
    $(wildcard include/config/RTW_TPT_MODE) \
    $(wildcard include/config/PROTSEL_PORT) \
    $(wildcard include/config/PROTSEL_ATIMDTIM) \
    $(wildcard include/config/TSF_SYNC) \
    $(wildcard include/config/GPIO_API) \
    $(wildcard include/config/XMIT_THREAD_MODE) \
    $(wildcard include/config/RECV_THREAD_MODE) \
    $(wildcard include/config/PLATFORM_CMAP_INTFS) \
    $(wildcard include/config/SUPPORT_FIFO_DUMP) \
    $(wildcard include/config/TX_AMSDU) \
    $(wildcard include/config/RTW_CFGVENDOR_RANDOM_MAC_OUI) \
    $(wildcard include/config/RTW_SCAN_RAND) \
    $(wildcard include/config/PNO_SUPPORT) \
    $(wildcard include/config/PNO_SET_DEBUG) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/drv_conf.h \
    $(wildcard include/config/RSSI_PRIORITY) \
    $(wildcard include/config/AP) \
    $(wildcard include/config/RTW_REPEATER_SON_ID) \
    $(wildcard include/config/RTW_REPEATER_SON_ROOT) \
    $(wildcard include/config/ROAMING_FLAG) \
    $(wildcard include/config/POWER_SAVING) \
    $(wildcard include/config/RTW_ROAM_QUICKSCAN) \
    $(wildcard include/config/RTW_ROAM_QUICKSCAN_TH) \
    $(wildcard include/config/RTW_ANDROID) \
    $(wildcard include/config/RADIO_WORK) \
    $(wildcard include/config/RTW_WIFI_HAL_DEBUG) \
    $(wildcard include/config/RTW_CFGVENDOR_LLSTATS) \
    $(wildcard include/config/RTW_CFGVENDOR_WIFI_LOGGER) \
    $(wildcard include/config/RTW_CFGVENDOR_WIFI_OFFLOAD) \
    $(wildcard include/config/RTW_HOSTAPD_ACS) \
    $(wildcard include/config/KERNEL_PATCH_EXTERNAL_AUTH) \
    $(wildcard include/config/RTW_ABORT_SCAN) \
    $(wildcard include/config/VALIDATE_SSID) \
    $(wildcard include/config/SIGNAL_DISPLAY_DBM) \
    $(wildcard include/config/HAS_EARLYSUSPEND) \
    $(wildcard include/config/RESUME_IN_WORKQUEUE) \
    $(wildcard include/config/ANDROID_POWER) \
    $(wildcard include/config/WAKELOCK) \
    $(wildcard include/config/VENDOR_REQ_RETRY) \
    $(wildcard include/config/MONITOR_MODE_XMIT) \
    $(wildcard include/config/CUSTOMER_ALIBABA_GENERAL) \
    $(wildcard include/config/CUSTOMER01_SMART_ANTENNA) \
    $(wildcard include/config/RTW_DATA_BMC_TO_UC) \
    $(wildcard include/config/LIMITED_AP_NUM) \
    $(wildcard include/config/RTW_AP_SRC_B2U_FLAGS) \
    $(wildcard include/config/RTW_AP_FWD_B2U_FLAGS) \
    $(wildcard include/config/RTW_UNASOC_STA_MODE_OF_STYPE) \
    $(wildcard include/config/RTW_NLRTW) \
    $(wildcard include/config/RTW_MESH_ACNODE_PREVENT) \
    $(wildcard include/config/RTW_MESH_OFFCH_CAND) \
    $(wildcard include/config/RTW_MESH_PEER_BLACKLIST) \
    $(wildcard include/config/RTW_MESH_CTO_MGATE_BLACKLIST) \
    $(wildcard include/config/RTW_MESH_CTO_MGATE_CARRIER) \
    $(wildcard include/config/RTW_MPM_TX_IES_SYNC_BSS) \
    $(wildcard include/config/RTW_MESH_AEK) \
    $(wildcard include/config/RTW_MSRC_B2U_FLAGS) \
    $(wildcard include/config/RTW_MFWD_B2U_FLAGS) \
    $(wildcard include/config/SCAN_BACKOP) \
    $(wildcard include/config/TX_ACLT_FLAGS) \
    $(wildcard include/config/TX_ACLT_CONF_DEFAULT) \
    $(wildcard include/config/TX_ACLT_CONF_AP_M2U) \
    $(wildcard include/config/TX_ACLT_CONF_MESH) \
    $(wildcard include/config/RTW_HIQ_FILTER) \
    $(wildcard include/config/RTW_ADAPTIVITY_EN) \
    $(wildcard include/config/RTW_ADAPTIVITY_MODE) \
    $(wildcard include/config/RTW_ADAPTIVITY_TH_L2H_INI) \
    $(wildcard include/config/RTW_ADAPTIVITY_TH_EDCCA_HL_DIFF) \
    $(wildcard include/config/RTW_EXCL_CHS) \
    $(wildcard include/config/RTL8821A) \
    $(wildcard include/config/RTL8821C) \
    $(wildcard include/config/RTL8812A) \
    $(wildcard include/config/RTL8822B) \
    $(wildcard include/config/RTL8822C) \
    $(wildcard include/config/RTL8814A) \
    $(wildcard include/config/RTL8723F) \
    $(wildcard include/config/RTW_DFS_REGION_DOMAIN) \
    $(wildcard include/config/TXPWR_BY_RATE_EN) \
    $(wildcard include/config/TXPWR_LIMIT_EN) \
    $(wildcard include/config/RTW_CHPLAN) \
    $(wildcard include/config/CALIBRATE_TX_POWER_BY_REGULATORY) \
    $(wildcard include/config/CALIBRATE_TX_POWER_TO_MAX) \
    $(wildcard include/config/RTW_REGD_SRC) \
    $(wildcard include/config/IOCTL_WEXT) \
    $(wildcard include/config/RTW_IPCAM_APPLICATION) \
    $(wildcard include/config/RTW_CUSTOMIZE_BEEDCA) \
    $(wildcard include/config/RTW_CUSTOMIZE_BWMODE) \
    $(wildcard include/config/RTW_CUSTOMIZE_RLSTA) \
    $(wildcard include/config/CHECK_SPECIFIC_IE_CONTENT) \
    $(wildcard include/config/CUSTOMER_EZVIZ_CHIME2) \
    $(wildcard include/config/RTL8192E) \
    $(wildcard include/config/RTL8192F) \
    $(wildcard include/config/EXTEND_LOWRATE_TXOP) \
    $(wildcard include/config/RTW_RX_AMPDU_SZ_LIMIT_1SS) \
    $(wildcard include/config/RTW_RX_AMPDU_SZ_LIMIT_2SS) \
    $(wildcard include/config/RTW_RX_AMPDU_SZ_LIMIT_3SS) \
    $(wildcard include/config/RTW_RX_AMPDU_SZ_LIMIT_4SS) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_2G_A) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_2G_B) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_2G_C) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_2G_D) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_5G_A) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_5G_B) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_5G_C) \
    $(wildcard include/config/RTW_TARGET_TX_PWR_5G_D) \
    $(wildcard include/config/RTW_ANTENNA_GAIN) \
    $(wildcard include/config/RTW_AMPLIFIER_TYPE_2G) \
    $(wildcard include/config/RTW_AMPLIFIER_TYPE_5G) \
    $(wildcard include/config/RTW_RFE_TYPE) \
    $(wildcard include/config/RTW_GLNA_TYPE) \
    $(wildcard include/config/RTW_PLL_REF_CLK_SEL) \
    $(wildcard include/config/RTL8188E) \
    $(wildcard include/config/RTL8188F) \
    $(wildcard include/config/RTL8188GTV) \
    $(wildcard include/config/RTL8710B) \
    $(wildcard include/config/RTL8703B) \
    $(wildcard include/config/RTL8723D) \
    $(wildcard include/config/HWMPCAP_GEN1) \
    $(wildcard include/config/HWMPCAP_GEN2) \
    $(wildcard include/config/HWMPCAP_GEN3) \
    $(wildcard include/config/MI_WITH_MBSSID_CAM) \
    $(wildcard include/config/RUNTIME_PORT_SWITCH) \
    $(wildcard include/config/PORT_BASED_TXBCN) \
    $(wildcard include/config/PORT_BASED_HIQ) \
    $(wildcard include/config/MI_UNIQUE_MACADDR_BIT) \
    $(wildcard include/config/WOW_PATTERN_HW_CAM) \
    $(wildcard include/config/TSF_UPDATE_PAUSE_FACTOR) \
    $(wildcard include/config/TSF_UPDATE_RESTORE_FACTOR) \
    $(wildcard include/config/DEAUTH_BEFORE_CONNECT) \
    $(wildcard include/config/WEXT_DONT_JOIN_BYSSID) \
    $(wildcard include/config/DOSCAN_IN_BUSYTRAFFIC) \
    $(wildcard include/config/PHDYM_FW_FIXRATE) \
    $(wildcard include/config/RTW_SDIO_KEEP_IRQ) \
    $(wildcard include/config/USB_RX_AGGREGATION) \
    $(wildcard include/config/IPS) \
    $(wildcard include/config/IPS_MODE) \
    $(wildcard include/config/LPS_PG) \
    $(wildcard include/config/LPS_PG_DDMA) \
    $(wildcard include/config/LPS_MODE) \
    $(wildcard include/config/WAR_OFFLOAD) \
    $(wildcard include/config/OFFLOAD_MDNS_V4) \
    $(wildcard include/config/OFFLOAD_MDNS_V6) \
    $(wildcard include/config/PCI_BCN_POLLING) \
    $(wildcard include/config/BCN_ICF) \
    $(wildcard include/config/RTW_MGMT_QUEUE) \
    $(wildcard include/config/PCI_MSI) \
    $(wildcard include/config/RTW_PCI_MSI_DISABLE) \
    $(wildcard include/config/PCI_DYNAMIC_ASPM_L1_LATENCY) \
    $(wildcard include/config/PCI_DYNAMIC_ASPM_LINK_CTRL) \
    $(wildcard include/config/PCI_DYNAMIC_ASPM) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/autoconf.h \
    $(wildcard include/config/FOR_RTL8723DU_VQ0) \
    $(wildcard include/config/RECV_REORDERING_CTRL) \
    $(wildcard include/config/CFG80211_FORCE_COMPATIBLE_2_6_37_UNDER) \
    $(wildcard include/config/DEBUG_CFG80211) \
    $(wildcard include/config/DRV_ISSUE_PROV_REQ) \
    $(wildcard include/config/SET_SCAN_DENY_TIMER) \
    $(wildcard include/config/NATIVEAP_MLME) \
    $(wildcard include/config/HOSTAPD_MLME) \
    $(wildcard include/config/FIND_BEST_CHANNEL) \
    $(wildcard include/config/NO_WIRELESS_HANDLERS) \
    $(wildcard include/config/AUTO_AP_MODE) \
    $(wildcard include/config/P2P_REMOVE_GROUP_INFO) \
    $(wildcard include/config/DBG_P2P) \
    $(wildcard include/config/P2P_OP_CHK_SOCIAL_CH) \
    $(wildcard include/config/CFG80211_ONECHANNEL_UNDER_CONCURRENT) \
    $(wildcard include/config/P2P_CHK_INVITE_CH_LIST) \
    $(wildcard include/config/P2P_INVITE_IOT) \
    $(wildcard include/config/TDLS_DRIVER_SETUP) \
    $(wildcard include/config/TDLS_AUTOCHECKALIVE) \
    $(wildcard include/config/TDLS_CH_SW) \
    $(wildcard include/config/TSF_RESET_OFFLOAD) \
    $(wildcard include/config/RTW_LED) \
    $(wildcard include/config/RTW_HW_LED) \
    $(wildcard include/config/RTW_SW_LED) \
    $(wildcard include/config/RTW_LED_HANDLED_BY_CMD_THREAD) \
    $(wildcard include/config/XMIT_ACK) \
    $(wildcard include/config/USB_TX_AGGREGATION) \
    $(wildcard include/config/GLOBAL_UI_PID) \
    $(wildcard include/config/OUT_EP_WIFI_MODE) \
    $(wildcard include/config/SUPPORT_USB_INT) \
    $(wildcard include/config/USB_INTERRUPT_IN_PIPE) \
    $(wildcard include/config/REDUCE_USB_TX_INT) \
    $(wildcard include/config/USE_USB_BUFFER_ALLOC_XX) \
    $(wildcard include/config/USE_USB_BUFFER_ALLOC_TX) \
    $(wildcard include/config/USE_USB_BUFFER_ALLOC_RX) \
    $(wildcard include/config/USB_VENDOR_REQ_BUFFER_DYNAMIC_ALLOCATE) \
    $(wildcard include/config/USB_SUPPORT_ASYNC_VDN_REQ) \
    $(wildcard include/config/SKB_COPY) \
    $(wildcard include/config/EASY_REPLACEMENT) \
    $(wildcard include/config/NEW_SIGNAL_STAT_PROCESS) \
    $(wildcard include/config/EMBEDDED_FWIMG) \
    $(wildcard include/config/FILE_FWIMG) \
    $(wildcard include/config/LONG_DELAY_ISSUE) \
    $(wildcard include/config/RX_PACKET_APPEND_FCS) \
    $(wildcard include/config/MINIMAL_MEMORY_USAGE) \
    $(wildcard include/config/MP_IWPRIV_SUPPORT) \
    $(wildcard include/config/CHECK_LEAVE_LPS) \
    $(wildcard include/config/DETECT_CPWM_BY_POLLING) \
    $(wildcard include/config/LPS_RPWM_TIMER) \
    $(wildcard include/config/LPS_LCLK_WD_TIMER) \
    $(wildcard include/config/SWLPS_IN_IPS) \
    $(wildcard include/config/FWLPS_IN_IPS) \
    $(wildcard include/config/GTK_OL) \
    $(wildcard include/config/GPIO_WAKEUP) \
    $(wildcard include/config/INTERRUPT_BASED_TXBCN) \
    $(wildcard include/config/INTERRUPT_BASED_TXBCN_EARLY_INT) \
    $(wildcard include/config/INTERRUPT_BASED_TXBCN_BCN_OK_ERR) \
    $(wildcard include/config/PREALLOC_RECV_SKB) \
    $(wildcard include/config/FIX_NR_BULKIN_BUFFER) \
    $(wildcard include/config/HW_ANTENNA_DIVERSITY) \
    $(wildcard include/config/DEBUG) \
    $(wildcard include/config/DIS_UPHY) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_ic_cfg.h \
    $(wildcard include/config/MULTIDRV) \
    $(wildcard include/config/TXPWR_PG_WITH_PWR_IDX) \
    $(wildcard include/config/BEAMFORMER_FW_NDPA) \
    $(wildcard include/config/RTS_FULL_BW) \
    $(wildcard include/config/RTW_MAC_HIDDEN_RPT) \
    $(wildcard include/config/AMPDU_PRETX_CD) \
    $(wildcard include/config/P2P_PS_NOA_USE_MACID_SLEEP) \
    $(wildcard include/config/NB_VALUE) \
    $(wildcard include/config/WOW_PATTERN_IN_TXFIFO) \
    $(wildcard include/config/STOP_RESUME_BCN_BY_TXPAUSE) \
    $(wildcard include/config/FW_CORRECT_BCN) \
    $(wildcard include/config/FW_OFFLOAD_SET_TXPWR_IDX) \
    $(wildcard include/config/AP_PORT_SWAP) \
    $(wildcard include/config/TCP_CSUM_OFFLOAD_TX) \
    $(wildcard include/config/RTW_NETIF_SG) \
    $(wildcard include/config/TCP_CSUM_OFFLOAD_RX) \
    $(wildcard include/config/MCC_MODE_V2) \
    $(wildcard include/config/MCC_PHYDM_OFFLOAD) \
    $(wildcard include/config/TDLS_CH_SW_V2) \
    $(wildcard include/config/BCN_RECV_TIME) \
    $(wildcard include/config/LPS_ACK) \
    $(wildcard include/config/NO_FW) \
    $(wildcard include/config/BT_EFUSE_MASK) \
    $(wildcard include/config/TXPWR_PG_WITH_TSSI_OFFSET) \
    $(wildcard include/config/SUPPORT_DYNAMIC_TXPWR) \
    $(wildcard include/config/PHY_CAPABILITY_QUERY) \
    $(wildcard include/config/HAS_HW_VAR_BCN_CTRL_ADDR) \
    $(wildcard include/config/HAS_HW_VAR_BCN_FUNC) \
    $(wildcard include/config/HAS_HW_VAR_MLME_DISCONNECT) \
    $(wildcard include/config/HAS_HW_VAR_MLME_JOIN) \
    $(wildcard include/config/HAS_HW_VAR_CORRECT_TSF) \
    $(wildcard include/config/HAS_TX_BEACON_PAUSE) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/basic_types.h \
  include/generated/uapi/linux/version.h \
  include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  include/uapi/linux/types.h \
  arch/x86/include/generated/uapi/asm/types.h \
  include/uapi/asm-generic/types.h \
  include/asm-generic/int-ll64.h \
  include/uapi/asm-generic/int-ll64.h \
  arch/x86/include/uapi/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/uapi/asm-generic/bitsperlong.h \
  include/uapi/linux/posix_types.h \
  include/linux/stddef.h \
  include/uapi/linux/stddef.h \
  arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/X86_32) \
  arch/x86/include/uapi/asm/posix_types_64.h \
  include/uapi/asm-generic/posix_types.h \
  include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  include/linux/container_of.h \
  include/linux/build_bug.h \
  include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
  arch/x86/include/generated/asm/rwonce.h \
  include/asm-generic/rwonce.h \
  include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  include/linux/const.h \
  include/vdso/const.h \
  include/uapi/linux/const.h \
  arch/x86/include/asm/barrier.h \
  arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
  include/linux/stringify.h \
  arch/x86/include/asm/asm.h \
  arch/x86/include/asm/extable_fixup_types.h \
  arch/x86/include/asm/nops.h \
  include/asm-generic/barrier.h \
  include/linux/stat.h \
  arch/x86/include/uapi/asm/stat.h \
  include/uapi/linux/stat.h \
  include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  include/uapi/linux/kernel.h \
  include/uapi/linux/sysinfo.h \
  arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
  arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/MITIGATION_RETHUNK) \
    $(wildcard include/config/MITIGATION_SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
    $(wildcard include/config/UML) \
  arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
  include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  include/linux/math.h \
  arch/x86/include/asm/div64.h \
  include/asm-generic/div64.h \
  include/vdso/math64.h \
  include/linux/time64.h \
  include/vdso/time64.h \
  include/uapi/linux/time.h \
  include/uapi/linux/time_types.h \
  include/linux/time32.h \
  include/linux/timex.h \
  include/uapi/linux/timex.h \
  include/uapi/linux/param.h \
  arch/x86/include/generated/uapi/asm/param.h \
  include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  include/uapi/asm-generic/param.h \
  arch/x86/include/asm/timex.h \
    $(wildcard include/config/X86_TSC) \
  arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/VM86) \
    $(wildcard include/config/X86_USER_SHADOW_STACK) \
    $(wildcard include/config/USE_X86_SEG_SUPPORT) \
    $(wildcard include/config/PARAVIRT_XXL) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/MITIGATION_PAGE_TABLE_ISOLATION) \
  arch/x86/include/uapi/asm/processor-flags.h \
  include/linux/mem_encrypt.h \
    $(wildcard include/config/ARCH_HAS_MEM_ENCRYPT) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  arch/x86/include/asm/mem_encrypt.h \
    $(wildcard include/config/X86_MEM_ENCRYPT) \
  include/linux/init.h \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  include/linux/cc_platform.h \
    $(wildcard include/config/ARCH_HAS_CC_PLATFORM) \
  arch/x86/include/asm/math_emu.h \
  arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/IA32_EMULATION) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
  arch/x86/include/asm/segment.h \
    $(wildcard include/config/XEN_PV) \
  arch/x86/include/asm/page_types.h \
    $(wildcard include/config/PAGE_SHIFT) \
    $(wildcard include/config/PHYSICAL_START) \
    $(wildcard include/config/PHYSICAL_ALIGN) \
    $(wildcard include/config/DYNAMIC_PHYSICAL_MASK) \
  arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/DYNAMIC_MEMORY_LAYOUT) \
    $(wildcard include/config/X86_5LEVEL) \
    $(wildcard include/config/RANDOMIZE_BASE) \
  arch/x86/include/asm/kaslr.h \
    $(wildcard include/config/RANDOMIZE_MEMORY) \
  arch/x86/include/uapi/asm/ptrace.h \
  arch/x86/include/uapi/asm/ptrace-abi.h \
  arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/ZERO_CALL_USED_REGS) \
    $(wildcard include/config/PARAVIRT_DEBUG) \
  arch/x86/include/asm/desc_defs.h \
  arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/X86_INTEL_MEMORY_PROTECTION_KEYS) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PROC_FS) \
  arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/KMSAN) \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/SPARSEMEM) \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
  arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/MITIGATION_CALL_DEPTH_TRACKING) \
    $(wildcard include/config/NOINSTR_VALIDATION) \
    $(wildcard include/config/MITIGATION_UNRET_ENTRY) \
    $(wildcard include/config/MITIGATION_SRSO) \
    $(wildcard include/config/MITIGATION_IBPB_ENTRY) \
  include/linux/static_key.h \
  include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  arch/x86/include/asm/jump_label.h \
    $(wildcard include/config/HAVE_JUMP_LABEL_HACK) \
  include/linux/objtool.h \
    $(wildcard include/config/FRAME_POINTER) \
  include/linux/objtool_types.h \
  arch/x86/include/asm/cpufeatures.h \
  arch/x86/include/asm/required-features.h \
    $(wildcard include/config/X86_MINIMUM_CPU_FAMILY) \
    $(wildcard include/config/MATH_EMULATION) \
    $(wildcard include/config/X86_CMPXCHG64) \
    $(wildcard include/config/X86_CMOV) \
    $(wildcard include/config/X86_P6_NOP) \
    $(wildcard include/config/MATOM) \
  arch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/X86_UMIP) \
    $(wildcard include/config/ADDRESS_MASKING) \
    $(wildcard include/config/INTEL_IOMMU_SVM) \
    $(wildcard include/config/X86_SGX) \
    $(wildcard include/config/INTEL_TDX_GUEST) \
    $(wildcard include/config/X86_FRED) \
    $(wildcard include/config/KVM_AMD_SEV) \
  arch/x86/include/asm/msr-index.h \
  include/linux/bits.h \
  include/vdso/bits.h \
  include/uapi/linux/bits.h \
  arch/x86/include/asm/unwind_hints.h \
  arch/x86/include/asm/orc_types.h \
  arch/x86/include/uapi/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/uapi/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  include/uapi/linux/swab.h \
  arch/x86/include/uapi/asm/swab.h \
  include/linux/byteorder/generic.h \
  arch/x86/include/asm/percpu.h \
    $(wildcard include/config/X86_64_SMP) \
    $(wildcard include/config/CC_HAS_NAMED_AS) \
  include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  include/linux/threads.h \
    $(wildcard include/config/NR_CPUS) \
    $(wildcard include/config/BASE_SMALL) \
  include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  arch/x86/include/asm/current.h \
  arch/x86/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  arch/x86/include/asm/GEN-for-each-reg.h \
  arch/x86/include/asm/spinlock_types.h \
  include/asm-generic/qspinlock_types.h \
  include/asm-generic/qrwlock_types.h \
  arch/x86/include/asm/proto.h \
  arch/x86/include/uapi/asm/ldt.h \
  arch/x86/include/uapi/asm/sigcontext.h \
  arch/x86/include/asm/cpuid.h \
  arch/x86/include/asm/string.h \
  arch/x86/include/asm/string_64.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  arch/x86/include/asm/page.h \
  arch/x86/include/asm/page_64.h \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/X86_VSYSCALL_EMULATION) \
  include/linux/kmsan-checks.h \
  include/linux/range.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
  include/linux/pfn.h \
  include/asm-generic/getorder.h \
  include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  include/linux/bitops.h \
  include/linux/typecheck.h \
  include/asm-generic/bitops/generic-non-atomic.h \
  arch/x86/include/asm/bitops.h \
  arch/x86/include/asm/rmwcc.h \
  include/linux/args.h \
  include/asm-generic/bitops/sched.h \
  arch/x86/include/asm/arch_hweight.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/instrumented-atomic.h \
  include/linux/instrumented.h \
  include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  include/asm-generic/bitops/instrumented-lock.h \
  include/asm-generic/bitops/le.h \
  include/asm-generic/bitops/ext2-atomic-setbit.h \
  arch/x86/include/asm/special_insns.h \
  include/linux/errno.h \
  include/uapi/linux/errno.h \
  arch/x86/include/generated/uapi/asm/errno.h \
  include/uapi/asm-generic/errno.h \
  include/uapi/asm-generic/errno-base.h \
  include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  include/linux/irqflags_types.h \
  include/linux/cleanup.h \
  arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/DEBUG_ENTRY) \
  arch/x86/include/asm/fpu/types.h \
  arch/x86/include/asm/vmxfeatures.h \
  arch/x86/include/asm/vdso/processor.h \
  arch/x86/include/asm/shstk.h \
  include/linux/personality.h \
  include/uapi/linux/personality.h \
  include/linux/err.h \
  arch/x86/include/asm/tsc.h \
  arch/x86/include/asm/cpufeature.h \
  arch/x86/include/asm/msr.h \
  arch/x86/include/asm/cpumask.h \
  include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
  include/linux/stdarg.h \
  include/linux/align.h \
  include/linux/array_size.h \
  include/linux/limits.h \
  include/uapi/linux/limits.h \
  include/vdso/limits.h \
  include/linux/hex.h \
  include/linux/kstrtox.h \
  include/linux/minmax.h \
  include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  include/linux/kern_levels.h \
  include/linux/ratelimit_types.h \
  include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  include/linux/once_lite.h \
  include/linux/dynamic_debug.h \
  include/linux/sprintf.h \
  include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  include/linux/instruction_pointer.h \
  include/linux/wordpart.h \
  include/linux/bitmap.h \
  include/linux/find.h \
  include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  include/linux/overflow.h \
  include/uapi/linux/string.h \
  include/linux/fortify-string.h \
    $(wildcard include/config/CC_HAS_KASAN_MEMINTRINSIC_PREFIX) \
    $(wildcard include/config/GENERIC_ENTRY) \
  include/linux/bitfield.h \
  include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  arch/x86/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  include/linux/instrumentation.h \
  include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  include/linux/bitmap-str.h \
  include/linux/cpumask_types.h \
  include/linux/atomic.h \
  arch/x86/include/asm/atomic.h \
  arch/x86/include/asm/cmpxchg.h \
  arch/x86/include/asm/cmpxchg_64.h \
  arch/x86/include/asm/atomic64_64.h \
  include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  include/linux/atomic/atomic-long.h \
  include/linux/atomic/atomic-instrumented.h \
  include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
    $(wildcard include/config/SLAB_OBJ_EXT) \
  include/linux/numa.h \
    $(wildcard include/config/NODES_SHIFT) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  arch/x86/include/uapi/asm/msr.h \
  include/uapi/linux/ioctl.h \
  arch/x86/include/generated/uapi/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  include/uapi/asm-generic/ioctl.h \
  arch/x86/include/asm/shared/msr.h \
  include/linux/percpu.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
  arch/x86/include/asm/preempt.h \
  include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
  include/linux/smp_types.h \
  include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/HARDENED_USERCOPY) \
    $(wildcard include/config/SH) \
  include/linux/restart_block.h \
  arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/COMPAT) \
  arch/x86/include/asm/smp.h \
    $(wildcard include/config/DEBUG_NMI_SELFTEST) \
  include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/CPU_SUP_INTEL) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DEBUG_MUTEXES) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/USER_EVENTS) \
  include/uapi/linux/sched.h \
  include/linux/pid_types.h \
  include/linux/sem_types.h \
  include/linux/shm.h \
  arch/x86/include/asm/shmparam.h \
  include/linux/kmsan_types.h \
  include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  include/linux/osq_lock.h \
  include/linux/spinlock_types.h \
  include/linux/rwlock_types.h \
  include/linux/plist_types.h \
  include/linux/hrtimer_types.h \
  include/linux/timerqueue_types.h \
  include/linux/rbtree_types.h \
  include/linux/timer_types.h \
  include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  include/linux/nodemask_types.h \
  include/linux/refcount_types.h \
  include/linux/resource.h \
  include/uapi/linux/resource.h \
  arch/x86/include/generated/uapi/asm/resource.h \
  include/asm-generic/resource.h \
  include/uapi/asm-generic/resource.h \
  include/linux/latencytop.h \
  include/linux/sched/prio.h \
  include/linux/sched/types.h \
  include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  include/uapi/linux/signal.h \
  arch/x86/include/asm/signal.h \
  arch/x86/include/uapi/asm/signal.h \
  include/uapi/asm-generic/signal-defs.h \
  arch/x86/include/uapi/asm/siginfo.h \
  include/uapi/asm-generic/siginfo.h \
  include/linux/syscall_user_dispatch_types.h \
  include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
    $(wildcard include/config/SPLIT_PTLOCK_CPUS) \
    $(wildcard include/config/ARCH_ENABLE_SPLIT_PMD_PTLOCK) \
  arch/x86/include/asm/tlbbatch.h \
  include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_EGRESS) \
  include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  include/linux/posix-timers_types.h \
  include/uapi/linux/rseq.h \
  include/linux/seqlock_types.h \
  include/linux/kcsan.h \
  include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  include/linux/livepatch_sched.h \
  include/linux/uidgid_types.h \
  arch/x86/include/generated/asm/kmap_size.h \
  include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  include/linux/spinlock.h \
  include/linux/bottom_half.h \
  include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  arch/x86/include/generated/asm/mmiowb.h \
  include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  arch/x86/include/asm/spinlock.h \
  arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/PARAVIRT_SPINLOCKS) \
  arch/x86/include/asm/frame.h \
  arch/x86/include/asm/qspinlock.h \
  include/asm-generic/qspinlock.h \
  arch/x86/include/asm/qrwlock.h \
  include/asm-generic/qrwlock.h \
  include/linux/rwlock.h \
  include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  include/linux/tracepoint-defs.h \
  include/vdso/time32.h \
  include/vdso/time.h \
  include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  include/linux/highuid.h \
  include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  include/linux/kmod.h \
  include/linux/umh.h \
  include/linux/gfp.h \
    $(wildcard include/config/HIGHMEM) \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/CONTIG_ALLOC) \
  include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  include/linux/list_nulls.h \
  include/linux/wait.h \
  include/linux/seqlock.h \
  include/linux/mutex.h \
  include/linux/debug_locks.h \
  include/linux/nodemask.h \
  include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  include/uapi/linux/random.h \
  include/linux/irqnr.h \
  include/uapi/linux/irqnr.h \
  include/linux/prandom.h \
  include/linux/once.h \
  include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
  include/linux/auxvec.h \
  include/uapi/linux/auxvec.h \
  arch/x86/include/uapi/asm/auxvec.h \
  include/linux/kref.h \
  include/linux/refcount.h \
  include/linux/rbtree.h \
  include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  include/linux/rcutree.h \
  include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  include/linux/completion.h \
  include/linux/swait.h \
  include/linux/uprobes.h \
  arch/x86/include/asm/uprobes.h \
  include/linux/notifier.h \
  include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  include/linux/ktime.h \
  include/linux/jiffies.h \
  include/vdso/jiffies.h \
  include/generated/timeconst.h \
  include/vdso/ktime.h \
  include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  include/linux/clocksource_ids.h \
  include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  include/linux/workqueue_types.h \
  include/linux/rcu_segcblist.h \
  include/linux/srcutree.h \
  include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  include/linux/percpu_counter.h \
  arch/x86/include/asm/mmu.h \
    $(wildcard include/config/MODIFY_LDT_SYSCALL) \
  include/linux/page-flags.h \
    $(wildcard include/config/ARCH_USES_PG_UNCACHED) \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_X) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  include/linux/local_lock.h \
  include/linux/local_lock_internal.h \
  include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/HAVE_ARCH_NODEDATA_EXTENSION) \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  arch/x86/include/asm/mmzone.h \
  arch/x86/include/asm/mmzone_64.h \
  include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
  include/linux/arch_topology.h \
    $(wildcard include/config/ACPI_CPPC_LIB) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  arch/x86/include/asm/topology.h \
    $(wildcard include/config/X86_LOCAL_APIC) \
    $(wildcard include/config/SCHED_MC_PRIO) \
  arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/EISA) \
    $(wildcard include/config/X86_MPPARSE) \
  arch/x86/include/asm/mpspec_def.h \
  arch/x86/include/asm/x86_init.h \
  arch/x86/include/asm/apicdef.h \
  include/asm-generic/topology.h \
  include/linux/cpu_smt.h \
    $(wildcard include/config/HOTPLUG_SMT) \
  include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  include/uapi/linux/sysctl.h \
  include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  arch/x86/include/asm/elf.h \
    $(wildcard include/config/X86_X32_ABI) \
  arch/x86/include/asm/ia32.h \
  include/linux/compat.h \
    $(wildcard include/config/ARCH_HAS_SYSCALL_WRAPPER) \
    $(wildcard include/config/COMPAT_OLD_SIGACTION) \
    $(wildcard include/config/ODD_RT_SIGACTION) \
  include/linux/sem.h \
  include/uapi/linux/sem.h \
  include/linux/ipc.h \
  include/linux/rhashtable-types.h \
  include/uapi/linux/ipc.h \
  arch/x86/include/generated/uapi/asm/ipcbuf.h \
  include/uapi/asm-generic/ipcbuf.h \
  arch/x86/include/uapi/asm/sembuf.h \
  include/linux/socket.h \
  arch/x86/include/generated/uapi/asm/socket.h \
  include/uapi/asm-generic/socket.h \
  arch/x86/include/generated/uapi/asm/sockios.h \
  include/uapi/asm-generic/sockios.h \
  include/uapi/linux/sockios.h \
  include/linux/uio.h \
    $(wildcard include/config/ARCH_HAS_COPY_MC) \
  include/uapi/linux/uio.h \
  include/uapi/linux/socket.h \
  include/uapi/linux/if.h \
  include/uapi/linux/libc-compat.h \
  include/uapi/linux/hdlc/ioctl.h \
  include/linux/fs.h \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  include/linux/wait_bit.h \
  include/linux/kdev_t.h \
  include/uapi/linux/kdev_t.h \
  include/linux/dcache.h \
  include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  include/linux/rculist_bl.h \
  include/linux/list_bl.h \
  include/linux/bit_spinlock.h \
  include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  include/linux/path.h \
  include/linux/list_lru.h \
  include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
  include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  arch/x86/include/asm/sync_core.h \
  include/linux/sched/coredump.h \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  include/linux/radix-tree.h \
  include/linux/pid.h \
  include/linux/capability.h \
  include/uapi/linux/capability.h \
  include/linux/semaphore.h \
  include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  include/uapi/linux/fcntl.h \
  arch/x86/include/generated/uapi/asm/fcntl.h \
  include/uapi/asm-generic/fcntl.h \
  include/uapi/linux/openat2.h \
  include/linux/migrate_mode.h \
  include/linux/percpu-rwsem.h \
  include/linux/rcuwait.h \
  include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
    $(wildcard include/config/STACK_GROWSUP) \
  include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
  include/linux/sched/jobctl.h \
  include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  include/linux/nospec.h \
  arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/CC_HAS_ASM_GOTO_OUTPUT) \
    $(wildcard include/config/CC_HAS_ASM_GOTO_TIED_OUTPUT) \
    $(wildcard include/config/X86_INTEL_USERCOPY) \
  include/linux/mmap_lock.h \
  arch/x86/include/asm/smap.h \
  arch/x86/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  arch/x86/include/asm/tlbflush.h \
  include/linux/mmu_notifier.h \
  include/linux/interval_tree.h \
  arch/x86/include/asm/invpcid.h \
  arch/x86/include/asm/pti.h \
  arch/x86/include/asm/pgtable.h \
    $(wildcard include/config/DEBUG_WX) \
    $(wildcard include/config/HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) \
    $(wildcard include/config/ARCH_HAS_PTE_DEVMAP) \
    $(wildcard include/config/HAVE_ARCH_SOFT_DIRTY) \
    $(wildcard include/config/ARCH_ENABLE_THP_MIGRATION) \
    $(wildcard include/config/PAGE_TABLE_CHECK) \
  arch/x86/include/asm/pkru.h \
  arch/x86/include/asm/fpu/api.h \
    $(wildcard include/config/X86_DEBUG_FPU) \
  arch/x86/include/asm/coco.h \
  include/asm-generic/pgtable_uffd.h \
  include/linux/page_table_check.h \
  arch/x86/include/asm/pgtable_64.h \
  arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/PROVIDE_OHCI1394_DMA_INIT) \
    $(wildcard include/config/X86_IO_APIC) \
    $(wildcard include/config/PCI_MMCONFIG) \
    $(wildcard include/config/ACPI_APEI_GHES) \
    $(wildcard include/config/INTEL_TXT) \
  arch/x86/include/uapi/asm/vsyscall.h \
  include/asm-generic/fixmap.h \
  arch/x86/include/asm/pgtable-invert.h \
  arch/x86/include/asm/uaccess_64.h \
  arch/x86/include/asm/runtime-const.h \
  include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  include/linux/cred.h \
  include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/IOMMUFD) \
    $(wildcard include/config/WATCH_QUEUE) \
  include/linux/ratelimit.h \
  include/linux/posix-timers.h \
  include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  include/linux/hrtimer_defs.h \
  include/linux/timerqueue.h \
  include/linux/rcu_sync.h \
  include/linux/delayed_call.h \
  include/linux/uuid.h \
  include/linux/errseq.h \
  include/linux/ioprio.h \
  include/linux/sched/rt.h \
  include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  include/uapi/linux/ioprio.h \
  include/linux/fs_types.h \
  include/linux/mount.h \
  include/linux/mnt_idmapping.h \
  include/linux/slab.h \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLUB_TINY) \
    $(wildcard include/config/SLUB_DEBUG) \
    $(wildcard include/config/SLAB_BUCKETS) \
  include/linux/percpu-refcount.h \
  include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
  include/linux/kasan-enabled.h \
  include/linux/kasan-tags.h \
  include/linux/rw_hint.h \
  include/uapi/linux/fs.h \
  include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  include/uapi/linux/dqblk_xfs.h \
  include/linux/dqblk_v1.h \
  include/linux/dqblk_v2.h \
  include/linux/dqblk_qtree.h \
  include/linux/projid.h \
  include/uapi/linux/quota.h \
  include/uapi/linux/aio_abi.h \
  include/uapi/linux/unistd.h \
  arch/x86/include/asm/unistd.h \
  arch/x86/include/uapi/asm/unistd.h \
  arch/x86/include/generated/uapi/asm/unistd_64.h \
  arch/x86/include/generated/asm/unistd_64_x32.h \
  arch/x86/include/generated/asm/unistd_32_ia32.h \
  arch/x86/include/asm/compat.h \
  include/linux/sched/task_stack.h \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  include/uapi/linux/magic.h \
  arch/x86/include/asm/user32.h \
  include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  arch/x86/include/asm/syscall_wrapper.h \
  arch/x86/include/asm/user.h \
  arch/x86/include/asm/user_64.h \
  arch/x86/include/asm/fsgsbase.h \
  arch/x86/include/asm/vdso.h \
  include/uapi/linux/elf.h \
  include/uapi/linux/elf-em.h \
  include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  include/linux/sysfs.h \
  include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  include/linux/idr.h \
  include/linux/kobject_ns.h \
  include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  include/linux/rbtree_latch.h \
  include/linux/error-injection.h \
  include/asm-generic/error-injection.h \
  arch/x86/include/asm/module.h \
    $(wildcard include/config/UNWINDER_ORC) \
  include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
    $(wildcard include/config/MODULES_USE_ELF_REL) \
    $(wildcard include/config/MODULES_USE_ELF_RELA) \
  include/linux/utsname.h \
    $(wildcard include/config/UTS_NS) \
    $(wildcard include/config/PROC_SYSCTL) \
  include/linux/nsproxy.h \
  include/linux/ns_common.h \
  include/uapi/linux/utsname.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/osdep_service.h \
    $(wildcard include/config/USE_VMALLOC) \
    $(wildcard include/config/AP_WOWLAN) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/osdep_service_linux.h \
    $(wildcard include/config/NET_RADIO) \
    $(wildcard include/config/WIRELESS_EXT) \
    $(wildcard include/config/IEEE80211_HT_ADDT_INFO) \
    $(wildcard include/config/EFUSE_CONFIG_FILE) \
  include/linux/namei.h \
  include/linux/netdevice.h \
    $(wildcard include/config/DCB) \
    $(wildcard include/config/HYPERV_NET) \
    $(wildcard include/config/WLAN) \
    $(wildcard include/config/AX25) \
    $(wildcard include/config/MAC80211_MESH) \
    $(wildcard include/config/NET_IPIP) \
    $(wildcard include/config/NET_IPGRE) \
    $(wildcard include/config/IPV6_SIT) \
    $(wildcard include/config/IPV6_TUNNEL) \
    $(wildcard include/config/NETPOLL) \
    $(wildcard include/config/XPS) \
    $(wildcard include/config/XDP_SOCKETS) \
    $(wildcard include/config/BQL) \
    $(wildcard include/config/RFS_ACCEL) \
    $(wildcard include/config/FCOE) \
    $(wildcard include/config/XFRM_OFFLOAD) \
    $(wildcard include/config/NET_POLL_CONTROLLER) \
    $(wildcard include/config/LIBFCOE) \
    $(wildcard include/config/NETFILTER_EGRESS) \
    $(wildcard include/config/NET_XGRESS) \
    $(wildcard include/config/NET_L3_MASTER_DEV) \
    $(wildcard include/config/IPV6) \
    $(wildcard include/config/TLS_DEVICE) \
    $(wildcard include/config/VLAN_8021Q) \
    $(wildcard include/config/NET_DSA) \
    $(wildcard include/config/TIPC) \
    $(wildcard include/config/ATALK) \
    $(wildcard include/config/CFG80211) \
    $(wildcard include/config/IEEE802154) \
    $(wildcard include/config/6LOWPAN) \
    $(wildcard include/config/MPLS_ROUTING) \
    $(wildcard include/config/MCTP) \
    $(wildcard include/config/NETFILTER_INGRESS) \
    $(wildcard include/config/NET_SCHED) \
    $(wildcard include/config/PCPU_DEV_REFCNT) \
    $(wildcard include/config/GARP) \
    $(wildcard include/config/MRP) \
    $(wildcard include/config/NET_DROP_MONITOR) \
    $(wildcard include/config/CGROUP_NET_PRIO) \
    $(wildcard include/config/MACSEC) \
    $(wildcard include/config/DPLL) \
    $(wildcard include/config/PAGE_POOL) \
    $(wildcard include/config/DIMLIB) \
    $(wildcard include/config/RPS) \
    $(wildcard include/config/NET_FLOW_LIMIT) \
    $(wildcard include/config/NET_DEV_REFCNT_TRACKER) \
    $(wildcard include/config/ETHTOOL_NETLINK) \
  include/linux/delay.h \
  arch/x86/include/asm/delay.h \
  include/asm-generic/delay.h \
  include/linux/prefetch.h \
  arch/x86/include/asm/local.h \
  include/linux/dynamic_queue_limits.h \
  include/net/net_namespace.h \
    $(wildcard include/config/NF_CONNTRACK) \
    $(wildcard include/config/NF_FLOW_TABLE) \
    $(wildcard include/config/UNIX) \
    $(wildcard include/config/IEEE802154_6LOWPAN) \
    $(wildcard include/config/IP_SCTP) \
    $(wildcard include/config/NETFILTER) \
    $(wildcard include/config/NF_TABLES) \
    $(wildcard include/config/WEXT_CORE) \
    $(wildcard include/config/XFRM) \
    $(wildcard include/config/IP_VS) \
    $(wildcard include/config/MPLS) \
    $(wildcard include/config/CAN) \
    $(wildcard include/config/CRYPTO_USER) \
    $(wildcard include/config/SMC) \
    $(wildcard include/config/NET_NS) \
    $(wildcard include/config/NET_NS_REFCNT_TRACKER) \
  include/net/flow.h \
  include/linux/in6.h \
  include/uapi/linux/in6.h \
  include/net/netns/core.h \
  include/net/netns/mib.h \
    $(wildcard include/config/XFRM_STATISTICS) \
    $(wildcard include/config/TLS) \
    $(wildcard include/config/MPTCP) \
  include/net/snmp.h \
  include/uapi/linux/snmp.h \
  include/linux/u64_stats_sync.h \
  arch/x86/include/generated/asm/local64.h \
  include/asm-generic/local64.h \
  include/net/netns/unix.h \
  include/net/netns/packet.h \
  include/net/netns/ipv4.h \
    $(wildcard include/config/IP_ROUTE_MULTIPATH) \
    $(wildcard include/config/IP_MULTIPLE_TABLES) \
    $(wildcard include/config/IP_ROUTE_CLASSID) \
    $(wildcard include/config/IP_MROUTE) \
    $(wildcard include/config/IP_MROUTE_MULTIPLE_TABLES) \
  include/net/inet_frag.h \
  include/net/dropreason-core.h \
  include/linux/siphash.h \
    $(wildcard include/config/HAVE_EFFICIENT_UNALIGNED_ACCESS) \
  include/net/netns/ipv6.h \
    $(wildcard include/config/IPV6_MULTIPLE_TABLES) \
    $(wildcard include/config/IPV6_SUBTREES) \
    $(wildcard include/config/IPV6_MROUTE) \
    $(wildcard include/config/IPV6_MROUTE_MULTIPLE_TABLES) \
    $(wildcard include/config/NF_DEFRAG_IPV6) \
  include/net/dst_ops.h \
  include/uapi/linux/icmpv6.h \
  include/net/netns/nexthop.h \
  include/net/netns/ieee802154_6lowpan.h \
  include/net/netns/sctp.h \
  include/net/netns/netfilter.h \
    $(wildcard include/config/LWTUNNEL) \
    $(wildcard include/config/NETFILTER_FAMILY_ARP) \
    $(wildcard include/config/NETFILTER_FAMILY_BRIDGE) \
    $(wildcard include/config/NF_DEFRAG_IPV4) \
  include/linux/netfilter_defs.h \
  include/uapi/linux/netfilter.h \
  include/linux/in.h \
  include/uapi/linux/in.h \
  include/net/netns/conntrack.h \
    $(wildcard include/config/NF_CT_PROTO_DCCP) \
    $(wildcard include/config/NF_CT_PROTO_SCTP) \
    $(wildcard include/config/NF_CT_PROTO_GRE) \
    $(wildcard include/config/NF_CONNTRACK_EVENTS) \
    $(wildcard include/config/NF_CONNTRACK_LABELS) \
  include/linux/netfilter/nf_conntrack_tcp.h \
  include/uapi/linux/netfilter/nf_conntrack_tcp.h \
  include/linux/netfilter/nf_conntrack_dccp.h \
  include/uapi/linux/netfilter/nf_conntrack_tuple_common.h \
  include/linux/netfilter/nf_conntrack_common.h \
  include/uapi/linux/netfilter/nf_conntrack_common.h \
  include/linux/netfilter/nf_conntrack_sctp.h \
  include/uapi/linux/netfilter/nf_conntrack_sctp.h \
  include/net/netns/flow_table.h \
  include/net/netns/nftables.h \
  include/net/netns/xfrm.h \
  include/uapi/linux/xfrm.h \
  include/net/netns/mpls.h \
  include/net/netns/can.h \
  include/net/netns/xdp.h \
  include/net/netns/smc.h \
  include/net/netns/bpf.h \
  include/net/netns/mctp.h \
  include/net/net_trackers.h \
  include/linux/ref_tracker.h \
    $(wildcard include/config/REF_TRACKER) \
  include/linux/stackdepot.h \
    $(wildcard include/config/STACKDEPOT) \
    $(wildcard include/config/STACKDEPOT_MAX_FRAMES) \
    $(wildcard include/config/STACKDEPOT_ALWAYS_INIT) \
  include/linux/skbuff.h \
    $(wildcard include/config/BRIDGE_NETFILTER) \
    $(wildcard include/config/NET_TC_SKB_EXT) \
    $(wildcard include/config/MAX_SKB_FRAGS) \
    $(wildcard include/config/NET_SOCK_MSG) \
    $(wildcard include/config/SKB_EXTENSIONS) \
    $(wildcard include/config/WIRELESS) \
    $(wildcard include/config/IPV6_NDISC_NODETYPE) \
    $(wildcard include/config/NETFILTER_XT_TARGET_TRACE) \
    $(wildcard include/config/NET_SWITCHDEV) \
    $(wildcard include/config/NET_REDIRECT) \
    $(wildcard include/config/NETFILTER_SKIP_EGRESS) \
    $(wildcard include/config/SKB_DECRYPTED) \
    $(wildcard include/config/NET_RX_BUSY_POLL) \
    $(wildcard include/config/NETWORK_SECMARK) \
    $(wildcard include/config/DEBUG_NET) \
    $(wildcard include/config/NETWORK_PHY_TIMESTAMPING) \
    $(wildcard include/config/MCTP_FLOWS) \
  include/linux/bvec.h \
  include/linux/highmem.h \
  include/linux/cacheflush.h \
  arch/x86/include/asm/cacheflush.h \
  include/linux/mm.h \
    $(wildcard include/config/HAVE_ARCH_MMAP_RND_BITS) \
    $(wildcard include/config/HAVE_ARCH_MMAP_RND_COMPAT_BITS) \
    $(wildcard include/config/ARCH_USES_HIGH_VMA_FLAGS) \
    $(wildcard include/config/ARCH_HAS_PKEYS) \
    $(wildcard include/config/PPC) \
    $(wildcard include/config/X86) \
    $(wildcard include/config/PARISC) \
    $(wildcard include/config/SPARC64) \
    $(wildcard include/config/ARM64_MTE) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_MINOR) \
    $(wildcard include/config/SHMEM) \
    $(wildcard include/config/MIGRATION) \
    $(wildcard include/config/ARCH_HAS_GIGANTIC_PAGE) \
    $(wildcard include/config/ARCH_HAS_PTE_SPECIAL) \
    $(wildcard include/config/HIGHPTE) \
    $(wildcard include/config/DEBUG_VM_RB) \
    $(wildcard include/config/PAGE_POISONING) \
    $(wildcard include/config/INIT_ON_ALLOC_DEFAULT_ON) \
    $(wildcard include/config/INIT_ON_FREE_DEFAULT_ON) \
    $(wildcard include/config/DEBUG_PAGEALLOC) \
    $(wildcard include/config/ARCH_WANT_OPTIMIZE_DAX_VMEMMAP) \
    $(wildcard include/config/HUGETLBFS) \
    $(wildcard include/config/MAPPING_DIRTY_HELPERS) \
  include/linux/pgalloc_tag.h \
  include/linux/page_ext.h \
  include/linux/stacktrace.h \
    $(wildcard include/config/ARCH_STACKWALK) \
    $(wildcard include/config/STACKTRACE) \
    $(wildcard include/config/HAVE_RELIABLE_STACKTRACE) \
  include/linux/page_ref.h \
    $(wildcard include/config/DEBUG_PAGE_REF) \
  include/linux/sizes.h \
  include/linux/pgtable.h \
    $(wildcard include/config/ARCH_HAS_NONLEAF_PMD_YOUNG) \
    $(wildcard include/config/ARCH_HAS_HW_PTE_YOUNG) \
    $(wildcard include/config/GUP_GET_PXX_LOW_HIGH) \
    $(wildcard include/config/ARCH_WANT_PMD_MKWRITE) \
    $(wildcard include/config/HAVE_ARCH_HUGE_VMAP) \
    $(wildcard include/config/X86_ESPFIX64) \
  include/linux/memremap.h \
    $(wildcard include/config/DEVICE_PRIVATE) \
    $(wildcard include/config/PCI_P2PDMA) \
  include/linux/ioport.h \
  include/linux/huge_mm.h \
    $(wildcard include/config/PGTABLE_HAS_HUGE_LEAVES) \
  include/linux/vmstat.h \
    $(wildcard include/config/VM_EVENT_COUNTERS) \
    $(wildcard include/config/DEBUG_TLBFLUSH) \
    $(wildcard include/config/PER_VMA_LOCK_STATS) \
  include/linux/vm_event_item.h \
    $(wildcard include/config/MEMORY_BALLOON) \
    $(wildcard include/config/BALLOON_COMPACTION) \
  include/asm-generic/cacheflush.h \
  include/linux/kmsan.h \
  include/linux/dma-direction.h \
  include/linux/hardirq.h \
  include/linux/context_tracking_state.h \
    $(wildcard include/config/CONTEXT_TRACKING_USER) \
    $(wildcard include/config/CONTEXT_TRACKING) \
  include/linux/ftrace_irq.h \
    $(wildcard include/config/HWLAT_TRACER) \
    $(wildcard include/config/OSNOISE_TRACER) \
  include/linux/vtime.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING) \
    $(wildcard include/config/IRQ_TIME_ACCOUNTING) \
  arch/x86/include/asm/hardirq.h \
    $(wildcard include/config/KVM_INTEL) \
    $(wildcard include/config/KVM) \
    $(wildcard include/config/X86_THERMAL_VECTOR) \
    $(wildcard include/config/X86_MCE_THRESHOLD) \
    $(wildcard include/config/X86_MCE_AMD) \
    $(wildcard include/config/X86_HV_CALLBACK_VECTOR) \
    $(wildcard include/config/HYPERV) \
    $(wildcard include/config/X86_POSTED_MSI) \
  include/linux/highmem-internal.h \
  include/net/checksum.h \
  arch/x86/include/asm/checksum.h \
    $(wildcard include/config/GENERIC_CSUM) \
  arch/x86/include/asm/checksum_64.h \
  include/linux/dma-mapping.h \
    $(wildcard include/config/DMA_API_DEBUG) \
    $(wildcard include/config/HAS_DMA) \
    $(wildcard include/config/DMA_NEED_SYNC) \
    $(wildcard include/config/NEED_DMA_MAP_STATE) \
  include/linux/device.h \
    $(wildcard include/config/HAS_IOMEM) \
    $(wildcard include/config/GENERIC_MSI_IRQ) \
    $(wildcard include/config/ENERGY_MODEL) \
    $(wildcard include/config/PINCTRL) \
    $(wildcard include/config/DMA_OPS) \
    $(wildcard include/config/DMA_DECLARE_COHERENT) \
    $(wildcard include/config/DMA_CMA) \
    $(wildcard include/config/SWIOTLB) \
    $(wildcard include/config/SWIOTLB_DYNAMIC) \
    $(wildcard include/config/ARCH_HAS_SYNC_DMA_FOR_DEVICE) \
    $(wildcard include/config/ARCH_HAS_SYNC_DMA_FOR_CPU) \
    $(wildcard include/config/ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) \
    $(wildcard include/config/DMA_OPS_BYPASS) \
    $(wildcard include/config/PM_SLEEP) \
    $(wildcard include/config/OF) \
    $(wildcard include/config/DEVTMPFS) \
  include/linux/dev_printk.h \
  include/linux/energy_model.h \
    $(wildcard include/config/SCHED_DEBUG) \
  include/linux/sched/cpufreq.h \
    $(wildcard include/config/CPU_FREQ) \
  include/linux/sched/topology.h \
    $(wildcard include/config/SCHED_CLUSTER) \
    $(wildcard include/config/SCHED_MC) \
    $(wildcard include/config/CPU_FREQ_GOV_SCHEDUTIL) \
  include/linux/sched/idle.h \
  include/linux/sched/sd_flags.h \
  include/linux/klist.h \
  include/linux/pm.h \
    $(wildcard include/config/VT_CONSOLE_SLEEP) \
    $(wildcard include/config/CXL_SUSPEND) \
    $(wildcard include/config/PM) \
    $(wildcard include/config/PM_CLK) \
    $(wildcard include/config/PM_GENERIC_DOMAINS) \
  include/linux/device/bus.h \
    $(wildcard include/config/ACPI) \
  include/linux/device/class.h \
  include/linux/device/driver.h \
  arch/x86/include/asm/device.h \
  include/linux/pm_wakeup.h \
  include/linux/scatterlist.h \
    $(wildcard include/config/NEED_SG_DMA_LENGTH) \
    $(wildcard include/config/NEED_SG_DMA_FLAGS) \
    $(wildcard include/config/DEBUG_SG) \
    $(wildcard include/config/SGL_ALLOC) \
    $(wildcard include/config/ARCH_NO_SG_CHAIN) \
    $(wildcard include/config/SG_POOL) \
  arch/x86/include/asm/io.h \
    $(wildcard include/config/MTRR) \
    $(wildcard include/config/X86_PAT) \
  arch/x86/include/generated/asm/early_ioremap.h \
  include/asm-generic/early_ioremap.h \
    $(wildcard include/config/GENERIC_EARLY_IOREMAP) \
  arch/x86/include/asm/shared/io.h \
  include/asm-generic/io.h \
    $(wildcard include/config/GENERIC_IOMAP) \
    $(wildcard include/config/TRACE_MMIO_ACCESS) \
    $(wildcard include/config/GENERIC_IOREMAP) \
    $(wildcard include/config/HAS_IOPORT_MAP) \
  include/asm-generic/iomap.h \
  include/asm-generic/pci_iomap.h \
    $(wildcard include/config/PCI) \
    $(wildcard include/config/NO_GENERIC_PCI_IOPORT_MAP) \
    $(wildcard include/config/GENERIC_PCI_IOMAP) \
  include/linux/logic_pio.h \
    $(wildcard include/config/INDIRECT_PIO) \
  include/linux/fwnode.h \
  include/linux/netdev_features.h \
  include/net/flow_dissector.h \
  include/uapi/linux/if_ether.h \
  include/uapi/linux/pkt_cls.h \
    $(wildcard include/config/NET_CLS_ACT) \
  include/uapi/linux/pkt_sched.h \
  include/uapi/linux/if_packet.h \
  include/net/net_debug.h \
  include/net/netmem.h \
  include/linux/seq_file_net.h \
  include/linux/seq_file.h \
  include/linux/string_helpers.h \
  include/linux/ctype.h \
  include/linux/string_choices.h \
  include/net/dcbnl.h \
  include/uapi/linux/dcbnl.h \
  include/net/netprio_cgroup.h \
  include/linux/cgroup.h \
    $(wildcard include/config/DEBUG_CGROUP_REF) \
    $(wildcard include/config/CGROUP_CPUACCT) \
    $(wildcard include/config/SOCK_CGROUP_DATA) \
    $(wildcard include/config/CGROUP_DATA) \
    $(wildcard include/config/CGROUP_BPF) \
  include/uapi/linux/cgroupstats.h \
  include/uapi/linux/taskstats.h \
  include/linux/user_namespace.h \
    $(wildcard include/config/INOTIFY_USER) \
    $(wildcard include/config/FANOTIFY) \
    $(wildcard include/config/BINFMT_MISC) \
    $(wildcard include/config/PERSISTENT_KEYRINGS) \
  include/linux/kernel_stat.h \
    $(wildcard include/config/GENERIC_IRQ_STAT_SNAPSHOT) \
  include/linux/interrupt.h \
    $(wildcard include/config/IRQ_FORCED_THREADING) \
    $(wildcard include/config/GENERIC_IRQ_PROBE) \
    $(wildcard include/config/IRQ_TIMINGS) \
  include/linux/irqreturn.h \
  arch/x86/include/asm/irq.h \
  arch/x86/include/asm/irq_vectors.h \
  arch/x86/include/asm/sections.h \
  include/asm-generic/sections.h \
    $(wildcard include/config/HAVE_FUNCTION_DESCRIPTORS) \
  include/linux/cgroup-defs.h \
    $(wildcard include/config/CGROUP_NET_CLASSID) \
  include/linux/bpf-cgroup-defs.h \
    $(wildcard include/config/BPF_LSM) \
  include/linux/psi_types.h \
  include/linux/kthread.h \
  include/linux/cgroup_subsys.h \
    $(wildcard include/config/CGROUP_DEVICE) \
    $(wildcard include/config/CGROUP_FREEZER) \
    $(wildcard include/config/CGROUP_PERF) \
    $(wildcard include/config/CGROUP_HUGETLB) \
    $(wildcard include/config/CGROUP_PIDS) \
    $(wildcard include/config/CGROUP_RDMA) \
    $(wildcard include/config/CGROUP_MISC) \
    $(wildcard include/config/CGROUP_DEBUG) \
  include/linux/cgroup_refcnt.h \
  include/uapi/linux/neighbour.h \
  include/linux/netlink.h \
  include/net/scm.h \
    $(wildcard include/config/SECURITY_NETWORK) \
  include/linux/net.h \
  include/linux/sockptr.h \
  include/uapi/linux/net.h \
  include/linux/file.h \
  include/linux/security.h \
    $(wildcard include/config/SECURITY_INFINIBAND) \
    $(wildcard include/config/SECURITY_NETWORK_XFRM) \
    $(wildcard include/config/SECURITY_PATH) \
    $(wildcard include/config/SECURITYFS) \
  include/linux/kernel_read_file.h \
  include/linux/bpf.h \
    $(wildcard include/config/FINEIBT) \
    $(wildcard include/config/BPF_JIT_ALWAYS_ON) \
    $(wildcard include/config/INET) \
  include/uapi/linux/bpf.h \
    $(wildcard include/config/BPF_LIRC_MODE2) \
    $(wildcard include/config/EFFICIENT_UNALIGNED_ACCESS) \
    $(wildcard include/config/BPF_KPROBE_OVERRIDE) \
  include/uapi/linux/bpf_common.h \
  include/uapi/linux/filter.h \
  include/linux/kallsyms.h \
    $(wildcard include/config/KALLSYMS_ALL) \
  include/linux/bpfptr.h \
  include/linux/btf.h \
  include/linux/bsearch.h \
  include/linux/btf_ids.h \
  include/uapi/linux/btf.h \
  include/linux/rcupdate_trace.h \
    $(wildcard include/config/TASKS_TRACE_RCU_READ_MB) \
  include/linux/static_call.h \
  include/linux/cpu.h \
    $(wildcard include/config/GENERIC_CPU_DEVICES) \
    $(wildcard include/config/PM_SLEEP_SMP) \
    $(wildcard include/config/PM_SLEEP_SMP_NONZERO_CPU) \
    $(wildcard include/config/ARCH_HAS_CPU_FINALIZE_INIT) \
    $(wildcard include/config/CPU_MITIGATIONS) \
  include/linux/node.h \
    $(wildcard include/config/HMEM_REPORTING) \
  include/linux/cpuhotplug.h \
    $(wildcard include/config/HOTPLUG_CORE_SYNC_DEAD) \
  include/linux/cpuhplock.h \
  arch/x86/include/asm/static_call.h \
  arch/x86/include/asm/text-patching.h \
    $(wildcard include/config/UML_X86) \
  include/linux/memcontrol.h \
  include/linux/page_counter.h \
  include/linux/vmpressure.h \
  include/linux/eventfd.h \
  include/uapi/linux/eventfd.h \
  include/linux/writeback.h \
  include/linux/flex_proportions.h \
  include/linux/backing-dev-defs.h \
    $(wildcard include/config/DEBUG_FS) \
  include/linux/blk_types.h \
    $(wildcard include/config/FAIL_MAKE_REQUEST) \
    $(wildcard include/config/BLK_CGROUP_IOCOST) \
    $(wildcard include/config/BLK_INLINE_ENCRYPTION) \
    $(wildcard include/config/BLK_DEV_INTEGRITY) \
  include/linux/pagevec.h \
  include/linux/bio.h \
    $(wildcard include/config/BLK_DEV_ZONED) \
  include/linux/mempool.h \
  include/linux/cfi.h \
    $(wildcard include/config/CFI_CLANG) \
  arch/x86/include/asm/cfi.h \
  include/linux/bpf_types.h \
    $(wildcard include/config/NETFILTER_BPF_LINK) \
  include/uapi/linux/lsm.h \
  include/linux/lsm/selinux.h \
    $(wildcard include/config/SECURITY_SELINUX) \
  include/linux/lsm/smack.h \
    $(wildcard include/config/SECURITY_SMACK) \
  include/linux/lsm/apparmor.h \
    $(wildcard include/config/SECURITY_APPARMOR) \
  include/linux/lsm/bpf.h \
  include/net/compat.h \
  include/uapi/linux/netlink.h \
  include/uapi/linux/netdevice.h \
  include/linux/if_ether.h \
  include/linux/if_link.h \
  include/uapi/linux/if_link.h \
  include/uapi/linux/if_bonding.h \
  include/uapi/linux/netdev.h \
  include/linux/hashtable.h \
  include/linux/inetdevice.h \
  include/linux/ip.h \
  include/uapi/linux/ip.h \
  include/linux/rtnetlink.h \
    $(wildcard include/config/NET_INGRESS) \
  include/uapi/linux/rtnetlink.h \
  include/uapi/linux/if_addr.h \
  include/linux/circ_buf.h \
  include/linux/etherdevice.h \
  include/linux/crc32.h \
  include/linux/bitrev.h \
    $(wildcard include/config/HAVE_ARCH_BITREVERSE) \
  arch/x86/include/generated/asm/unaligned.h \
  include/asm-generic/unaligned.h \
  include/linux/unaligned/packed_struct.h \
  include/linux/wireless.h \
  include/uapi/linux/wireless.h \
  include/net/iw_handler.h \
    $(wildcard include/config/WEXT_PRIV) \
  include/net/addrconf.h \
    $(wildcard include/config/IPV6_MIP6) \
  include/linux/ipv6.h \
    $(wildcard include/config/IPV6_ROUTER_PREF) \
    $(wildcard include/config/IPV6_ROUTE_INFO) \
    $(wildcard include/config/IPV6_OPTIMISTIC_DAD) \
    $(wildcard include/config/IPV6_SEG6_HMAC) \
  include/uapi/linux/ipv6.h \
  include/linux/tcp.h \
    $(wildcard include/config/TCP_AO) \
    $(wildcard include/config/BPF) \
    $(wildcard include/config/TCP_MD5SIG) \
  include/linux/win_minmax.h \
  include/net/sock.h \
    $(wildcard include/config/SOCK_RX_QUEUE_MAPPING) \
    $(wildcard include/config/SOCK_VALIDATE_XMIT) \
  include/linux/rculist_nulls.h \
  include/linux/poll.h \
  include/uapi/linux/poll.h \
  arch/x86/include/generated/uapi/asm/poll.h \
  include/uapi/asm-generic/poll.h \
  include/uapi/linux/eventpoll.h \
  include/linux/indirect_call_wrapper.h \
  include/net/dst.h \
  include/linux/rcuref.h \
  include/net/neighbour.h \
  include/net/rtnetlink.h \
  include/net/netlink.h \
  include/net/tcp_states.h \
  include/linux/net_tstamp.h \
  include/uapi/linux/net_tstamp.h \
  include/net/l3mdev.h \
  include/net/fib_rules.h \
  include/uapi/linux/fib_rules.h \
  include/net/fib_notifier.h \
  include/net/inet_connection_sock.h \
  include/net/inet_sock.h \
  include/linux/jhash.h \
  include/net/request_sock.h \
    $(wildcard include/config/SYN_COOKIES) \
  include/net/rstreason.h \
  include/uapi/linux/mptcp.h \
  include/uapi/linux/mptcp_pm.h \
  include/net/netns/hash.h \
  include/net/inet_timewait_sock.h \
  include/net/timewait_sock.h \
  include/uapi/linux/tcp.h \
  include/linux/udp.h \
  include/uapi/linux/udp.h \
  include/net/if_inet6.h \
  include/net/ipv6.h \
  include/linux/jump_label_ratelimit.h \
  include/net/inet_dscp.h \
  include/linux/if_arp.h \
    $(wildcard include/config/FIREWIRE_NET) \
  include/uapi/linux/if_arp.h \
  include/linux/vmalloc.h \
    $(wildcard include/config/HAVE_ARCH_HUGE_VMALLOC) \
  arch/x86/include/asm/vmalloc.h \
  arch/x86/include/asm/pgtable_areas.h \
  include/uapi/linux/sched/types.h \
  include/net/ieee80211_radiotap.h \
  include/linux/ieee80211.h \
  include/net/cfg80211.h \
    $(wildcard include/config/NL80211_TESTMODE) \
    $(wildcard include/config/CFG80211_WEXT) \
    $(wildcard include/config/CFG80211_DEBUGFS) \
  include/linux/ethtool.h \
  include/uapi/linux/ethtool.h \
  include/uapi/linux/rfkill.h \
  include/linux/debugfs.h \
  include/uapi/linux/nl80211.h \
  include/linux/rfkill.h \
    $(wildcard include/config/RFKILL) \
    $(wildcard include/config/RFKILL_LEDS) \
  include/linux/leds.h \
    $(wildcard include/config/LEDS_TRIGGERS) \
    $(wildcard include/config/LEDS_BRIGHTNESS_HW_CHANGED) \
    $(wildcard include/config/LEDS_TRIGGER_DISK) \
    $(wildcard include/config/LEDS_TRIGGER_MTD) \
    $(wildcard include/config/LEDS_TRIGGER_CAMERA) \
    $(wildcard include/config/LEDS_GPIO_REGISTER) \
    $(wildcard include/config/LEDS_TRIGGER_CPU) \
  include/dt-bindings/leds/common.h \
  include/net/regulatory.h \
  include/linux/usb.h \
    $(wildcard include/config/USB_MON) \
    $(wildcard include/config/USB_LED_TRIG) \
  include/linux/mod_devicetable.h \
  include/uapi/linux/mei.h \
  include/uapi/linux/mei_uuid.h \
  include/linux/usb/ch9.h \
  include/uapi/linux/usb/ch9.h \
  include/linux/pm_runtime.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../os_dep/linux/rtw_rhashtable.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/drv_types_linux.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_byteorder.h \
    $(wildcard include/config/LITTLE_ENDIAN) \
    $(wildcard include/config/BIG_ENDIAN) \
    $(wildcard include/config/PLATFORM_MSTAR389) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/byteorder/little_endian.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/wlan_bssdef.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/wifi.h \
    $(wildcard include/config/APPEND_VENDOR_IE_ENABLE) \
    $(wildcard include/config/WOW_KEEP_ALIVE_PATTERN) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/ieee80211.h \
    $(wildcard include/config/RTW_DEBUG) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_debug.h \
    $(wildcard include/config/PROC_DEBUG) \
    $(wildcard include/config/HUAWEI_PROC) \
    $(wildcard include/config/RF4CE_COEXIST) \
    $(wildcard include/config/P2P_WOWLAN) \
    $(wildcard include/config/DBG_RF_CAL) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/cmn_info/rtw_sta_info.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_rf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../core/rtw_chplan.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_ht.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_cmd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/cmd_osdep.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_security.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_xmit.h \
    $(wildcard include/config/TX_AGGREGATION) \
    $(wildcard include/config/SDIO_TX_FORMAT_DUMMY_AUTO) \
    $(wildcard include/config/PLATFORM_ARM_SUNxI) \
    $(wildcard include/config/PLATFORM_ARM_SUN6I) \
    $(wildcard include/config/PLATFORM_ARM_SUN7I) \
    $(wildcard include/config/PLATFORM_ARM_SUN8I) \
    $(wildcard include/config/PLATFORM_ARM_SUN50IW1P1) \
    $(wildcard include/config/PLATFORM_MSTAR) \
    $(wildcard include/config/SINGLE_XMIT_BUF) \
    $(wildcard include/config/PCI_TX_POLLING) \
    $(wildcard include/config/LPS_POFF) \
    $(wildcard include/config/TRX_BD_ARCH) \
    $(wildcard include/config/64BIT_DMA) \
    $(wildcard include/config/SDIO_TX_TASKLET) \
    $(wildcard include/config/REMOVE_DUP_TX_STATE) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/xmit_osdep.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_recv.h \
    $(wildcard include/config/SINGLE_RECV_BUF) \
    $(wildcard include/config/PLATFORM_RTK390X) \
    $(wildcard include/config/RX_INDICATE_QUEUE) \
    $(wildcard include/config/SDIO_RECVBUF_PWAIT) \
    $(wildcard include/config/SDIO_RECVBUF_AGGREGATION) \
    $(wildcard include/config/SDIO_RECVBUF_AGGREGATION_EN) \
    $(wildcard include/config/SDIO_RECVBUF_PWAIT_RUNTIME_ADJUST) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_rm.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/recv_osdep.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_efuse.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_sreset.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_intf.h \
    $(wildcard include/config/RFKILL_POLL) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_com.h \
    $(wildcard include/config/BCN_RECOVERY) \
    $(wildcard include/config/BCN_XMIT_PROTECT) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/HalVerDef.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_pg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_phy.h \
    $(wildcard include/config/RF_SHADOW_RW) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_phy_reg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_com_reg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_com_phycfg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/hal_com_c2h.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_com_h2c.h \
    $(wildcard include/config/RA_DBG_CMD) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_com_led.h \
    $(wildcard include/config/RTW_SW_LED_TRX_DA_CLASSIFY) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/hal_dm.h \
    $(wildcard include/config/LPS_PWR_TRACKING) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_qos.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_pwrctrl.h \
    $(wildcard include/config/PLATFORM_ANDROID_INTEL_X86) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_mlme.h \
    $(wildcard include/config/BCN_CNT_CONFIRM_HDL) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/mlme_osdep.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_io.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_ioctl.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_ioctl_set.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_ioctl_query.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/osdep_intf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../os_dep/linux/rtw_proc.h \
  include/linux/proc_fs.h \
    $(wildcard include/config/PROC_PID_ARCH_STATUS) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../os_dep/linux/nlrtw.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../os_dep/linux/ioctl_cfg80211.h \
    $(wildcard include/config/RTW_DYNAMIC_NDEV) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../os_dep/linux/wifi_regd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../os_dep/linux/rtw_cfgvendor.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_eeprom.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/sta_info.h \
    $(wildcard include/config/RTW_MACADDR_ACL) \
    $(wildcard include/config/RTW_PRE_LINK_STA) \
    $(wildcard include/config/ATMEL_RC_PATCH) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_event.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_mlme_ext.h \
    $(wildcard include/config/ANDROID) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_mi.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_ap.h \
    $(wildcard include/config/BMC_TX_RATE_SELECT) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_version.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_odm.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_types.h \
    $(wildcard include/config/RTL_TRIBAND_SUPPORT) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_p2p.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_mp.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_br_ext.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/ip.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/if_ether.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/ethernet.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/circ_buf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_android.h \
    $(wildcard include/config/PLATFORM_INTEL_BYT) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_btcoex_wifionly.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_btcoex.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtw_roch.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/usb_osintf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/usb_vendor_req.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/usb_ops.h \
    $(wildcard include/config/RTL8814) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/usb_ops_linux.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/usb_hal.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_data.h \
    $(wildcard include/config/SINGLE_IMG) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_precomp.h \
    $(wildcard include/config/SFW_SUPPORTED) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halrf_features.h \
    $(wildcard include/config/HALRF_POWERTRACKING) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm.h \
    $(wildcard include/config/PATH_DIVERSITY) \
    $(wildcard include/config/PHYDM_ANTENNA_DIVERSITY) \
    $(wildcard include/config/SMART_ANTENNA) \
    $(wildcard include/config/ANT_DETECTION) \
    $(wildcard include/config/DYNAMIC_TX_TWR) \
    $(wildcard include/config/PSD_TOOL) \
    $(wildcard include/config/DIRECTIONAL_BF) \
    $(wildcard include/config/MCC_DM) \
    $(wildcard include/config/PHYDM_DFS_MASTER) \
    $(wildcard include/config/ADAPTIVE_SOML) \
    $(wildcard include/config/HL_SMART_ANTENNA) \
    $(wildcard include/config/BB_PHY_REG) \
    $(wildcard include/config/BB_AGC_TAB) \
    $(wildcard include/config/BB_AGC_TAB_2G) \
    $(wildcard include/config/BB_AGC_TAB_5G) \
    $(wildcard include/config/BB_PHY_REG_PG) \
    $(wildcard include/config/BB_PHY_REG_MP) \
    $(wildcard include/config/BB_AGC_TAB_DIFF) \
    $(wildcard include/config/BB_RF_CAL_INIT) \
    $(wildcard include/config/RF_RADIO) \
    $(wildcard include/config/RF_TXPWR_LMT) \
    $(wildcard include/config/RF_SYN_RADIO) \
    $(wildcard include/config/FW_NIC) \
    $(wildcard include/config/FW_NIC_2) \
    $(wildcard include/config/FW_AP) \
    $(wildcard include/config/FW_AP_2) \
    $(wildcard include/config/FW_MP) \
    $(wildcard include/config/FW_WOWLAN) \
    $(wildcard include/config/FW_WOWLAN_2) \
    $(wildcard include/config/FW_AP_WOWLAN) \
    $(wildcard include/config/FW_BT) \
    $(wildcard include/config/DYNAMIC_TXCOLLISION_TH) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_pre_define.h \
    $(wildcard include/config/MU_JAGUAR_2) \
    $(wildcard include/config/MU_JAGUAR_3) \
    $(wildcard include/config/RFE_BY_HW_INFO) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_features.h \
    $(wildcard include/config/RUN_IN_DRV) \
    $(wildcard include/config/POWERSAVING) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_features_ce.h \
    $(wildcard include/config/RECEIVER_BLOCKING) \
    $(wildcard include/config/BW_INDICATION) \
    $(wildcard include/config/8912F_SPUR_CALIBRATION) \
    $(wildcard include/config/8822B_SPUR_CALIBRATION) \
    $(wildcard include/config/S0S1_SW_ANTENNA_DIVERSITY) \
    $(wildcard include/config/HL_SMART_ANTENNA_TYPE1) \
    $(wildcard include/config/HL_SMART_ANTENNA_TYPE2) \
    $(wildcard include/config/CUMITEK_SMART_ANTENNA) \
    $(wildcard include/config/RA_FW_DBG_CODE) \
    $(wildcard include/config/RA_DYNAMIC_RTY_LIMIT) \
    $(wildcard include/config/BB_TXBF_API) \
    $(wildcard include/config/PHYDM_DEBUG_FUNCTION) \
    $(wildcard include/config/DYNAMIC_BYPASS_MODE) \
    $(wildcard include/config/DYNAMIC_BYPASS) \
    $(wildcard include/config/MU_RSOML) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_dig.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_soml.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_rainfo.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_cfotracking.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_adaptivity.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_dfs.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_ccx.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/phydm_hal_txbf_api.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_psd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_cck_pd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_rssi_monitor.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_auto_dbg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_math_lib.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_noisemonitor.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_api.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_pow_train.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_beamforming.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/halcomtxbf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/haltxbfjaguar.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/haltxbf8192e.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/haltxbf8814a.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/haltxbf8822b.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/txbf/haltxbfinterface.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_regtable.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halrf_iqk.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halrf_dpk.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halrf.h \
    $(wildcard include/config/2G_BAND_SHIFT) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/hal/phydm/halrf/halrf_psd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halrf_powertracking.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halphyrf_ce.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/hal/phydm/halrf/halrf_kfree.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/hal/phydm/halrf/halrf_powertracking_ce.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_hwconfig.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_phystatus.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_debug.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_regdefine11ac.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_regdefine11n.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_interface.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/phydm_reg.h \
    $(wildcard include/config/WLAN_HAL_8814AE) \
    $(wildcard include/config/WLAN_HAL_8198F) \
    $(wildcard include/config/WLAN_HAL_8822CE) \
    $(wildcard include/config/WLAN_HAL_8814BE) \
    $(wildcard include/config/WLAN_HAL_8812FE) \
    $(wildcard include/config/WLAN_HAL_8197G) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/halrf_debug.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/halhwimg8723d_bb.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/halhwimg8723d_mac.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/halhwimg8723d_rf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/phydm_regconfig8723d.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/hal8723dreg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/phydm_rtl8723d.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/halrf/rtl8723d/halrf_8723d.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/../hal/phydm/rtl8723d/version_rtl8723d.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_hal.h \
    $(wildcard include/config/FW_C2H_DEBUG) \
    $(wildcard include/config/CHECK_BT_HANG) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_spec.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_rf.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_dm.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_recv.h \
    $(wildcard include/config/SDIO_RX_COPY) \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_xmit.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_cmd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/rtl8723d_led.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/Hal8723DPwrSeq.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/HalPwrSeqCmd.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/Hal8723DPhyReg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/Hal8723DPhyCfg.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_btcoex.h \
  /home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/include/hal_btcoex_wifionly.h \
    $(wildcard include/config/BTCOEX_SUPPORT_WIFI_ONLY_CFG) \
    $(wildcard include/config/BTCOEX_SUPPORT_BTC_CMN) \

/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o: $(deps_/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o)

$(deps_/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o):

/home/runner/work/EW-7611ULB_V2_Linux_Driver/EW-7611ULB_V2_Linux_Driver/WIFI/core/rtw_cmd.o: $(wildcard ./tools/objtool/objtool)

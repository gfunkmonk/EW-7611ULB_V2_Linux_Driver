...

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/companyName/platformName/bluetooth
BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true//commit by realtek
#BOARD_HAVE_BLUETOOTH_QCOM := true//commit by realtek
#BLUETOOTH_HCI_USE_MCT := true
#Realtek add start
BOARD_HAVE_BLUETOOTH_RTK := true
BOARD_HAVE_BLUETOOTH_RTK_COEX := true
#Realtek add end

...

...

#Realtek add start
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
     frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml
#realtek add end

#Realtek add start
$(call inherit-product, hardware/realtek/bt/firmware/rtlbtfw_cfg.mk)
#realtek add end


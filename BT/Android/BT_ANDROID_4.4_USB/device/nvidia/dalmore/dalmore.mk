...

#Realtek add start
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
     frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml
#realtek add end

#Realtek add start
$(call inherit-product, hardware/realtek/bt/firmware/rtl8723a/device-rtl.mk)
$(call inherit-product, hardware/realtek/bt/firmware/rtl8723b/device-rtl.mk)
$(call inherit-product, hardware/realtek/bt/firmware/rtl8821a/device-rtl.mk)
$(call inherit-product, hardware/realtek/bt/firmware/rtl8761a/device-rtl.mk)
$(call inherit-product, hardware/realtek/bt/firmware/rtl8822b/device-rtl.mk)
$(call inherit-product, hardware/realtek/bt/firmware/rtl8723d/device-rtl.mk)
#realtek add end


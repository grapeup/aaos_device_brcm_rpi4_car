PRODUCT_PACKAGE_OVERLAYS += \
    device/brcm/rpi4-car/overlay \
    device/generic/car/common/overlay

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    config.override_forced_orient=true \
    persist.bluetooth.enablenewavrcp=false

PRODUCT_IS_AUTO := true
DEVICE_PACKAGE_OVERLAYS += device/google/cuttlefish/shared/auto/overlay
ENABLE_EVS_SERVICE ?= true
ENABLE_MOCK_EVSHAL ?= true
ENABLE_CAREVSSERVICE_SAMPLE ?= true
ENABLE_SAMPLE_EVS_APP ?= true
ENABLE_CARTELEMETRY_SERVICE ?= true

CUSTOMIZE_EVS_SERVICE_PARAMETER := true
PRODUCT_PACKAGES += android.hardware.automotive.evs@1.1-service \
    android.frameworks.automotive.display@1.0-service
PRODUCT_COPY_FILES += \
    device/google/cuttlefish/shared/auto/evs/init.evs.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.evs.rc
BOARD_SEPOLICY_DIRS += device/google/cuttlefish/shared/auto/sepolicy/evs


# Auto modules
PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@V1-emulator-service \
    android.hardware.broadcastradio@2.0-service \
    android.hardware.automotive.audiocontrol@2.0-service \
    
  
# Runtime Resource Overlay for Connectivity
PRODUCT_PACKAGES += \
    CarConnectivityOverlay

# Car init.rc
PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/init/init.bootstat.rc:root/init.bootstat.rc \
    packages/services/Car/car_product/init/init.car.rc:root/init.car.rc

# Copy car_core_hardware and overwrite handheld_core_hardware.xml with a disable config.
# Overwrite goldfish related xml with a disable config.
PRODUCT_COPY_FILES += \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    device/generic/car/common/car_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/car_core_hardware.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.autofocus.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.any.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    device/generic/car/common/android.hardware.disable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \

# Overwrite goldfish fstab.ranchu to turn off adoptable_storage
PRODUCT_COPY_FILES += \
    device/generic/car/common/fstab.ranchu.car:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.ranchu

# Enable landscape
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml

# Used to embed a map in an activity view
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.activities_on_secondary_displays.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.activities_on_secondary_displays.xml

# Permission for Wi-Fi passpoint support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml

# Additional permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.broadcastradio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.broadcastradio.xml \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.type.automotive.xml \

# Sensor features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer_limited_axes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer_limited_axes.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope_limited_axes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope_limited_axes.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer_limited_axes_uncalibrated.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer_limited_axes_uncalibrated.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope_limited_axes_uncalibrated.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope_limited_axes_uncalibrated.xml \

# Copy APN configs
PRODUCT_COPY_FILES += \
    device/generic/goldfish/data/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/sample/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml


# Whitelisted packages per user type
PRODUCT_COPY_FILES += \
  device/generic/car/common/preinstalled-packages-product-car-emulator.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-product-car-emulator.xml

# Additional selinux policy
BOARD_SEPOLICY_DIRS += device/generic/car/common/sepolicy

# Whitelisted packages per user type
PRODUCT_COPY_FILES += \
    device/generic/car/common/preinstalled-packages-product-car-emulator.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-product-car-emulator.xml \
    device/google/cuttlefish/shared/auto/preinstalled-packages-product-car-cuttlefish.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-product-car-cuttlefish.xml

#overwrite boot animation
PRODUCT_COPY_FILES += \
    device/brcm/rpi4-car/bootanimation-car.zip:system/media/bootanimation.zip
    
# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

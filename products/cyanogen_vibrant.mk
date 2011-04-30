CYANOGEN_NIGHTLY := true
# Inherit AOSP device configuration for vibrant.
$(call inherit-product, device/samsung/vibrant/full_vibrant.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_vibrant
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := vibrant
PRODUCT_MODEL := SGH-T959
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRI40 BUILD_DISPLAY_ID=GRI40 BUILD_FINGERPRINT=google/soju/crespo:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.3 GRI40 102588 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-samsung
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogen_vibrant_defconfig

# Extra galaxys overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/vibrant

# Add the FM app
# PRODUCT_PACKAGES += FM

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Add additional mounts
PRODUCT_PROPERTY_OVERRIDES += \
    ro.additionalmounts=/mnt/emmc

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-Vibrant
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.2-Vibrant
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.2-Vibrant-KANG
    endif
endif

#
# Copy galaxys specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

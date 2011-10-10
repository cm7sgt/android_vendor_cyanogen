# Inherit device configuration for GalaxyTab.
$(call inherit-product, device/samsung/galaxytabc/device_galaxytabc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_galaxytabc
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := galaxytabc
PRODUCT_MODEL := SPH-P100
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

# Sprint
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SPH-P100 BUILD_ID=GINGERBREAD BUILD_DISPLAY_ID=GINGERBREAD.EF17 BUILD_FINGERPRINT=sprint/SPH-P100/SPH-P100:2.3.4/GINGERBREAD/EF17:user/release-keys PRIVATE_BUILD_DESC="SPH-P100-user 2.3.4 GINGERBREAD EF17 release-keys"

# Verizon
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SCH-I800 BUILD_ID=GINGERBREAD BUILD_DISPLAY_ID=GINGERBREAD.EF01 BUILD_FINGERPRINT=verizon/SCH-I800/SCH-I800:2.3.4/GINGERBREAD/EF01:user/release-keys PRIVATE_BUILD_DESC="SCH-I800-user 2.3.4 GINGERBREAD EF01 release-keys"

# Add the FM app
#PRODUCT_PACKAGES += FM

# Extra galaxytab overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/galaxytabc

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel/samsung/2.6.35-tab
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=p1_cm7_defconfig
#PRODUCT_SPECIFIC_DEFINES += TARGETARCH=arm

# Add additional mounts
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.removablemounts=/mnt/emmc

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7--NIGHTLY-GalaxyTab
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-Beta-GalaxyTab
    else
#        PRODUCT_PROPERTY_OVERRIDES += \
#            ro.modversion=CyanogenMod-7.1.0-Beta-GalaxyTab-KANG
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7-$(shell date +%Y-%m-%d)-Beta-GalaxyTab-KANG
    endif
endif

#
# Copy galaxytab specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

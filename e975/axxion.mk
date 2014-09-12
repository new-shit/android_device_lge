## Specify phone tech before including full_phone
$(call inherit-product, vendor/axxion/config/gsm.mk)

# Inherit some common Axxion stuff.
$(call inherit-product, vendor/axxion/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/axxion/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/e975/e975.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := e975
PRODUCT_NAME := axxion_e975
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-E975
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=geehrc_open_eu BUILD_FINGERPRINT=lge/geehrc_open_eu/geehrc:4.1.2/JZO54K/E97510b.1360741472:user/release-keys PRIVATE_BUILD_DESC="geehrc_open_eu-user 4.1.2 JZO54K E97510b.1360741472 release-keys"

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/axxion/prebuilt/common/bootanimation/768.zip:system/media/bootanimation.zip

# Enable Torch
PRODUCT_PACKAGES += Torch

#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL geehrc devices, and
# are also specific to geehrc devices
#
# Everything in this directory will become public
#
$(call inherit-product, device/lge/gproj-common/gproj.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES += \
	lights.geehrc

PRODUCT_COPY_FILES += \
	kernel/lge/gproj/drivers/staging/prima/firmware_bin/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	kernel/lge/gproj/drivers/staging/prima/firmware_bin/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
	$(LOCAL_PATH)/FTM_PowerTable.XML:system/etc/wifi/FTM_PowerTable.XML

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml \
	$(LOCAL_PATH)/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/00qcom:system/etc/init.d/00qcom \
        $(LOCAL_PATH)/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
        $(LOCAL_PATH)/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh


PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/DxHDCP.cfg:system/etc/DxHDCP.cfg

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald-geehrc.conf:system/etc/thermald.conf \
	$(LOCAL_PATH)/thermald-geehrc.conf:system/etc/thermald-8064.conf \
	$(LOCAL_PATH)/thermald-geehrc.conf:system/etc/thermald-engine-8064.conf

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/initlogo.rle:root/initlogo.rle888 \
	$(LOCAL_PATH)/init.geehrc.rc:root/init.geehrc.rc \
	$(LOCAL_PATH)/fstab.geehrc:root/fstab.geehrc \
	$(LOCAL_PATH)/ueventd.geehrc.rc:root/ueventd.geehrc.rc

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	$(LOCAL_PATH)/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	$(LOCAL_PATH)/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	$(LOCAL_PATH)/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm

#These are hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_PACKAGES += \
	hci_qcomm_init

#PRODUCT_PACKAGES += \
#	power.msm8960

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.geehrc.bt.sh:system/etc/init.geehrc.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
	camera.msm8960 \
	libmmcamera_interface2 \
	libmmcamera_interface

PRODUCT_PACKAGES += \
	libwfcu \
	conn_init

PRODUCT_PACKAGES += \
	keystore.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so \
	rild.libargs=-d/dev/smd0 \
	ril.subscription.types=NV,RUIM \
	ro.ril.transmitpower=true \
	persist.qcril.disable_retry=true \
	telephony.lteOnCdmaDevice=0 \
	ro.telephony.default_network=9 \
	telephony.lteOnGsmDevice=1

PRODUCT_PROPERTY_OVERRIDES += \
	persist.gps.qmienabled=true \
	persist.gps.qc_nlp_in_use=0 \
	ro.gps.agps_provider=1

PRODUCT_PACKAGES += \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

## FM 
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.gee.fm.sh:system/etc/init.gee.fm.sh \
	$(LOCAL_PATH)/audio_policy.conf:system/vendor/etc/audio_policy.conf

# initramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/init.gee-common.rc:root/init.gee-common.rc \
	$(LOCAL_PATH)/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
	$(LOCAL_PATH)/root/init.qcom.usb.sh:root/init.qcom.usb.sh

PRODUCT_PACKAGES += \
	FM2 \
	qcom.fmradio \
	libqcomfm_jni

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

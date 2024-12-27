# Copyright (C) 2017 The Lineage Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from SPRD common configs
-include device/samsung/sprd-common/BoardConfigCommon.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_NO_BOOTLOADER := true
BOARD_VENDOR := samsung

# Bluetooth
USE_BLUETOOTH_BCM4343 := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/scx35-common/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/scx35-common/bluetooth/libbt_vndcfg.txt

# RIL
TARGET_DISABLE_ASHMEM_TRACKING := true

# Graphics
BOARD_EGL_NEEDS_HANDLE_VALUE := true
USE_SPRD_DITHER := true
USE_SPRD_HWCOMPOSER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# HIDL
DEVICE_MANIFEST_FILE := device/samsung/scx35-common/configs/manifest.xml

# Codecs
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# seccomp
#BOARD_SECCOMP_POLICY := device/samsung/scx35-common/seccomp # This flag is dead?

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/scx35-common/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x01d88000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# PowerHAL
TARGET_POWERHAL_VARIANT := scx35

# Build system
WITHOUT_CHECK_API := true

# Lights
TARGET_HAS_BACKLIT_KEYS := false

# Target shims
TARGET_LD_SHIM_LIBS := \
	/system/vendor/bin/gpsd|libgps_shim.so

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec

# Board specific features
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# GPS
TARGET_SPECIFIC_HEADER_PATH := device/samsung/scx35-common/include

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Enable dex-preoptimization to speed up first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
PRODUCT_DEX_PREOPT_BOOT_FLAGS += --compiler-filter=speed
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed
WITH_DEX_PREOPT_GENERATE_PROFILE := false

# SELinux policy
#BOARD_SEPOLICY_DIRS += device/samsung/scx35-common/sepolicy

#
# Copyright (C) 2018 The LineageOS Project
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

DEVICE_PATH := device/lge/caymanslm

# Partitions
BOARD_SUPER_PARTITION_SIZE := 21470642176

# Inherit from common device tree
include device/lge/sdm845-common/BoardConfigCommon.mk

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hardware=caymanslm androidboot.fstab_suffix=caymanslm
TARGET_KERNEL_CONFIG := lineageos_caymanslm_defconfig

# Lights
$(call soong_config_set,LGE_LIGHTS_HAL,INCLUDE_DIR,$(DEVICE_PATH)/include)

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# inherit from the proprietary version
include vendor/lge/caymanslm/BoardConfigVendor.mk

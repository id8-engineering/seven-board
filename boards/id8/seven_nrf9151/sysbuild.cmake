# Copyright (c) 2026 ID8 Engineering AB
# SPDX-License-Identifier: Apache-2.0

# Partition Manager applications provide their own TF-M layout and may require
# services that are unavailable in the minimal profile.
if(SB_CONFIG_PARTITION_MANAGER)
  set_config_bool(${DEFAULT_IMAGE} CONFIG_TFM_PROFILE_TYPE_MINIMAL n)
endif()

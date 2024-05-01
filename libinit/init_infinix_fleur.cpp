/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>
#include <libinit_utils.h>

#include "vendor_init.h"

#define FINGERPRINT_FL "Infinix/X695C-GL/Infinix-X695C:11/RP1A.200720.011/221114V356:user/release-keys"

static const variant_info_t fleur_info = {
    .hwc_value = "Global",
    .sku_value = "fleur",
    .brand = "Redmi",
    .device = "fleur",
    .marketname = "Infinix Note 10 Pro",
    .model = "X695C",
    .mod_device = "fleur_global",
    .build_fingerprint = FINGERPRINT_FL,
};

static const std::vector<variant_info_t> variants = {
    fleur_info,
};

void vendor_load_properties() {
    set_dalvik_heap();
    search_variant(variants);

    // SafetyNet workaround
    property_override("ro.boot.verifiedbootstate", "green");
}

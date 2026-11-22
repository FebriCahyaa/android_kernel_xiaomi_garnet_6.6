# Xiaomi garnet kernel 6.6

Kernel 6.6 untuk **Xiaomi garnet** (Redmi Note 13 Pro 5G / POCO X6 5G,
Snapdragon 7s Gen 2 / SM7435).

## Status

Base bring-up. Saat ini berisi:

- AOSP Android Common Kernel `android15-6.6-lts` (Linux 6.6.162)
- Build config & defconfig vendor Qualcomm untuk platform `kera` (4 KiB)

Patch device-spesifik Xiaomi garnet (thermal, charger, fingerprint/FOD)
**belum** diterapkan dan akan ditambahkan sebagai commit terpisah.

## Rincian sumber

Lihat [`PROVENANCE.md`](PROVENANCE.md) untuk sumber hulu, commit, dan
atribusi lengkap.

## Build

Pohon ini memakai sistem build Kleaf/Bazel bawaan AOSP kernel (`tools/bazel`,
`BUILD.bazel`, `*.bzl`). Defconfig vendor yang relevan:

```
arch/arm64/configs/vendor/kera_le.config
arch/arm64/configs/vendor/kera_le_debug.config
build.config.msm.kera.le
```

Pastikan versi kernel dan KMI sinkron dengan `vendor_dlkm` ROM yang dipakai.

## License

GPL-2.0.

# Contributors

Daftar ini merangkum peran utama dalam pembangunan kernel `garnet-6.6`
(ZairenOX). Daftar lengkap penulis tetap ada di histori git (`git shortlog -sn`)
dan di `CREDITS`. Setiap commit impor mempertahankan author, copyright,
`Change-Id`, dan `Signed-off-by` aslinya.

## Integrasi dan pemeliharaan

- **FEBRIAN RAHMAD CAHYA** (`FebriCahyaa`) — branch `garnet-6.6`, identitas
  ZairenOX, integrasi vendor SM7435, UMM, EAS/thermal-pressure, perbaikan build
  `build.config.msm.perf`, AnyKernel boot-only, dan profil `garnet-6.6` di
  `ci-build`.

## Hulu kernel

- **Linux kernel community** dan **AOSP `kernel/common`** — basis
  `android15-6.6-lts` / Linux 6.6.162. Kontributor hulu yang commit-nya ikut
  dalam tree ini antara lain Greg Kroah-Hartman, Sasha Levin, Rafael J.
  Wysocki, Eric Dumazet, Christoph Hellwig, Johannes Berg, dan ratusan penulis
  lain yang tercatat di `CREDITS`.
- **Android Security Bulletin** — baseline `ASB-2026-11-02_15-6.6` sudah
  menjadi ancestor dari basis 6.6.162.

## Vendor Qualcomm / SM7435

- **Qualcomm CodeLinaro / CLO-derived tree** — build config MSM, Kleaf
  extension, defconfig `kera`, dan module list. Commit asal yang tercatat di
  `PROVENANCE.md`: `3cc5e84d`, `6c1158bf`, `23e6f13a`.
- Penulis patch device Xiaomi garnet (thermal, charger, fingerprint/FOD,
  panel, hardware ID) tetap tercantum pada trailer commit masing-masing.

## Tuning performa yang diimpor

- **John Galt** — `block/blk-throttle: tweak for flash` (`fded55e59405`).
- **ZetyaWyn** — `block: blk-throttle: Define missing throttle quantum values`
  (`3b8632730b1d`).
- Penulis commit tuning cpuidle, jaringan (`fq_codel`, BBR), `NTSYNC`, dan
  LZ4KD yang tercantum di bagian *Garnet performance and feature tuning* pada
  [`PROVENANCE.md`](PROVENANCE.md).

## Proyek pendamping

- **LineageOS 24.0** — device/vendor `garnet-6.6`, `init.target.rc` untuk UMM,
  dan properti Zairenkai.
- **`packages_apps_XiaomiParts`** (`garnet-6.6`) — UI profil UMM dan
  pengaturan charging; tidak mengubah Tier 3 secara otomatis.
- **`android_kernel_xiaomi_sm7435-modules`** dan
  **`android_kernel_xiaomi_sm7435-devicetrees`** (`garnet-6.6`) — module UAPI
  dan devicetree pendamping.
- **`ci-build`** — satu harness untuk GitHub Actions, Harness, dan local
  build, termasuk toolchain AOSP `clang-r510928` dan kemasan AnyKernel.
- Penyedia varian root (`KernelSU-Next`, `SUSFS`, `FinaSU`) — dipakai hanya
  sebagai seed branch CI, bukan bagian dari source dasar ini.

## License

GPL-2.0 sesuai Linux kernel; lihat `COPYING` dan `LICENSES/`.

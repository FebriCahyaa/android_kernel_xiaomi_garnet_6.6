# ZairenOX — Kernel Xiaomi Garnet 6.6

Kernel 6.6 GKI untuk **Xiaomi garnet** (Redmi Note 13 Pro 5G / POCO X6 5G,
Snapdragon 7s Gen 2 / SM7435, halaman 4 KiB).

Branch `garnet-6.6` adalah source bersih untuk daily driver: hulu AOSP
`android15-6.6-lts` (Linux 6.6.162) ditambah integrasi vendor Qualcomm SM7435
dan patch device garnet. Tidak ada provider root/hiding (`KSU`, `KSU_SUSFS*`,
`NOMOUNT`) di source dasar; varian root dibangun terpisah oleh
[`ci-build`](https://github.com/FebriCahyaa/ci-build).

## Status saat ini

- Basis: AOSP `kernel/common` `android15-6.6-lts`, Linux `6.6.162`.
- Identitas: `NAME = ZairenOX`, `CONFIG_LOCALVERSION="-ZairenOX-Oz1B"`
  → `uname -r` = `6.6.162-ZairenOX-Oz1B`.
- Integrasi device/vendor: charger & fuel gauge, fingerprint/FOD, haptics,
  panel notifier, hardware ID, thermal interface, IR/ipset/overlayfs, dan
  module UAPI dari repo modules garnet 6.6.
- Penjadwalan: EAS (schedutil + energy model + uclamp + thermal pressure).
- Memori: Unified Memory Management (UMM) — lihat [`UMM.md`](UMM.md).
- Build produksi: profil `garnet-6.6` di `ci-build`; AnyKernel hanya
  mengganti `boot` (Image). `init_boot`, `DTBO` vendor, dan `system_dlkm`
  tidak disentuh. Modul `.ko` hasil build ikut diarsipkan.

## Build

Jalur utama adalah `ci-build`, satu implementasi yang dipakai GitHub Actions,
Harness, dan build lokal:

```sh
BUILD_PROFILE=garnet-6.6 VARIANTS=default TOOLCHAIN=aosp-sparse \
  ./scripts/start_local_ci.sh
```

Profil ini memakai `gki_defconfig` plus fragmen
`vendor/parrot_perf.config,vendor/garnet_GKI.config` dan AOSP Clang
`clang-r510928` dari `main-kernel-build-2024` (checkout sparse, karena arsip
gitiles untuk revisi itu terlalu besar).

Jalur Kleaf/MSM masih tersedia untuk integrasi vendor lama. Perlu dicatat:

- `build.config.gki-debug.aarch64` sudah dihapus upstream; source sekarang
  jatuh ke `build.config.gki.aarch64` dan menerima override `GKI_BUILD_CONFIG`.
- `build.config.msm.kera.le` berbasis `generic_le_defconfig` dari tree MSM;
  file itu tidak ikut di AOSP `kernel/common`, jadi jalur ini memerlukan tree
  vendor yang lengkap.

## EAS dan penjadwalan

Konfigurasi yang dipakai (semua bersumber dari upstream, bukan patch
scheduler buatan):

| Fitur | Config | Efek |
|---|---|---|
| Governor utama | `CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y` | frekuensi mengikuti utilisasi tugas |
| Energy model | `CONFIG_ENERGY_MODEL=y` | EAS mempertimbangkan biaya energi cluster |
| Utilization clamp | `CONFIG_UCLAMP_TASK=y`, `UCLAMP_BUCKETS_COUNT=20`, `UCLAMP_TASK_GROUP=y` | Android membatasi/minimalisasi utilitas per task/cgroup |
| Topologi cluster | `CONFIG_SCHED_MC=y` | scheduler sadar cluster big.LITTLE |
| Thermal pressure | `CONFIG_CPU_FREQ_THERMAL=y` → `CONFIG_SCHED_THERMAL_PRESSURE` | tugas dialihkan dari CPU yang sedang di-throttle |
| Tick | `CONFIG_HZ=250` | default arm64, overhead interrupt rendah |
| Tekanan memori/CPU | `CONFIG_PSI=y`, `CONFIG_LRU_GEN_ENABLED=y` | visibility reclaim dan MGLRU aktif |

Batas suhu, trip point, dan tabel frekuensi tetap berasal dari firmware/DT
vendor. Tidak ada angka CPU/GPU buatan yang ditanam di DTS maupun config.
`qcom-cpufreq-hw` membaca EPSS LUT dari firmware, dan driver LMH-nya yang
mengisi sinyal `arch_update_thermal_pressure()`; `CONFIG_CPU_FREQ_THERMAL`
mengaktifkan akuntansi thermal pressure di scheduler.

## Memori dan varian RAM 8/12/16 GB

Binary kernel GKI **sama** untuk ketiga varian RAM — tidak ada fork kernel per
kapasitas RAM. Yang membedakan adalah profil userspace (XiaomiParts UMM) dan
ukuran zram yang ditetapkan skrip vendor saat boot. Kebijakan kernel menjaga
overhead tetap rendah: LZ4 untuk zram, MGLRU aktif, THP hanya `madvise`, KSM
tidak dinyalakan, dan tidak ada config debug di jalur `perf` setelah
penggabungan fragmen.

| RAM | Profil UMM yang disarankan | Swappiness / compaction | Catatan |
|---|---|---|---|
| 8 GB | `conservative` (default aman) | 60 / 10 | Utamakan waktu respons; jangan aktifkan writeback otomatis. |
| 12 GB | `balanced` | 100 / 20 | Keseimbangan daily driver; profil `performance` hanya untuk beban berat. |
| 16 GB | `balanced` | 100 / 20 | `performance` (150 / 40) opsional; RAM besar tidak perlu agresif reclaim. |

Skrip vendor `init.kernel.post_boot.sh` menetapkan zram hingga 50% RAM dengan
batas 4 GB (jadi 8/12/16 GB semuanya dibatasi 4 GB virtual). Ini adalah batas
*virtual*, bukan RAM yang langsung terpakai; pemakaian nyata mengikuti data
yang dikompresi. Tier 3 (cold-page writeback ke UFS) tetap **manual** lewat
`scripts/garnet_umm_setup.sh` dan tidak pernah diaktifkan otomatis.

Pemeriksaan cepat di perangkat:

```sh
uname -r                                   # 6.6.162-ZairenOX-Oz1B
zcat /proc/config.gz | grep -E 'CPU_FREQ_GOV_SCHEDUTIL|CPU_FREQ_THERMAL|SWAP|ZRAM'
cat /proc/sys/vm/swappiness /proc/sys/vm/compaction_proactiveness
adb shell dumpsys meminfo | head -n 20
```

## Kebijakan source

- Hulu tetap AOSP/MSM; atribusi, copyright, `Change-Id`, dan `Signed-off-by`
  asli dipertahankan. Detail lengkap di [`PROVENANCE.md`](PROVENANCE.md).
- Kontributor dan peran integrasi tercantum di [`CONTRIBUTORS.md`](CONTRIBUTORS.md).
- Varian `kernelsu-next`, `kernelsu-next-susfs`, dan `finasu` adalah branch
  seed yang dipakai `ci-build`, bukan bagian dari branch `garnet-6.6`.
- `VINTF target-level="7"` mengikuti LineageOS 24.0; requalifikasi VINTF penuh
  dan full ROM build/boot test masih perlu dilakukan pada tree lengkap.

## License

GPL-2.0, sesuai Linux kernel. Lihat `COPYING` dan `LICENSES/`.

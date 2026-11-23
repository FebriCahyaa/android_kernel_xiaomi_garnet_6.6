# Provenance

This tree is assembled from upstream sources. No authorship or copyright
notices have been removed. All imported files retain their original headers
and `Signed-off-by` trailers where applicable.

## Base kernel (AOSP Android Common Kernel)

- Project: `kernel/common` (Android Open Source Project)
- Branch: `android15-6.6-lts`
- Commit: `824580839cbc0d47e64dd2bbdef66590a57ef92d`
- Version: Linux `6.6.162`
- URL: https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6-lts

## Qualcomm MSM vendor build bits

- Platform: Qualcomm **SM7435** (`kera`, 4 KiB pages), used by Xiaomi **garnet**
  (Redmi Note 13 Pro 5G / POCO X6 5G).
- Upstream: Qualcomm CodeLinaro `kernel/common`, msm build configs and Kleaf
  extensions:
  - https://git.codelinaro.org/clo/la/kernel/common
  - https://git.codelinaro.org/clo/kernel-platform-2-0-os/kernel/common
- The public CLO mirrors do not expose a single clean `android15-6.6` vendor
  branch, so the msm files were taken from an already-audited local tree that
  carries the same CLO-derived files. Originating commits in that tree:
  - `3cc5e84d` — `kernel: add the kera le target`
  - `6c1158bf` — `arm64: defconfig: add initial configs for kera LE target`
  - `23e6f13a` — `qcom_build_extensions: Add socrepo flag in the externel path`

Imported paths:

- `build.config.msm.*`
- `modules.*.msm.*`
- `qcom_build_extensions/`
- root `*.bzl` (target variants, `kera_le`, `msm_*`, etc.)
- `arch/arm64/configs/vendor/*`, excluding `garnet_*`

## Android Security Bulletin baseline

- Newest tagged ASB baseline for this series: `ASB-2026-11-02_15-6.6`
  (Linux `6.6.144`, commit `33f64c1712cc700513431ed498b35db84c20d411`).
- That tag is already an ancestor of the `6.6.162` base above, so merging it
  would be a no-op. Future upstream syncs should track `android15-6.6-lts`
  (currently the same commit as the base) and pick up later ASB tags when they
  are published.
- URL: https://android.googlesource.com/kernel/common/+/refs/tags/ASB-2026-11-02_15-6.6

## Garnet device and vendor additions

- Xiaomi garnet device patches (thermal, hardware ID, charger stack, panel/FOD
  and related config) are imported as individual commits with their original
  authors preserved.
- The Qualcomm download-mode stack was backported manually against the AOSP
  `6.6.162` SCM driver: `drivers/firmware/qcom_scm.c` keeps the upstream
  `static bool` path and gains the vendor enum API alongside it, while
  `drivers/power/reset/qcom-dload-mode.c`, its Kconfig/Makefile entries and
  `include/soc/qcom/minidump.h` come from the CLO-derived tree.
- Root/hiding features (`KSU`, `KSU_SUSFS*`, `NOMOUNT`, custom
  `CONFIG_LOCALVERSION`) are intentionally excluded.

## License

GPL-2.0, as defined by the Linux kernel. See `COPYING` and `LICENSES/`.

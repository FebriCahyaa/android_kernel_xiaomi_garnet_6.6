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

## Deliberately not included yet

- Xiaomi garnet device patches (thermal control, battery charger properties,
  fingerprint/FOD drivers) and any root solution. These will be added later as
  separate, individually attributed commits.

## License

GPL-2.0, as defined by the Linux kernel. See `COPYING` and `LICENSES/`.

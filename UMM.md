# Garnet Unified Memory Management (UMM)

UMM is the policy used by this kernel and `packages_apps_XiaomiParts` to treat
LPDDR4X, compressed RAM and UFS 2.2 as one memory hierarchy. It is **not** an
upstream Linux or Android standard name; it is our contract for wiring tunables
that otherwise live in unrelated sysfs files.

## Tiers

| Tier | Mechanism | Interface | Default |
|---|---|---|---|
| 0 | Physical LPDDR4X pages | `/proc/meminfo`, memcg | always on |
| 1 | zram compression (LZ4) | `/sys/block/zram0/{comp_algorithm,orig_data_size,compr_data_size,mem_used_total}` | on when Android enables zram |
| 2 | VM reclaim policy | `/proc/sys/vm/{swappiness,compaction_proactiveness}` | app profile |
| 3 | Cold-page writeback to UFS 2.2 | `/sys/block/zram0/{backing_dev,writeback_limit,writeback_limit_enable}` | opt-in, manual |
| 4 | Shared CPU/GPU buffers | `CONFIG_DMABUF_SYSFS_STATS`, `/sys/kernel/dmabuf` | on when kernel exports it |

Tier 3 is dangerous if automated: a wrong backing device can corrupt a mounted
partition. It is therefore only configured by `scripts/garnet_umm_setup.sh`
from a root shell, and the app only reports its state.

## Kernel requirements

- `CONFIG_SWAP=y` — without it `swapon()` and zram-as-swap do not work.
- `CONFIG_ZRAM=y` with `CONFIG_ZRAM_DEF_COMP_LZ4=y` and `CONFIG_ZRAM_WRITEBACK=y`.
- `CONFIG_DMABUF_SYSFS_STATS=y` for Tier 4 visibility.

These are set in `arch/arm64/configs/consolidate.fragment`.

## Device-tree requirement

Garnet identifies its UFS 2.2 controller with `ufs-dev-types = <2>` and
`qcom,ufs-dev-revert` in `xiaomi-sm7435-common.dtsi`. Those values must stay
unchanged; UMM does not touch clocks, regulators or PHY settings.

## Userspace

The app's `memory/UnifiedMemoryManager.kt` reads all tiers, applies Tier 2
profiles, and never writes Tier 3 nodes. See its PROVENANCE section for the
exact profile values.

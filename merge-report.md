# Upstream merge report
Mon Nov 23 17:09:41 UTC 2026
## aosp/android15-6.6-lts
Merge made by the 'ort' strategy.
 android/abi_gki_aarch64.stg                     |  20 +++++++++
 android/abi_gki_aarch64_zebra                   |   2 +
 android/gki/aarch64/afdo/README.md              |  16 +++----
 android/gki/aarch64/afdo/kernel.afdo            | Bin 4156431 -> 3426960 bytes
 arch/arm64/kvm/hyp/include/hyp/switch.h         |   2 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c              |   6 +++
 arch/arm64/mm/contpte.c                         |  53 ++++++++++++++++++++++--
 arch/riscv/kernel/cpufeature.c                  |  23 +++++-----
 drivers/cpufreq/scmi-cpufreq.c                  |   1 +
 drivers/firmware/arm_ffa/driver.c               |  33 +++++++++++++--
 fs/f2fs/data.c                                  |  12 +++++-
 fs/f2fs/sysfs.c                                 |   2 +-
 fs/kernfs/dir.c                                 |   2 +
 include/linux/energy_model.h                    |   2 +-
 mm/huge_memory.c                                |   4 +-
 mm/percpu.c                                     |  18 +++++---
 mm/swapfile.c                                   |   1 +
 net/l2tp/l2tp_core.c                            |  11 ++---
 net/vmw_vsock/virtio_transport_common.c         |   5 +--
 net/wireless/scan.c                             |   2 +-
 sound/virtio/virtio_kctl.c                      |  50 ++++++++++++++++++++++
 sound/virtio/virtio_pcm.h                       |   1 -
 tools/testing/selftests/bpf/progs/dmabuf_iter.c |   2 +-
 23 files changed, 217 insertions(+), 51 deletions(-)
## linux-stable/linux-6.6.y
Auto-merging Documentation/admin-guide/cgroup-v2.rst
Auto-merging Documentation/admin-guide/kernel-parameters.txt
Auto-merging Documentation/filesystems/overlayfs.rst
Auto-merging Documentation/networking/ip-sysctl.rst
Auto-merging MAINTAINERS
Auto-merging Makefile
Auto-merging arch/arm/kernel/smp.c
Auto-merging arch/arm/mm/mmu.c
Auto-merging arch/arm64/include/asm/kvm_host.h
Auto-merging arch/arm64/kernel/efi.c
Auto-merging arch/arm64/kernel/entry-common.c
Auto-merging arch/arm64/kernel/topology.c
Auto-merging arch/arm64/kvm/arch_timer.c
Auto-merging arch/arm64/kvm/arm.c
Auto-merging arch/arm64/kvm/hyp/exception.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp/exception.c
CONFLICT (modify/delete): arch/arm64/kvm/hyp/include/nvhe/fixed_config.h deleted in HEAD and modified in linux-stable/linux-6.6.y.  Version linux-stable/linux-6.6.y of arch/arm64/kvm/hyp/include/nvhe/fixed_config.h left in tree.
Auto-merging arch/arm64/kvm/hyp/include/nvhe/pkvm.h
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp/include/nvhe/pkvm.h
Auto-merging arch/arm64/kvm/hyp/nvhe/pkvm.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp/nvhe/pkvm.c
Auto-merging arch/arm64/kvm/hyp/nvhe/setup.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp/nvhe/setup.c
Auto-merging arch/arm64/kvm/hyp/nvhe/sys_regs.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp/nvhe/sys_regs.c
Auto-merging arch/arm64/kvm/hyp/vhe/switch.c
Auto-merging arch/arm64/kvm/vgic/vgic-its.c
Auto-merging arch/arm64/mm/mmu.c
Auto-merging arch/riscv/include/asm/pgtable.h
Auto-merging arch/riscv/net/bpf_jit_comp32.c
Auto-merging arch/x86/events/core.c
Auto-merging arch/x86/events/intel/lbr.c
Auto-merging arch/x86/kernel/process.c
Auto-merging arch/x86/kvm/hyperv.c
Auto-merging arch/x86/kvm/x86.c
Auto-merging arch/x86/kvm/xen.c
Auto-merging block/bdev.c
Auto-merging block/blk-cgroup.c
Auto-merging block/blk-cgroup.h
Auto-merging block/blk-crypto-fallback.c
Auto-merging block/blk-iocost.c
Auto-merging block/blk-iolatency.c
Auto-merging block/blk-map.c
Auto-merging block/blk-merge.c
Auto-merging block/blk-mq.c
Auto-merging block/blk-rq-qos.c
Auto-merging block/blk-throttle.c
Auto-merging block/blk.h
Auto-merging block/fops.c
Auto-merging crypto/testmgr.c
Auto-merging drivers/acpi/pci_root.c
Auto-merging drivers/base/bus.c
Auto-merging drivers/base/core.c
Auto-merging drivers/base/dd.c
Auto-merging drivers/base/regmap/regcache-maple.c
Auto-merging drivers/block/loop.c
Auto-merging drivers/bluetooth/btusb.c
Auto-merging drivers/char/hw_random/core.c
Auto-merging drivers/clk/clk-si5351.c
Auto-merging drivers/clk/clk.c
Auto-merging drivers/cpufreq/amd-pstate.c
Auto-merging drivers/cpufreq/cpufreq_conservative.c
Auto-merging drivers/cpufreq/cpufreq_governor.c
Auto-merging drivers/cpufreq/cpufreq_governor.h
Auto-merging drivers/cpufreq/qcom-cpufreq-hw.c
Auto-merging drivers/cpufreq/sparc-us2e-cpufreq.c
Auto-merging drivers/cpufreq/tegra194-cpufreq.c
Auto-merging drivers/cpuidle/governors/teo.c
Auto-merging drivers/firmware/arm_scmi/common.h
Auto-merging drivers/firmware/arm_scmi/driver.c
Auto-merging drivers/firmware/arm_scmi/protocols.h
Auto-merging drivers/firmware/arm_scmi/raw_mode.c
Auto-merging drivers/gpio/gpio-mvebu.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
Auto-merging drivers/gpu/drm/vc4/vc4_hdmi.c
Auto-merging drivers/hid/hid-core.c
Auto-merging drivers/hid/hid-logitech-hidpp.c
Auto-merging drivers/hid/hid-multitouch.c
Auto-merging drivers/hid/wacom_sys.c
Auto-merging drivers/hv/vmbus_drv.c
Auto-merging drivers/i3c/master.c
Auto-merging drivers/infiniband/core/sysfs.c
Auto-merging drivers/infiniband/core/verbs.c
Auto-merging drivers/iommu/dma-iommu.c
Auto-merging drivers/irqchip/irq-gic-v3-its.c
Auto-merging drivers/irqchip/irq-gic-v3.c
Auto-merging drivers/md/dm-bufio.c
Auto-merging drivers/md/dm-integrity.c
Auto-merging drivers/md/dm.c
Auto-merging drivers/media/cec/core/cec-adap.c
Auto-merging drivers/media/rc/ene_ir.c
Auto-merging drivers/media/rc/fintek-cir.c
Auto-merging drivers/media/rc/imon.c
Auto-merging drivers/media/rc/ir-hix5hd2.c
Auto-merging drivers/media/rc/ir_toy.c
Auto-merging drivers/media/rc/rc-ir-raw.c
CONFLICT (content): Merge conflict in drivers/media/rc/rc-ir-raw.c
Auto-merging drivers/media/rc/rc-main.c
Auto-merging drivers/media/rc/redrat3.c
Auto-merging drivers/media/rc/streamzap.c
Auto-merging drivers/media/rc/sunxi-cir.c
Auto-merging drivers/mmc/core/block.c
Auto-merging drivers/net/bonding/bond_main.c
Auto-merging drivers/net/ethernet/broadcom/bnxt/bnxt.c
Auto-merging drivers/net/ethernet/ti/am65-cpsw-nuss.c
Auto-merging drivers/net/gtp.c
Auto-merging drivers/net/ppp/ppp_generic.c
Auto-merging drivers/net/ppp/pppoe.c
Auto-merging drivers/net/team/team_core.c
Auto-merging drivers/net/vxlan/vxlan_core.c
Auto-merging drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
Auto-merging drivers/nvme/host/zns.c
Auto-merging drivers/nvme/target/core.c
Auto-merging drivers/nvme/target/zns.c
Auto-merging drivers/nvmem/layouts/onie-tlv.c
Auto-merging drivers/nvmem/layouts/sl28vpd.c
Auto-merging drivers/opp/core.c
Auto-merging drivers/opp/of.c
Auto-merging drivers/pci/controller/dwc/pcie-designware.h
Auto-merging drivers/pci/pci.c
Auto-merging drivers/pci/pci.h
Auto-merging drivers/pci/probe.c
Auto-merging drivers/pci/quirks.c
Auto-merging drivers/pinctrl/stm32/pinctrl-stm32.c
Auto-merging drivers/power/supply/power_supply_core.c
Auto-merging drivers/power/supply/power_supply_sysfs.c
Auto-merging drivers/remoteproc/remoteproc_core.c
Auto-merging drivers/rpmsg/virtio_rpmsg_bus.c
Auto-merging drivers/s390/crypto/vfio_ap_ops.c
Auto-merging drivers/scsi/qla2xxx/qla_os.c
Auto-merging drivers/scsi/scsi_debug.c
Auto-merging drivers/spi/spi.c
Auto-merging drivers/target/target_core_user.c
Auto-merging drivers/ufs/core/ufshcd.c
CONFLICT (content): Merge conflict in drivers/ufs/core/ufshcd.c
Auto-merging drivers/usb/core/driver.c
Auto-merging drivers/usb/dwc3/gadget.c
Auto-merging drivers/usb/gadget/composite.c
Auto-merging drivers/usb/gadget/configfs.c
Auto-merging drivers/usb/gadget/function/f_mass_storage.c
Auto-merging drivers/usb/host/xhci-ring.c
Auto-merging drivers/vfio/fsl-mc/vfio_fsl_mc.c
Auto-merging drivers/vhost/vdpa.c
Auto-merging drivers/vhost/vsock.c
CONFLICT (content): Merge conflict in drivers/vhost/vsock.c
Auto-merging drivers/virtio/virtio.c
Auto-merging drivers/virtio/virtio_balloon.c
Auto-merging drivers/virtio/virtio_ring.c
Auto-merging fs/9p/v9fs.c
Auto-merging fs/aio.c
Auto-merging fs/ceph/crypto.c
Auto-merging fs/ceph/inode.c
Auto-merging fs/ceph/super.c
Auto-merging fs/dcache.c
Auto-merging fs/erofs/decompressor.c
Auto-merging fs/erofs/zdata.c
Auto-merging fs/eventpoll.c
Auto-merging fs/exec.c
Auto-merging fs/exfat/balloc.c
Auto-merging fs/exfat/dir.c
Auto-merging fs/ext4/crypto.c
Auto-merging fs/ext4/inode.c
Auto-merging fs/ext4/super.c
Auto-merging fs/f2fs/checkpoint.c
Auto-merging fs/f2fs/compress.c
Auto-merging fs/f2fs/data.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
Auto-merging fs/f2fs/dir.c
Auto-merging fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/f2fs/file.c
Auto-merging fs/f2fs/gc.c
Auto-merging fs/f2fs/inline.c
Auto-merging fs/f2fs/namei.c
Auto-merging fs/f2fs/node.c
Auto-merging fs/f2fs/segment.c
Auto-merging fs/f2fs/super.c
Auto-merging fs/fat/inode.c
Auto-merging fs/fat/namei_msdos.c
Auto-merging fs/fs-writeback.c
CONFLICT (content): Merge conflict in fs/fs-writeback.c
Auto-merging fs/fuse/dir.c
Auto-merging fs/fuse/file.c
Auto-merging fs/fuse/virtio_fs.c
Auto-merging fs/inode.c
CONFLICT (content): Merge conflict in fs/inode.c
Auto-merging fs/iomap/buffered-io.c
Auto-merging fs/isofs/inode.c
Auto-merging fs/jbd2/journal.c
Auto-merging fs/kernfs/dir.c
Auto-merging fs/lockd/svclock.c
Auto-merging fs/namespace.c
Auto-merging fs/nfs/nfs4proc.c
Auto-merging fs/nfsd/nfsctl.c
Auto-merging fs/ntfs3/ntfs_fs.h
Auto-merging fs/ntfs3/super.c
Auto-merging fs/ocfs2/super.c
Auto-merging fs/overlayfs/copy_up.c
Auto-merging fs/overlayfs/dir.c
Auto-merging fs/overlayfs/file.c
Auto-merging fs/overlayfs/inode.c
Auto-merging fs/overlayfs/namei.c
Auto-merging fs/overlayfs/overlayfs.h
Auto-merging fs/overlayfs/readdir.c
CONFLICT (content): Merge conflict in fs/overlayfs/readdir.c
Auto-merging fs/overlayfs/super.c
Auto-merging fs/overlayfs/util.c
Auto-merging fs/read_write.c
Auto-merging fs/romfs/super.c
Auto-merging fs/smb/client/cifsfs.c
Auto-merging fs/smb/server/server.c
Auto-merging fs/smb/server/smb2pdu.c
Auto-merging fs/splice.c
Auto-merging fs/stat.c
Auto-merging fs/udf/super.c
Auto-merging fs/userfaultfd.c
Auto-merging fs/verity/open.c
Auto-merging fs/xattr.c
Auto-merging include/asm-generic/tlb.h
Auto-merging include/kvm/arm_vgic.h
Auto-merging include/linux/blk-mq.h
Auto-merging include/linux/bpf.h
Auto-merging include/linux/clk-provider.h
Auto-merging include/linux/damon.h
Auto-merging include/linux/device.h
Auto-merging include/linux/device/bus.h
CONFLICT (content): Merge conflict in include/linux/device/bus.h
Auto-merging include/linux/etherdevice.h
Auto-merging include/linux/fs.h
Auto-merging include/linux/hid.h
Auto-merging include/linux/interrupt.h
Auto-merging include/linux/irq.h
Auto-merging include/linux/memcontrol.h
Auto-merging include/linux/mm.h
Auto-merging include/linux/mm_types.h
Auto-merging include/linux/mmu_notifier.h
Auto-merging include/linux/perf_event.h
Auto-merging include/linux/power_supply.h
Auto-merging include/linux/remoteproc.h
Auto-merging include/linux/rtc.h
Auto-merging include/linux/shmem_fs.h
Auto-merging include/linux/skbuff.h
Auto-merging include/linux/userfaultfd_k.h
Auto-merging include/linux/virtio_vsock.h
CONFLICT (content): Merge conflict in include/linux/virtio_vsock.h
Auto-merging include/media/v4l2-ctrls.h
Auto-merging include/net/addrconf.h
Auto-merging include/net/bluetooth/l2cap.h
Auto-merging include/net/cfg80211.h
Auto-merging include/net/inet_frag.h
Auto-merging include/net/ip.h
Auto-merging include/net/netfilter/nf_conntrack_expect.h
CONFLICT (content): Merge conflict in include/net/netfilter/nf_conntrack_expect.h
Auto-merging include/net/netns/can.h
Auto-merging include/sound/core.h
Auto-merging include/sound/hwdep.h
Auto-merging include/sound/pcm.h
Auto-merging include/uapi/linux/bpf.h
CONFLICT (content): Merge conflict in include/uapi/linux/bpf.h
Auto-merging init/Kconfig
Auto-merging init/main.c
Auto-merging io_uring/cancel.c
Auto-merging io_uring/io_uring.c
Auto-merging io_uring/poll.c
Auto-merging kernel/bpf/bpf_iter.c
Auto-merging kernel/bpf/btf.c
Auto-merging kernel/bpf/core.c
Auto-merging kernel/bpf/syscall.c
CONFLICT (content): Merge conflict in kernel/bpf/syscall.c
Auto-merging kernel/bpf/verifier.c
CONFLICT (content): Merge conflict in kernel/bpf/verifier.c
Auto-merging kernel/cgroup/cgroup.c
Auto-merging kernel/cgroup/cpuset.c
Auto-merging kernel/dma/swiotlb.c
Auto-merging kernel/events/core.c
Auto-merging kernel/events/ring_buffer.c
Auto-merging kernel/fork.c
CONFLICT (content): Merge conflict in kernel/fork.c
Auto-merging kernel/futex/core.c
Auto-merging kernel/irq/internals.h
Auto-merging kernel/irq/irqdomain.c
Auto-merging kernel/irq/manage.c
Auto-merging kernel/module/main.c
Auto-merging kernel/profile.c
Auto-merging kernel/rcu/tree.c
Auto-merging kernel/rcu/tree.h
Auto-merging kernel/rcu/tree_exp.h
Auto-merging kernel/reboot.c
Auto-merging kernel/sched/cpufreq_schedutil.c
Auto-merging kernel/sched/fair.c
Auto-merging kernel/seccomp.c
Auto-merging kernel/signal.c
Auto-merging kernel/sys.c
Auto-merging kernel/time/timekeeping.c
Auto-merging kernel/time/timer.c
Auto-merging kernel/trace/bpf_trace.c
Auto-merging kernel/trace/trace.c
Auto-merging kernel/trace/trace_events_hist.c
CONFLICT (content): Merge conflict in kernel/trace/trace_events_hist.c
Auto-merging lib/Makefile
Auto-merging mm/cma.c
Auto-merging mm/damon/core-test.h
Auto-merging mm/damon/core.c
Auto-merging mm/damon/sysfs-schemes.c
Auto-merging mm/damon/sysfs.c
Auto-merging mm/filemap.c
CONFLICT (content): Merge conflict in mm/filemap.c
Auto-merging mm/gup.c
Auto-merging mm/huge_memory.c
CONFLICT (content): Merge conflict in mm/huge_memory.c
Auto-merging mm/hugetlb.c
Auto-merging mm/internal.h
Auto-merging mm/khugepaged.c
Auto-merging mm/ksm.c
CONFLICT (content): Merge conflict in mm/ksm.c
Auto-merging mm/madvise.c
CONFLICT (content): Merge conflict in mm/madvise.c
Auto-merging mm/memcontrol.c
Auto-merging mm/memfd.c
Auto-merging mm/memory.c
CONFLICT (content): Merge conflict in mm/memory.c
Auto-merging mm/mempolicy.c
Auto-merging mm/migrate.c
CONFLICT (content): Merge conflict in mm/migrate.c
Auto-merging mm/mlock.c
Auto-merging mm/mmap.c
Auto-merging mm/mremap.c
Auto-merging mm/nommu.c
Auto-merging mm/page-writeback.c
Auto-merging mm/page_alloc.c
Auto-merging mm/page_isolation.c
Auto-merging mm/page_vma_mapped.c
Auto-merging mm/rmap.c
CONFLICT (content): Merge conflict in mm/rmap.c
Auto-merging mm/shmem.c
Auto-merging mm/slub.c
Auto-merging mm/swapfile.c
Auto-merging mm/truncate.c
Auto-merging mm/util.c
Auto-merging mm/vmscan.c
CONFLICT (content): Merge conflict in mm/vmscan.c
Auto-merging mm/zsmalloc.c
Auto-merging net/bluetooth/hci_core.c
Auto-merging net/bluetooth/hci_debugfs.c
Auto-merging net/bluetooth/hci_event.c
Auto-merging net/bluetooth/hci_sync.c
CONFLICT (content): Merge conflict in net/bluetooth/hci_sync.c
Auto-merging net/bluetooth/l2cap_core.c
Auto-merging net/bluetooth/mgmt.c
Auto-merging net/bluetooth/smp.c
Auto-merging net/bpf/test_run.c
Auto-merging net/bridge/netfilter/ebtables.c
Auto-merging net/can/af_can.c
Auto-merging net/can/proc.c
CONFLICT (content): Merge conflict in net/can/proc.c
Auto-merging net/core/dev.c
CONFLICT (content): Merge conflict in net/core/dev.c
Auto-merging net/core/filter.c
Auto-merging net/core/skbuff.c
Auto-merging net/core/sock.c
Auto-merging net/ipv4/af_inet.c
Auto-merging net/ipv4/inet_connection_sock.c
Auto-merging net/ipv4/inet_fragment.c
Auto-merging net/ipv4/ip_fragment.c
Auto-merging net/ipv4/ip_output.c
Auto-merging net/ipv4/syncookies.c
Auto-merging net/ipv4/sysctl_net_ipv4.c
Auto-merging net/ipv4/tcp.c
Auto-merging net/ipv4/tcp_input.c
Auto-merging net/ipv4/tcp_output.c
Auto-merging net/ipv4/udp.c
Auto-merging net/ipv6/addrconf.c
Auto-merging net/ipv6/netfilter/nf_conntrack_reasm.c
Auto-merging net/ipv6/reassembly.c
Auto-merging net/ipv6/route.c
Auto-merging net/ipv6/udp.c
Auto-merging net/l2tp/l2tp_core.c
CONFLICT (content): Merge conflict in net/l2tp/l2tp_core.c
Auto-merging net/l2tp/l2tp_core.h
CONFLICT (content): Merge conflict in net/l2tp/l2tp_core.h
Auto-merging net/l2tp/l2tp_debugfs.c
Auto-merging net/l2tp/l2tp_netlink.c
CONFLICT (content): Merge conflict in net/l2tp/l2tp_netlink.c
Auto-merging net/l2tp/l2tp_ppp.c
CONFLICT (content): Merge conflict in net/l2tp/l2tp_ppp.c
Auto-merging net/mac80211/ibss.c
Auto-merging net/mac80211/ieee80211_i.h
Auto-merging net/mptcp/pm_netlink.c
Auto-merging net/mptcp/protocol.c
Auto-merging net/mptcp/protocol.h
Auto-merging net/mptcp/subflow.c
Auto-merging net/netfilter/ipvs/ip_vs_sync.c
Auto-merging net/netfilter/nf_conntrack_core.c
Auto-merging net/netfilter/nf_conntrack_expect.c
Auto-merging net/netfilter/nf_conntrack_netlink.c
Auto-merging net/netlink/af_netlink.c
Auto-merging net/packet/af_packet.c
Auto-merging net/sched/act_api.c
Auto-merging net/sched/cls_flower.c
Auto-merging net/sched/sch_generic.c
Auto-merging net/tls/tls_main.c
Auto-merging net/vmw_vsock/virtio_transport.c
Auto-merging net/wireless/nl80211.c
Auto-merging net/wireless/reg.c
Auto-merging net/wireless/sme.c
Auto-merging net/xdp/xsk_buff_pool.c
Auto-merging net/xfrm/xfrm_policy.c
Auto-merging scripts/checkpatch.pl
Auto-merging security/security.c
Auto-merging sound/hda/hdac_device.c
Auto-merging sound/usb/pcm.c
Auto-merging sound/usb/usbaudio.h
Auto-merging tools/include/uapi/linux/bpf.h
CONFLICT (content): Merge conflict in tools/include/uapi/linux/bpf.h
Auto-merging tools/testing/selftests/Makefile
Auto-merging virt/kvm/kvm_main.c
Automatic merge failed; fix conflicts and then commit the result.
merge failed: linux-stable/linux-6.6.y

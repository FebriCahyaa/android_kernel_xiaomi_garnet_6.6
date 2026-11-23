#!/bin/sh
# Garnet Unified Memory Management (UMM) - zram writeback helper.
#
# This script is intentionally NOT run at boot. It validates a backing block
# device before handing it to zram, so a typo can never turn an occupied
# partition into swap. Run it manually from a root shell only.
#
# Usage:
#   garnet_umm_setup.sh enable  /dev/block/by-name/<name> <limit_mb>
#   garnet_umm_setup.sh disable
#   garnet_umm_setup.sh status

set -eu

ZRAM=/sys/block/zram0
BACKING="$ZRAM/backing_dev"
LIMIT="$ZRAM/writeback_limit"
LIMIT_ENABLE="$ZRAM/writeback_limit_enable"

fail() {
    echo "error: $*" >&2
    exit 1
}

require_root() {
    [ "$(id -u)" -eq 0 ] || fail "run as root"
}

require_zram() {
    [ -d "$ZRAM" ] || fail "zram0 is not present"
    [ -e "$BACKING" ] || fail "kernel lacks CONFIG_ZRAM_WRITEBACK"
}

is_mounted() {
    device="$1"
    awk '{print $1}' /proc/mounts | grep -Fqx "$device"
}

case "${1:-status}" in
    status)
        require_zram
        echo "backing_dev=$(cat "$BACKING" 2>/dev/null || echo none)"
        echo "writeback_limit_enable=$(cat "$LIMIT_ENABLE" 2>/dev/null || echo 0)"
        echo "writeback_limit=$(cat "$LIMIT" 2>/dev/null || echo 0)"
        echo "comp_algorithm=$(cat "$ZRAM/comp_algorithm" 2>/dev/null || echo unknown)"
        echo "orig_data_size=$(cat "$ZRAM/orig_data_size" 2>/dev/null || echo 0)"
        echo "compr_data_size=$(cat "$ZRAM/compr_data_size" 2>/dev/null || echo 0)"
        ;;
    enable)
        require_root
        require_zram
        [ "$#" -eq 3 ] || fail "usage: $0 enable <block_device> <limit_mb>"
        dev="$2"
        limit_mb="$3"
        [ -b "$dev" ] || fail "$dev is not a block device"
        is_mounted "$dev" && fail "$dev is mounted; refusing to use it for swap"
        case "$limit_mb" in
            ''|*[!0-9]*) fail "limit_mb must be an integer" ;;
        esac
        [ "$limit_mb" -gt 0 ] || fail "limit_mb must be positive"

        # Pages per MB for the 4K pages used by arm64.
        pages=$((limit_mb * 256))
        echo 0 > "$LIMIT_ENABLE"
        echo "$dev" > "$BACKING"
        echo "$pages" > "$LIMIT"
        echo 1 > "$LIMIT_ENABLE"
        echo "UMM writeback enabled: $dev, limit ${limit_mb}MB"
        ;;
    disable)
        require_root
        require_zram
        echo 0 > "$LIMIT_ENABLE"
        printf '\n' > "$BACKING"
        echo "UMM writeback disabled"
        ;;
    *)
        fail "unknown command: $1"
        ;;
esac

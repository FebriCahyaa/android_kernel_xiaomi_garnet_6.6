#!/usr/bin/env bash
set -euo pipefail
# ZairenOX helper: integrate FinaSU built-in driver.
# Usage: scripts/root/setup-finasu.sh /path/to/FinaSU

FINASU_DIR="${1:-}"
if [ -z "$FINASU_DIR" ]; then
  echo "Usage: $0 /path/to/FinaSU" >&2
  exit 2
fi
if [ ! -f Makefile ]; then
  echo "Run from kernel source root" >&2
  exit 1
fi

"$FINASU_DIR/kernel/setup.sh" --dir "$FINASU_DIR"
echo "Enable CONFIG_KSU=y, CONFIG_KPROBES=y, CONFIG_KALLSYMS_ALL=y, CONFIG_EXT4_FS=y, CONFIG_HEADERS_INSTALL=y as needed."
echo "Build with KSU_REQUIRE_PREINIT=1 and matching manager cert args if required."

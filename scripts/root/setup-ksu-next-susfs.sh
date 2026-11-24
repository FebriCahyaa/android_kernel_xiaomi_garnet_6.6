#!/usr/bin/env bash
set -euo pipefail
# ZairenOX helper: integrate KernelSU-Next + SUSFS on a 6.6 kernel tree.
# Run from kernel source root. Review upstream scripts before use.

KSUN_BRANCH="${KSUN_BRANCH:-next-susfs-dev}"
SUSFS_BRANCH="${SUSFS_BRANCH:-gki-android15-6.6}"

if [ ! -f Makefile ]; then
  echo "Run from kernel source root" >&2
  exit 1
fi

curl -LSs "https://raw.githubusercontent.com/rifsxd/KernelSU-Next/${KSUN_BRANCH%%-*}/kernel/setup.sh" | bash -s "$KSUN_BRANCH"

echo "KernelSU-Next setup invoked for $KSUN_BRANCH"
echo "Fetch SUSFS from https://gitlab.com/simonpunk/susfs4ksu.git branch $SUSFS_BRANCH and apply matching kernel/KSU patches manually."

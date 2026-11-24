# merge/upstream automation

This branch is the only branch with upstream-merge automation enabled.

- `upstream-merge-check.yml`: scheduled/manual merge check against AOSP/linux-stable and optional CLO/Qualcomm refs, applies `.github/patches/*.patch`, opens/updates PR to `merge/upstream`.
- `dependabot.yml`: GitHub Actions dependency updates targeting `merge/upstream` only.

Other branches are intentionally left without these bot workflows.

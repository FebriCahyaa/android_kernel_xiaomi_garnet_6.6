# Merge fix patches

Place `.patch` files here for `merge/upstream` automation.
The `upstream-merge-check` workflow applies them with `git apply --3way`
after merge attempts. Keep patches small, upstream-relevant, and documented.

Suggested naming:
- `0001-fix-<topic>.patch`
- include source URL/commit in patch description.

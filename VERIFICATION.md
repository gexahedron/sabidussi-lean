# Verification record

Date: 2026-07-14

Toolchain:

- Lean `v4.31.0`
- Mathlib `9a9483a92959bc92bd6a60176dd1fe597298c1f8`

Run from the repository root:

```bash
lake build
lake env lean Sabidussi/Audit.lean
rg -n '\b(sorry|admit|native_decide)\b|^\s*(axiom|opaque|unsafe)\b' \
  --glob '*.lean' Sabidussi.lean Sabidussi Solution.lean
```

The production-source scan must be empty. `Challenge.lean` is deliberately outside this scan: it
contains the single statement placeholder required by Comparator and is not imported by the
production library. The audit uses `#guard_msgs` and fails unless every checked theorem reports
exactly propositional extensionality, quotient soundness, and classical choice, with no
project-specific axiom.

Results on the date above:

- `lake build` succeeded (`8586` Lake jobs).
- The source scan returned no matches.
- Every audited theorem, including the public endpoint, reported exactly `propext`,
  `Classical.choice`, and `Quot.sound`.

Public theorem:

```lean
Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary
```

Its conclusion is a compatible partition of the edge set into ordinary connected 2-regular
circuits for any finite endpoint multigraph with an Euler tour and minimum degree at least four.

## Automated verification

- `.github/workflows/lean.yml` runs the production-source scan, builds the default `Sabidussi`
  target, and enforces the exact axiom audit on Ubuntu.
- `.github/workflows/comparator.yml` is a separate clean Ubuntu job. It installs pinned Comparator,
  lean4export, and Landrun revisions; probes that Landrun actually denies out-of-policy writes;
  and runs Comparator as an unprivileged user inside the required systemd address-family guard.
- `comparator/sabidussi_compatibility.json` checks that the solution wrapper proves the reviewed
  statement in `Challenge.lean`, uses only `propext`, `Classical.choice`, and `Quot.sound`, and is
  accepted by Lean's kernel.

On 2026-07-14, the same configuration also passed locally on macOS with Comparator's explicitly
unsandboxed development shim, reporting `Lean default kernel accepts the solution` and
`Your solution is okay!`. The Linux workflow is the sandboxed verification gate.

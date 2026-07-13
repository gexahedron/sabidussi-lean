# Verification record

Date: 2026-07-13

Toolchain:

- Lean `v4.31.0`
- Mathlib `9a9483a92959bc92bd6a60176dd1fe597298c1f8`

Run from the repository root:

```bash
lake build
lake env lean Sabidussi/Audit.lean
rg -n '\b(sorry|admit|native_decide)\b|^\s*(axiom|opaque|unsafe)\b' --glob '*.lean' .
```

The source scan must be empty.  The audit is expected to report only standard
Lean/Mathlib principles such as propositional extensionality, quotient soundness, and classical
choice, with no project-specific axiom.

Results on the date above:

- `lake build` succeeded (`2978` Lake jobs).
- The source scan returned no matches.
- Every audited theorem, including the public endpoint, reported exactly `propext`,
  `Classical.choice`, and `Quot.sound`.

Public theorem:

```lean
Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary
```

Its conclusion is a compatible partition of the edge set into ordinary connected 2-regular
circuits for any finite endpoint multigraph with an Euler tour and minimum degree at least four.

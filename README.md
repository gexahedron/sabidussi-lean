# Sabidussi compatibility in Lean

This project formalizes the Sabidussi compatibility conjecture for finite labelled endpoint
multigraphs.  Loops and parallel edges are allowed, and a loop contributes two half-edge
incidences to the degree of its vertex.

The public endpoint is
`Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary`.  Given an Euler tour and the
hypothesis that every vertex has degree at least four, the theorem constructs a partition of all
edges into ordinary circuits.  Each circuit is explicitly nonempty, edge-connected, and
2-regular on its support, and consecutive edges of the Euler tour never lie in the same circuit.

## Build and verify

Lean is pinned to `v4.31.0` and Mathlib to commit
`9a9483a92959bc92bd6a60176dd1fe597298c1f8`.

```bash
lake update
lake exe cache get
lake build
lake env lean Sabidussi/Audit.lean
```

If no precompiled cache is available for the pinned Mathlib revision, omit `lake exe cache get`;
Lake will build the required dependencies locally.

The following source checks should produce no output:

```bash
rg -n '\b(sorry|admit|native_decide)\b|^\s*(axiom|opaque|unsafe)\b' \
  --glob '*.lean' Sabidussi.lean Sabidussi Solution.lean
```

## Source layout

- `Color`, `LocalPattern`, and `Parity` contain the four-colour algebra and local frames.
- `OddBalance` proves the parity lemma that supplies a globally balanced choice.
- `CyclicWord` constructs a compatible colouring of the cyclic transition word.
- `LoopMultigraph` defines the endpoint-multigraph, Euler-tour, and circuit certificates.
- `LoopGraphBridge` transports the cyclic-word colouring back to graph edges.
- `OrdinaryCircuit` proves that the resulting pieces are ordinary connected 2-regular circuits.
- `Audit` reports the axiom dependencies of the critical intermediate and final theorems.

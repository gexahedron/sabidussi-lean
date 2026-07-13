import Sabidussi.OrdinaryCircuit

/-!
# Sabidussi compatibility conjecture

This is the public entry point for the formalization.  The main theorem is
`Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary`.
Its declaration lives in `Sabidussi/OrdinaryCircuit.lean`; this umbrella module imports that
module so downstream users can obtain the endpoint by importing `Sabidussi`.

It applies to finite labelled endpoint multigraphs, including loops and parallel edges.  Given
an Euler tour and minimum degree at least four, it constructs a partition of all edges into
connected, 2-regular ordinary circuits such that consecutive edges of the tour never belong to
the same circuit.
-/

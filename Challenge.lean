import Sabidussi.Statement

/-!
# Trusted Comparator challenge for Sabidussi compatibility

The imported statement layer contains only the public data and predicates occurring below. The
proof placeholder is intentional: Comparator compares this reviewed statement to `Solution` and
checks only the latter's proof axioms.
-/

/-- Trusted statement of the headline Sabidussi compatibility theorem. -/
theorem sabidussi_compatibility_ordinary
    {V E : Type*} [Fintype V] [Fintype E] [DecidableEq V] [DecidableEq E]
    {G : Sabidussi.LoopMultigraph V E} (T : G.EulerTour)
    (hmin : ∀ v : V, 4 ≤ G.degree v) :
    ∃ S : G.OrdinaryCircuitDecomposition, S.Compatible T := by
  sorry

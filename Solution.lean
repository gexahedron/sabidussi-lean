import Sabidussi

/-!
# Comparator solution wrapper for Sabidussi compatibility

This repeats the trusted challenge statement and delegates its proof to the formalization's public
endpoint.
-/

theorem sabidussi_compatibility_ordinary
    {V E : Type*} [Fintype V] [Fintype E] [DecidableEq V] [DecidableEq E]
    {G : Sabidussi.LoopMultigraph V E} (T : G.EulerTour)
    (hmin : ∀ v : V, 4 ≤ G.degree v) :
    ∃ S : G.OrdinaryCircuitDecomposition, S.Compatible T := by
  exact Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary T hmin

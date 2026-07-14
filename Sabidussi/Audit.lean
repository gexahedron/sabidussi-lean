import Sabidussi

/-!
# Axiom audit

Run this module directly to verify the axiom dependencies of the critical construction and its
public endpoint.
-/

/--
info: 'Sabidussi.OddBalance.cast_solutions_card_eq_one' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.OddBalance.cast_solutions_card_eq_one

/--
info: 'Sabidussi.OddBalance.solutions_card_odd' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.OddBalance.solutions_card_odd

/--
info: 'Sabidussi.OddBalance.exists_balanced' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.OddBalance.exists_balanced

/--
info: 'Sabidussi.CyclicWord.Word.exists_coloring' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.CyclicWord.Word.exists_coloring

/--
info: 'Sabidussi.LoopMultigraph.loop_sabidussi_compatibility' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.LoopMultigraph.loop_sabidussi_compatibility

/--
info: 'Sabidussi.LoopMultigraph.Cycle.toOrdinaryCircuit' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.LoopMultigraph.Cycle.toOrdinaryCircuit

/--
info: 'Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in
#print axioms Sabidussi.LoopMultigraph.loop_sabidussi_compatibility_ordinary

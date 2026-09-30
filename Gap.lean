import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-
Ground is the large negative background.
The atom ("odd duck") is the small positive that sticks out.
After you subtract the ground, only that positive remainder is left,
and its energy cost is always > 0.
-/

def V (Phi v : ℝ) : ℝ := (Phi ^ 2 - v ^ 2) ^ 2

theorem V_min_at_ground (v : ℝ) : V v v = 0 := by
  unfold V
  ring

theorem V_min_at_minus_ground (v : ℝ) : V (-v) v = 0 := by
  unfold V
  ring

theorem V_pos_of_odd_duck (v δ : ℝ) (_hv : 0 < v) (hδ : 0 < δ) (hsmall : δ < 2 * v) :
    0 < V (-v + δ) v := by
  unfold V
  have hdiff : (-v + δ) ^ 2 - v ^ 2 = δ * (δ - 2 * v) := by ring
  rw [hdiff]
  have hne : δ * (δ - 2 * v) ≠ 0 := by
    apply mul_ne_zero
    · exact ne_of_gt hδ
    · exact ne_of_lt (sub_neg.mpr hsmall)
  exact sq_pos_of_ne_zero hne

def excitationCost (v δ : ℝ) : ℝ := (v + δ) ^ 2 - v ^ 2

theorem excitationCost_eq (v δ : ℝ) : excitationCost v δ = 2 * v * δ + δ ^ 2 := by
  unfold excitationCost
  ring

theorem cost_pos (v δ : ℝ) (hv : 0 < v) (hδ : 0 < δ) : 0 < excitationCost v δ := by
  rw [excitationCost_eq]
  have h1 : 0 < 2 * v * δ := by positivity
  have h2 : 0 ≤ δ ^ 2 := by positivity
  linarith

def lead : ℝ := 0.0472

example : 0 < V (-100 + lead) 100 := by
  unfold V
  unfold lead
  norm_num

example : 0 < excitationCost 100 lead := by
  unfold excitationCost
  unfold lead
  norm_num

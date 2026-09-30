# Ground / Odd Duck Gap

**Ground is the large negative background. The atom (odd duck) is the small positive that sticks out. After you subtract the ground, only that positive remainder is left, and its energy cost is always > 0.**

This Lean4 file formalizes the spherical model from the image:

- Core: `1+1>2` reaction, mixed `++ + / ++ - / - ++ -`
- Shell 1 (Molecular) + Shell 2 (Crystal Lattice): like-kind grouping → coherent spherical lattice. Most mass is ground → minus.
- Friction Between Likes → Ionic Odd Ducks: one odd duck per reaction is enough to get out of place.
- Highest Point = Charge Dissipates to Ground: far-reaching field, local reaction.
- Smooth Field = Energy Stored in Lattice: undisturbed mass holds energy but doesn't change interaction.

## Two cost functions, one job

### 1. `V` — packing well
```
V(Φ,v) = (Φ² - v²)²
```
Zero only on the ground: `Φ = v` and `Φ = -v`. Ground is minus (`Φ₀ = -v`).

Odd duck: `Φ = -v + δ`

```
V(-v+δ, v) = (δ(δ-2v))² > 0  when 0 < δ < 2v
```

Vanishes only at `δ = 0` (perfect lock) and `δ = 2v` (flip to other ground). For `v ~ 100`, `δ = 0.0472`, it's small but > 0.

### 2. `excitationCost` — leftover after grounding
```
(v+δ)² - v² = 2vδ + δ² > 0
```
What you see after you subtract ⟨0|Q|0⟩. Linear term `2vδ` dominates because `v ≫ δ`. One is enough.

They are not the same number, but vanish at the same points. Both say: `0.0472` neck costs energy, so lattice cannot lock.

## Elbow room

`δ = 0` → perfect pack → lock → no contraction/expansion → has to fight all the way to ignition.

`δ = 0.0472 = π/3 - 1` → `V>0`, `cost>0` → pack has wiggle → contraction and expansion have somewhere to go without heat.

First leg of first container, three legs close the triangle, residual keeps next layer from fighting the pack with heat.

## Lean web

Tested on https://live.lean-lang.org/ with Mathlib.

```bash
lake build
```

File: `Gap.lean` — clean, no linter warnings.
Lead positive: `def lead : ℝ := 0.0472`

Theorems:
- `V_min_at_ground`, `V_min_at_minus_ground`
- `V_pos_of_odd_duck`
- `excitationCost_eq`, `cost_pos`


{-
    Examples/test programs for the dynamic semantics.
 -}
module HLL.Examples.DynamicSemantics where

open import Agda.Builtin.Nat renaming (Nat to ℕ)

open import Data.Nat.Properties using (_≤?_)
open import Relation.Nullary.Decidable using (True; toWitness)

open import HLL.HLL
open import HLL.Types
open import HLL.Context
open import HLL.DynamicSemantics

-- See: https://plfa.github.io/DeBruijn/#abbreviating-de-bruijn-indices
#_ : {Γ : Ctx} → (n : ℕ) → {n∈Γ : True (suc n ≤? length Γ)} → Γ ⊢ lookup (toWitness n∈Γ)
#_ n {n∈Γ} = var (count (toWitness n∈Γ))

-- Examples
ex1 : ‵[] ⊢ num 42 ↓ num 42
ex1 = ↓num

ex2 : ‵[] ⊢ (fun (# 0)) ∙ (num 42) ↓ num 42
ex2 = ↓app ↓fun (↓var here) ↓num
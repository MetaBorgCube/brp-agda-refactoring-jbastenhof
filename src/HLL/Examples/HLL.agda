{- Examples/test programs for the HLL. -}
module HLL.Examples.HLL where

open import Agda.Builtin.List

open import HLL.HLL
open import HLL.Types
open import HLL.Context
open import HLL.DataContext

open import Utils.Element

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Examples
ex1 : [] , [] ⊢ tupleT (numT ∷ numT ∷ [])
ex1 = tuple (num 42 ∷ num 1337 ∷ []ᵀ)

ex2 : [] , [] ⊢ tupleT ((tupleT (numT ∷ numT ∷ [])) ∷ numT ∷ [])
ex2 = tuple (tuple (num 42 ∷ num 1337 ∷ []ᵀ) ∷ num 7 ∷ []ᵀ)

ex3 : [] , [] ⊢ tupleT (numT ∷ (tupleT (numT ∷ numT ∷ [])) ∷ [])
ex3 = tuple (num 7 ∷ (tuple (num 42 ∷ num 1337 ∷ []ᵀ)) ∷ []ᵀ)

ex4 : [] , [] ⊢ tupleT (numT ∷ charT ∷ numT ∷ [])
ex4 = tuple (num 42 ∷ char 'A' ∷ num 1337 ∷ []ᵀ)

ex5 : [] , [] ⊢ numT
ex5 = fun (var here) ∙ num 42

ex6 : [] , recDecl (numT ∷ charT ∷ charT ∷ []) ∷ [] ⊢ recT (numT ∷ charT ∷ charT ∷ [])
ex6 = recInst here (num 42 ∷ char 'A' ∷ char 'B' ∷ []ᵀ)

ex7 : [] , [] ⊢ numT
ex7 = tLookup (tuple (char 'A' ∷ num 42 ∷ []ᵀ)) (there here)

ex8 : [] , recDecl (numT ∷ charT ∷ charT ∷ []) ∷ [] ⊢ numT
ex8 = rLookup (recInst here (num 42 ∷ char 'A' ∷ char 'B' ∷ []ᵀ)) here

-----------------------------------------------------------------------------------------------------------------------------------------------------

{-
    Object context in which the types for data declarations are stored.
    Makes use of De Bruijn indices and discards the name.
 -}
module HLL.DataContext where

open import Agda.Builtin.List

open import HLL.Types

private
    variable
        A : Set
        as : List A
        a a₁ a₂ : A

DataCtx : Set
DataCtx = List (List Type)
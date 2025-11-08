module 2025-11-02 where

open import Prelude
open import 2025-10-26

module _ {ℓ} (real-axioms : RealAxioms ℓ) where
  open RealAxioms real-axioms

  archimedean-naturals : ∀ x y → 0′ < x → Σ n ∈ ℕ⁺ ∧ y < n ∙1ℕ⁺ ∙ x
  archimedean-naturals x y gz = {!   !}

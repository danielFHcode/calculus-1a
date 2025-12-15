{-# OPTIONS --prop #-}

{-
  
  This is a set of syntax definitions that allow
  you to write proofs in the style of Lior Kamma

-}

open Agda.Primitive

data Forall {ℓ₁ ℓ₂} (A : Set ℓ₁) (P : A → Prop ℓ₂) : Prop (ℓ₁ ⊔ ℓ₂) where
    let′ : (∀ x → P x) → Forall A P


infixr 1 forall-syntax
forall-syntax = Forall
syntax forall-syntax A (λ x → P) = for any x ∈ A , P
infixr 1 forall-syntax-he
forall-syntax-he = Forall
syntax forall-syntax-he A (λ x → P) = לכל x ∈ A , P

infixr 0 let-syntax
let-syntax : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} {P : A → Prop ℓ₂} → (∀ x → P x) → Forall A P
let-syntax = let′
syntax let-syntax {A = A} (λ x → prf) = suppose x ∈ A , prf

infixr 0 let-syntax-he
let-syntax-he : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} {P : A → Prop ℓ₂} → (∀ x → P x)  → Forall A P
let-syntax-he = let′
syntax let-syntax-he {A = A} (λ x → prf) = תהי x ∈ A , prf

data Exists {ℓ₁ ℓ₂} (A : Set ℓ₁) (P : A → Prop ℓ₂) : Prop (ℓ₁ ⊔ ℓ₂) where
    look-at : ∀ x → P x → Exists A P

infixr 1 exists-syntax
exists-syntax = Exists
syntax exists-syntax A (λ x → P) = there exists a x ∈ A such that P
infixr 1 exists-syntax-he
exists-syntax-he = Exists
syntax exists-syntax-he A (λ x → P) = קיים x ∈ A כך ש- P

infixr 0 look-at-syntax
look-at-syntax : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} {P : A → Prop ℓ₂} → ∀ x → P x → Exists A P
look-at-syntax = look-at
syntax look-at-syntax x prf = look at x , prf

infixr 0 look-at-syntax-he
look-at-syntax-he : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} {P : A → Prop ℓ₂} → ∀ x → P x → Exists A P
look-at-syntax-he = look-at
syntax look-at-syntax-he x prf = נסתכל על x , prf

data Implies {ℓ₁ ℓ₂} (P : Prop ℓ₁) (Q : Prop ℓ₂) : Prop (ℓ₁ ⊔ ℓ₂) where
    assume : (P → Q) → Implies P Q

infixr 1 implies-syntax
implies-syntax = Implies
syntax implies-syntax P Q = if P then Q
infixr 1 implies-syntax-he
implies-syntax-he = Implies
syntax implies-syntax-he P Q = אם P אז Q

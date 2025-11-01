module Prelude where

open import Agda.Primitive public

infix 3 _＝_
data _＝_ {ℓ} {A : Set ℓ} : A → A → Set ℓ where
  reflexivity : ∀ x → x ＝ x

data ⊥ : Set where

infix 2 ¬_
¬_ : ∀ {ℓ} → Set ℓ → Set ℓ
¬ A = A → ⊥

infixl 0 =transitivity
=transitivity : ∀ {ℓ} {A : Set ℓ} {x y z : A} → x ＝ y → y ＝ z → x ＝ z
=transitivity (reflexivity x) (reflexivity x) = reflexivity x
syntax =transitivity x y = x ⟫ y

congruence : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} {B : Set ℓ₂} (f : A → B) {x y} → x ＝ y → f x ＝ f y
congruence f (reflexivity x) = reflexivity (f x)

substitute : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} (P : A → Set ℓ₂) {x y} → x ＝ y → P x → P y
substitute _ (reflexivity x) px = px

symmetry : ∀ {ℓ} {A : Set ℓ} {x y : A} → x ＝ y → y ＝ x
symmetry (reflexivity x) = reflexivity x

swap : ∀ {ℓ₁ ℓ₂ ℓ₃} {A : Set ℓ₁} {B : Set ℓ₂} {C : Set ℓ₃} → (A → B → C) → B → A → C
swap f y x = f x y
syntax swap f y = f ＿ y

infixl 0 _|>_
_|>_ : ∀ {ℓ₁ ℓ₂} {A : Set ℓ₁} {P : A → Set ℓ₂} x → (∀ x′ → P x′) → P x
x |> f = f x

infixl 0 the
the : ∀ {ℓ} (A : Set ℓ) → A → A
the _ x = x
syntax the A x = x ∶ A

record Subset {ℓ′} (A : Set ℓ′) ℓ : Set (ℓ′ ⊔ lsuc ℓ) where
  constructor subset
  infix 3 _∋_
  field _∋_ : A → Set ℓ
open Subset public
syntax subset {A = A} (λ x → ϕ) = [ x ∈ A ∣ ϕ ]

infix 3 _⊆_
_⊆_ : ∀ {ℓ′ ℓ} {A : Set ℓ′} → Subset A ℓ → Subset A ℓ → Set (ℓ′ ⊔ ℓ)
A ⊆ B = ∀ {x} → A ∋ x → B ∋ x

record Lift {ℓ′} ℓ (A : Set ℓ′) : Set (ℓ′ ⊔ ℓ) where
  constructor lift
  field lower : A

infixr 2 Σ
infixr 0 _,_
record Σ {ℓ₁ ℓ₂} (A : Set ℓ₁) (P : A → Set ℓ₂) : Set (ℓ₁ ⊔ ℓ₂) where
  constructor _,_
  field first : A
        second : P first
open Σ public
syntax Σ A (λ x → B) = Σ x ∈ A ∧ B

infixr 2 _∧_
_∧_ : ∀ {ℓ₁ ℓ₂} → Set ℓ₁ → Set ℓ₂ → Set (ℓ₁ ⊔ ℓ₂)
A ∧ B = Σ _ ∈ A ∧ B

infixr 2 ∃!
∃! : ∀ {ℓ₁ ℓ₂} (A : Set ℓ₁) → (A → Set ℓ₂) → Set (ℓ₁ ⊔ ℓ₂)
∃! A P = Σ x ∈ A ∧ (P x ∧ ∀ {y} → P y → x ＝ y)
syntax ∃! A (λ x → B) = ∃! x ∈ A ∧ B

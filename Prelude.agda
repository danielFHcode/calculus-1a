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

infixr 4 _::_
data [_] {ℓ} (A : Set ℓ) : Set ℓ where
  [] : [ A ]
  _::_ : A → [ A ] → [ A ]

module Auto where
  -- WORK IN PROGRESS --

  -- this is fairly disconnected from the rest of the prelude
  -- because  it  heavily utilizes the Agda.Builtin module which
  -- is why it's in it's own module.

  open import Agda.Builtin.Reflection renaming (bindTC to _>>=_)
  open import Agda.Builtin.String
  open import Agda.Builtin.Unit
  open import Agda.Builtin.Nat
  open import Agda.Builtin.List
  open import Agda.Builtin.Bool

  newMeta : Term → TC Term
  newMeta t = checkType unknown t
  
  _++_ : ∀ {ℓ} {A : Set ℓ} → List A → List A → List A
  [] ++ ys = ys
  (x ∷ xs) ++ ys = x ∷ (xs ++ ys)

  applyTC : Term → List (Arg Term) → Term → TC ⊤
  applyTC f as hole =
      newMeta unknown >>= λ where
        (meta m args) → do
            tt ← unify f (meta m args)
            tt ← unify hole (meta m (args ++ as))
            returnTC tt
        t → do t′ ← quoteTC t
               typeError (strErr "hello: " ∷ termErr t′ ∷ []) -- unreachable

  record Rule : Set where
    constructor rule
    field implementation : Term
          premises : [ ArgInfo ]
  getPremises : Term → [ ArgInfo ]
  getPremises (pi (arg info _) (abs _ t)) = info :: getPremises t
  getPremises _ = []
  newRuleTC : Term → TC Rule
  newRuleTC f = do
      t ← inferType f
      tNorm ← normalise t
      returnTC (rule f (getPremises tNorm))
  macro newRule : Term → Term → TC ⊤
        newRule t hole = do
            r ← newRuleTC t
            rt ← quoteTC r
            unify hole rt

  autoTC : [ Rule ] → Nat → Term → TC ⊤
  autoTC _ zero hole = do
    target ← inferType hole
    tt ← typeError {A = ⊤} (strErr "could not solve for " ∷ termErr target ∷ [])
    returnTC tt
  autoTC [] _ hole = autoTC [] zero hole
  autoTC (rule f infos :: rules) (suc n) hole =
    catchTC
    (noConstraints do
      args ← createArgs infos
      tt ← applyTC f args hole
      tt ← solve args
      returnTC tt)
    (autoTC rules (suc n) hole)
    where createArgs : [ ArgInfo ] → TC (List (Arg Term))
          createArgs [] = returnTC []
          createArgs (info :: infos) = do
              hole ← newMeta unknown
              args ← createArgs infos
              returnTC (arg info hole ∷ args)
          solve : List (Arg Term) → TC ⊤
          solve [] = returnTC tt
          solve (arg (arg-info visible _) hole ∷ args) = do
              tt ← autoTC (rule f infos :: rules) n hole
              solve args
          solve (_ ∷ args) = solve args
  macro auto : [ Rule ] → Nat → Term → TC ⊤
        auto = autoTC
open Auto using (Rule; newRule; auto; autoTC) public
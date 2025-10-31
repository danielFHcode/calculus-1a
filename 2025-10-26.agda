module 2025-10-26 where

open Agda.Primitive

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
open Subset
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
open Σ
syntax Σ A (λ x → B) = Σ x ∈ A ∧ B

infixr 2 _∧_
_∧_ : ∀ {ℓ₁ ℓ₂} → Set ℓ₁ → Set ℓ₂ → Set (ℓ₁ ⊔ ℓ₂)
A ∧ B = Σ _ ∈ A ∧ B

infixr 2 ∃!
∃! : ∀ {ℓ₁ ℓ₂} (A : Set ℓ₁) → (A → Set ℓ₂) → Set (ℓ₁ ⊔ ℓ₂)
∃! A P = Σ x ∈ A ∧ (P x ∧ ∀ {y} → P y → x ＝ y)
syntax ∃! A (λ x → B) = ∃! x ∈ A ∧ B

record RealAxioms ℓ : Set (lsuc ℓ) where
  infixl 4 _+_
  infixl 5 _∙_
  infix 6 -_
  field ℝ : Set ℓ
        _+_ : ℝ → ℝ → ℝ
        _∙_ : ℝ → ℝ → ℝ
        +commutativity : ∀ x y → x + y ＝ y + x
        +associativity : ∀ x y z → (x + y) + z ＝ x + (y + z)
        0′ : ℝ
        +neutral : ∀ x → x + 0′ ＝ x
        -_ : ℝ → ℝ
        +inverse : ∀ x → x + - x ＝ 0′
  proposition-2-2 : ∀ {x y z} → x + y ＝ z + y → x ＝ z
  proposition-2-2 {x} {y} {z} ⋆ =
         ⋆ ∶ x + y ＝ z + y
      |> congruence (_+ - y)
        ∶ (x + y) + - y ＝ (z + y) + - y
      |> =transitivity (symmetry (+associativity x y (- y)))
      |> =transitivity ＿ (+associativity z y (- y))
        ∶ x + (y + - y) ＝ z + (y + - y)
      |> =transitivity (symmetry (congruence (x +_) (+inverse y)))
      |> =transitivity ＿ (congruence (z +_) (+inverse y))
        ∶ x + 0′ ＝ z + 0′
      |> =transitivity (symmetry (+neutral x))
      |> =transitivity ＿ (+neutral z)
        ∶ x ＝ z
  conclusion-2-3 : ∀ {x y} → x + y ＝ 0′ → y ＝ - x
  conclusion-2-3 {x} {y} ⋆ =
      +commutativity y x
        ∶ y + x ＝ x + y
      ⟫ ⋆
        ∶ y + x ＝ 0′
      ⟫ symmetry (+inverse x)
        ∶ y + x ＝ x + - x
      ⟫ +commutativity x (- x)
        ∶ y + x ＝ - x + x
      |> proposition-2-2
        ∶ y ＝ - x
  infix 6 _⁻¹⟨_⟩
  field ∙commutativity : ∀ x y → x ∙ y ＝ y ∙ x
        ∙associativity : ∀ x y z → (x ∙ y) ∙ z ＝ x ∙ (y ∙ z)
        1′ : ℝ
        different-naturals : ¬ 0′ ＝ 1′
        ∙neutral : ∀ x → x ∙ 1′ ＝ x
        _⁻¹⟨_⟩ : ∀ x → ¬ x ＝ 0′ → ℝ
        ∙inverse : ∀ x (nz : ¬ x ＝ 0′) → x ∙ x ⁻¹⟨ nz ⟩ ＝ 1′
        distributivity : ∀ x y z → x ∙ (y + z) ＝ x ∙ y + x ∙ z
  proposition-2-6 : ∀ {x y z} → ¬ y ＝ 0′ → x ∙ y ＝ z ∙ y → x ＝ z
  proposition-2-6 {x} {y} {z} ynz ⋆ =
        ⋆ ∶ x ∙ y ＝ z ∙ y
      |> congruence (_∙ y ⁻¹⟨ ynz ⟩)
        ∶ x ∙ y ∙ y ⁻¹⟨ ynz ⟩ ＝ z ∙ y ∙ y ⁻¹⟨ ynz ⟩
      |> =transitivity (symmetry (∙associativity x y (y ⁻¹⟨ ynz ⟩)))
      |> =transitivity ＿ (∙associativity z y (y ⁻¹⟨ ynz ⟩))
        ∶ x ∙ (y ∙ y ⁻¹⟨ ynz ⟩) ＝ z ∙ (y ∙ y ⁻¹⟨ ynz ⟩)
      |> =transitivity (symmetry (congruence (x ∙_) (∙inverse y ynz)))
      |> =transitivity ＿ (congruence (z ∙_) (∙inverse y ynz))
        ∶ x ∙ 1′ ＝ z ∙ 1′
      |> =transitivity (symmetry (∙neutral x))
      |> =transitivity ＿ (∙neutral z)
        ∶ x ＝ z
  conclusion-2-7 : ∀ {x y} (nz : ¬ x ＝ 0′) → x ∙ y ＝ 1′ → y ＝ x ⁻¹⟨ nz ⟩
  conclusion-2-7 {x} {y} nz ⋆ =
    ∙commutativity y x
      ∶ y ∙ x ＝ x ∙ y
    ⟫ ⋆
      ∶ y ∙ x ＝ 1′
    ⟫ symmetry (∙inverse x nz)
      ∶ y ∙ x ＝ x ∙ x ⁻¹⟨ nz ⟩
    ⟫ ∙commutativity x (x ⁻¹⟨ nz ⟩)
      ∶ y ∙ x ＝ x ⁻¹⟨ nz ⟩ ∙ x
    |> proposition-2-6 nz
      ∶ y ＝ x ⁻¹⟨ nz ⟩
  proposition-2-9 : ∀ x → x ∙ 0′ ＝ 0′
  proposition-2-9 x =
    +neutral 0′
      ∶ 0′ + 0′ ＝ 0′
    |> congruence (x ∙_)
      ∶ x ∙ (0′ + 0′) ＝ x ∙ 0′
    ⟫ symmetry (+neutral (x ∙ 0′))
      ∶ x ∙ (0′ + 0′) ＝ x ∙ 0′ + 0′
    ⟫ +commutativity (x ∙ 0′) 0′
      ∶ x ∙ (0′ + 0′) ＝ 0′ + x ∙ 0′
    |> =transitivity (symmetry (distributivity x 0′ 0′))
      ∶ x ∙ 0′ + x ∙ 0′ ＝ 0′ + x ∙ 0′
    |> proposition-2-2
      ∶ x ∙ 0′ ＝ 0′
  proposition-2-10 : ∀ x → - 1′ ∙ x ＝ - x
  proposition-2-10 = {!   !}  
  infix 3 _<_
  field _<_ : ℝ → ℝ → Set ℓ
        antisymmetry : ∀ {x y} → x < y → ¬ y < x
        transitivity : ∀ {x y z} → x < y → y < z → x < z
        <linearity : ∀ {x y} → ¬ x < y → ¬ x ＝ y → y < x
        =linearity : ∀ {x y} → ¬ x < y → ¬ y < x → x ＝ y
        +order : ∀ {x y} z → x < y → x + z < y + z
        ∙order : ∀ {x y} z → 0′ < z → x < y → x ∙ z < y ∙ z
  proposition-3-1 : ∀ {x y} → x < y → - y < - x
  proposition-3-1 = {!   !}
  infixl 4 _-_
  _-_ : ℝ → ℝ → ℝ
  x - y = x + - y
  infixl 5 _/_⟨_⟩
  _/_⟨_⟩ : ℝ → ∀ x → ¬ x ＝ 0′ → ℝ
  x / y ⟨ nz ⟩ = x ∙ y ⁻¹⟨ nz ⟩
  _≤_ : ℝ → ℝ → Set ℓ
  x ≤ y = ¬ y < x
  IsUpperBound : Subset ℝ ℓ → ℝ → Set (ℓ ⊔ ℓ)
  IsUpperBound A α = ∀ x → A ∋ x → x ≤ α
  IsLowerBound : Subset ℝ ℓ → ℝ → Set (ℓ ⊔ ℓ)
  IsLowerBound A α = ∀ x → A ∋ x → α ≤ x
  BoundedFromAbove : Subset ℝ ℓ → Set (ℓ ⊔ ℓ)
  BoundedFromAbove A = Σ α ∈ ℝ ∧ IsUpperBound A α
  BoundedFromBellow : Subset ℝ ℓ → Set (ℓ ⊔ ℓ)
  BoundedFromBellow A = Σ α ∈ ℝ ∧ IsLowerBound A α
  Bounded : Subset ℝ ℓ → Set (ℓ ⊔ ℓ)
  Bounded A = BoundedFromAbove A ∧ BoundedFromBellow A
  IsTightUpperBound : Subset ℝ ℓ → ℝ → Set (ℓ ⊔ ℓ ⊔ ℓ)
  IsTightUpperBound A α = IsUpperBound A α ∧ ∀ ε → 0′ < ε → Σ x ∈ ℝ ∧ (A ∋ x ∧ α - ε < x)
  IsTightLowerBound : Subset ℝ ℓ → ℝ → Set (ℓ ⊔ ℓ ⊔ ℓ)
  IsTightLowerBound A α = IsLowerBound A α ∧ ∀ ε → 0′ < ε → Σ x ∈ ℝ ∧ (A ∋ x ∧ x < α + ε)
  field completeness : ∀ A x α → A ∋ x → IsUpperBound A α → Σ β ∈ ℝ ∧ IsTightUpperBound A β
  helper-4-2 : ∀ x → - - x ＝ x
  helper-4-2 x =
      +commutativity (- x) x
      ⟫ +inverse x
      |> conclusion-2-3
      |> symmetry
        ∶ - - x ＝ x
  proposition-4-2 : ∀ {A : Subset ℝ ℓ} {α β} → IsTightUpperBound A α → IsTightUpperBound A β → α ＝ β
  proposition-4-2 {A} {α} {β} tight-ubα tight-ubβ =
      =linearity
        (wolog tight-ubα tight-ubβ)
        (wolog tight-ubβ tight-ubα)
      where
        wolog : ∀ {α β} → IsTightUpperBound A α → IsTightUpperBound A β → α < β → ⊥
        wolog {α} {β} (ubα , tightα) (ubβ , tightβ) lt =
          lt
            ∶ α < β
          |> +order (- α)
            ∶ α - α < β - α
          |> substitute (_< β - α) (+inverse α)
            ∶ 0′ < β - α
          |> tightβ (β - α)
          |> λ (x , xia , ltx) →
          ltx
            ∶ β - (β - α) < x
          |> substitute (_< x) (congruence (β +_) (symmetry (proposition-2-10 (β - α))))
            ∶ β + - 1′ ∙ (β - α) < x
          |> substitute (_< x) (congruence (β +_) (distributivity (- 1′) β (- α)))
            ∶ β + (- 1′ ∙ β + - 1′ ∙ - α) < x
          |> substitute (_< x) (congruence (β +_) (congruence (((- 1′) ∙ β) +_) (proposition-2-10 (- α))))
            ∶ β + (- 1′ ∙ β - - α) < x
          |> substitute (_< x) (congruence (β +_) (congruence (_- - α) (proposition-2-10 β)))
            ∶ β + (- β - - α) < x
          |> substitute (_< x) (symmetry (+associativity β (- β) (- - α)))
            ∶ β + - β - - α < x
          |> substitute (_< x) (congruence (_- (- α)) (+inverse β))
            ∶ 0′ - - α < x
          |> substitute (_< x) (+commutativity 0′ (- - α))
            ∶ - - α + 0′ < x
          |> substitute (_< x) (+neutral (- - α))
            ∶ - - α < x
          |> substitute (_< x) (helper-4-2 α)
            ∶ α < x
          |> ubα x (xia ∶ A ∋ x)
            ∶ ⊥
  ---- quick & dirty definition of the rationals (not part of the lesson) ----
  data ℕ⁺ : Set where
    one : ℕ⁺
    suc : ℕ⁺ → ℕ⁺
  infixl 6 _∙1ℕ⁺
  _∙1ℕ⁺ : ℕ⁺ → ℝ
  one ∙1ℕ⁺ = 1′
  suc n ∙1ℕ⁺ = 1′ + n ∙1ℕ⁺
  data ℤ : Set where
    positive : ℕ⁺ → ℤ
    zero : ℤ
    negative : ℕ⁺ → ℤ
  infix 6 _∙1ℤ
  _∙1ℤ : ℤ → ℝ
  positive n ∙1ℤ = n ∙1ℕ⁺
  zero ∙1ℤ = 0′
  negative n ∙1ℤ = - (n ∙1ℕ⁺)
  helper-rationals-1 : ∀ n → 0′ < n ∙1ℕ⁺
  helper-rationals-1 one =
    (λ ⋆ →
      let cont =
              ⋆
                ∶ 1′ < 0′
              |> +order (- 1′)
                ∶ 1′ - 1′ < 0′ - 1′
              |> substitute (_< 0′ - 1′) (+inverse 1′)
                ∶ 0′ < 0′ - 1′
              |> substitute (0′ <_) (+commutativity 0′ (- 1′))
                ∶ 0′ < - 1′ + 0′
              |> substitute (0′ <_) (+neutral (- 1′))
                ∶ 0′ < - 1′
      in
      ∙order (- 1′) cont cont
        ∶ 0′ ∙ - 1′ < - 1′ ∙ - 1′
      |> substitute (_< - 1′ ∙ - 1′) (∙commutativity 0′ (- 1′) ⟫ proposition-2-9 (- 1′))
        ∶ 0′ < - 1′ ∙ - 1′
      |> substitute (0′ <_) (proposition-2-10 (- 1′))
        ∶ 0′ < - - 1′
      |> substitute (0′ <_) (helper-4-2 1′)
        ∶ 0′ < 1′
      |> antisymmetry ⋆
        ∶ ⊥
    )
    |> <linearity ＿ (λ e → different-naturals (symmetry e))
      ∶ 0′ < 1′
  helper-rationals-1 (suc n) =
    helper-rationals-1 n
      ∶ 0′ < n ∙1ℕ⁺
    |> +order 1′
      ∶ 0′ + 1′ < n ∙1ℕ⁺ + 1′
    |> substitute (0′ + 1′ <_) (+commutativity (n ∙1ℕ⁺) 1′)
      ∶ 0′ + 1′ < 1′ + n ∙1ℕ⁺
    |> substitute (_< 1′ + n ∙1ℕ⁺) (+commutativity 0′ 1′)
      ∶ 1′ + 0′ < 1′ + n ∙1ℕ⁺
    |> substitute (_< 1′ + n ∙1ℕ⁺) (+neutral 1′)
      ∶ 1′ < 1′ + n ∙1ℕ⁺
    |> transitivity (helper-rationals-1 one)
      ∶ 0′ < 1′ + n ∙1ℕ⁺
  helper-rationals-2 : ∀ n → ¬ n ∙1ℕ⁺ ＝ 0′
  helper-rationals-2 n ⋆ =
    antisymmetry cont cont
    where cont : 0′ < 0′
          cont =
            helper-rationals-1 n
              ∶ 0′ < n ∙1ℕ⁺
            |> substitute (0′ <_) (⋆ ∶ n ∙1ℕ⁺ ＝ 0′)
              ∶ 0′ < 0′
  ℚ = [ x ∈ ℝ ∣ Lift ℓ (Σ k ∈ ℤ ∧ Σ n ∈ ℕ⁺ ∧ x ＝ k ∙1ℤ / n ∙1ℕ⁺ ⟨ helper-rationals-2 n ⟩) ]
  ----------------------------------------------------------------------------
  helper-4-1-1 : 0′ ＝ - 0′
  helper-4-1-1 =
      +neutral 0′
      |> conclusion-2-3
        ∶ 0′ ＝ - 0′
  helper-4-1-2 : ∀ {x} (nz : ¬ x ＝ 0′) → ¬ x ⁻¹⟨ nz ⟩ ＝ 0′
  helper-4-1-2 {x} nz ⋆ =
    ⋆
      ∶ x ⁻¹⟨ nz ⟩ ＝ 0′
    |> congruence (x ∙_)
      ∶ x / x ⟨ nz ⟩ ＝ x ∙ 0′
    |> =transitivity (symmetry (∙inverse x nz))
      ∶ 1′ ＝ x ∙ 0′
    |> =transitivity ＿ proposition-2-9 x
      ∶ 1′ ＝ 0′
    |> symmetry
    |> different-naturals
      ∶ ⊥
  module example-4-1 where
    A : Subset ℝ ℓ
    A = [ x ∈ ℝ ∣ x < 1′ ]
    proposition-4-1-1 : IsTightUpperBound A 1′
    first proposition-4-1-1 x xia lta = antisymmetry (lta ∶ 1′ < x) (xia ∶ x < 1′)
    first (second proposition-4-1-1 ε lt) = 1′ - ε / (1′ + 1′) ⟨ helper-rationals-2 (suc one) ⟩
    first (second (second proposition-4-1-1 ε lt)) =
        let nz = helper-rationals-2 (suc one) in
        lt
          ∶ 0′ < ε
        |> proposition-3-1
          ∶ - ε < - 0′
        |> substitute (- ε <_) (symmetry helper-4-1-1)
          ∶ - ε < 0′
        |> ∙order ((1′ + 1′) ⁻¹⟨ nz ⟩) {!   !}
          ∶ - ε / (1′ + 1′) ⟨ nz ⟩ < 0′ / (1′ + 1′) ⟨ nz ⟩
        |> substitute (- ε / (1′ + 1′) ⟨ nz ⟩ <_) (∙commutativity _ _)
          ∶ - ε / (1′ + 1′) ⟨ nz ⟩ < (1′ + 1′)⁻¹⟨ nz ⟩ ∙ 0′
        |> substitute (- ε / (1′ + 1′) ⟨ nz ⟩ <_) (proposition-2-9 ((1′ + 1′)⁻¹⟨ nz ⟩))
          ∶ - ε / (1′ + 1′) ⟨ nz ⟩ < 0′
        |> substitute (_< 0′) (congruence (_/ 1′ + 1′ ⟨ nz ⟩) (symmetry (proposition-2-10 ε)))
          ∶ (- 1′ ∙ ε) / (1′ + 1′) ⟨ nz ⟩ < 0′
        |> substitute (_< 0′) (∙associativity (- 1′) ε ((1′ + 1′)⁻¹⟨ nz ⟩))
          ∶ - 1′ ∙ (ε / (1′ + 1′) ⟨ nz ⟩) < 0′
        |> substitute (_< 0′) (proposition-2-10 (ε / (1′ + 1′) ⟨ nz ⟩))
          ∶ - (ε / (1′ + 1′) ⟨ nz ⟩) < 0′
        |> +order 1′
          ∶ - (ε / (1′ + 1′) ⟨ nz ⟩) + 1′ < 0′ + 1′
        |> substitute (_< 0′ + 1′) (+commutativity (- (ε / (1′ + 1′) ⟨ nz ⟩)) 1′)
          ∶ 1′ - ε / (1′ + 1′) ⟨ nz ⟩ < 0′ + 1′
        |> substitute (1′ - ε / (1′ + 1′) ⟨ nz ⟩ <_) (+commutativity 0′ 1′)
        |> substitute (1′ - ε / (1′ + 1′) ⟨ nz ⟩ <_) (+neutral 1′)
          ∶ 1′ - ε / (1′ + 1′) ⟨ nz ⟩ < 1′
    second (second (second proposition-4-1-1 ε lt)) =
        let nz = helper-rationals-2 (suc one) in
        {!   !}
          ∶ ε < ε ∙ (1′ + 1′)
        |> ∙order ((1′ + 1′)⁻¹⟨ nz ⟩) {!   !}
          ∶ ε / (1′ + 1′) ⟨ nz ⟩ < ε ∙ (1′ + 1′) / (1′ + 1′) ⟨ nz ⟩
        |> substitute (ε / (1′ + 1′) ⟨ nz ⟩ <_) (∙associativity ε (1′ + 1′) ((1′ + 1′)⁻¹⟨ nz ⟩))
          ∶ ε / (1′ + 1′) ⟨ nz ⟩ < ε ∙ ((1′ + 1′) / (1′ + 1′) ⟨ nz ⟩)
        |> substitute (ε / (1′ + 1′) ⟨ nz ⟩ <_) (congruence (ε ∙_) (∙inverse (1′ + 1′) nz))
          ∶ ε / (1′ + 1′) ⟨ nz ⟩ < ε ∙ 1′
        |> substitute (ε / (1′ + 1′) ⟨ nz ⟩ <_) (∙neutral ε)
          ∶ ε / (1′ + 1′) ⟨ nz ⟩ < ε
        |> proposition-3-1
          ∶ - ε < - (ε / (1′ + 1′) ⟨ nz ⟩)
        |> +order 1′
          ∶ - ε + 1′ < - (ε / (1′ + 1′) ⟨ nz ⟩) + 1′
        |> substitute (- ε + 1′ <_) (+commutativity (- (ε / (1′ + 1′) ⟨ nz ⟩)) 1′)
          ∶ - ε + 1′ < 1′ - ε / (1′ + 1′) ⟨ nz ⟩
        |> substitute (_< 1′ - ε / (1′ + 1′) ⟨ nz ⟩) (+commutativity (- ε) 1′)
          ∶ 1′ - ε < 1′ - ε / (1′ + 1′) ⟨ nz ⟩
  lemma-4-4 : ∀ x → ℚ ∋ x → ¬ x ∙ x ＝ 1′ + 1′
  lemma-4-4 x ratx ⋆ = {!   !}
  helper-4-5-1 : ∀ x → 1′ < x → x < x ∙ x
  helper-4-5-1 x ⋆ =
      ⋆
        ∶ 1′ < x
      |> ∙order x (transitivity (helper-rationals-1 one) ⋆)
        ∶ 1′ ∙ x < x ∙ x
      |> substitute (_< x ∙ x) (∙commutativity _ _ ⟫ ∙neutral x)
        ∶ x < x ∙ x
  proposition-4-5 : ¬ (∀ A x α → A ⊆ ℚ → A ∋ x → ℚ ∋ α → IsUpperBound A α → Σ β ∈ ℝ ∧ (ℚ ∋ β ∧ IsTightUpperBound A β))
  proposition-4-5 completeness =
        let A = [ x ∈ ℝ ∣ ℚ ∋ x ∧ 0′ < x ∧ x ∙ x < 1′ + 1′ ] in
        completeness A 1′ (1′ + 1′)
          (first ∶ ∀ {x} → ℚ ∋ x ∧ 0′ < x ∧ x ∙ x < 1′ + 1′ → ℚ ∋ x)
          (lift (positive one , one , (
            let nz = helper-rationals-2 one in
            conclusion-2-7 nz (∙neutral 1′)
              ∶ 1′ ＝ 1′ ⁻¹⟨ nz ⟩
            |> =transitivity ＿ symmetry (∙neutral (1′ ⁻¹⟨ nz ⟩))
            |> =transitivity ＿ ∙commutativity _ _
              ∶ 1′ ＝ 1′ / 1′ ⟨ nz ⟩)) ,
          helper-rationals-1 one ,
          (helper-rationals-1 one
            ∶ 0′ < 1′
           |> +order 1′
            ∶ 0′ + 1′ < 1′ + 1′
           |> substitute (_< 1′ + 1′) (+commutativity 0′ 1′ ⟫ +neutral 1′)
            ∶ 1′ < 1′ + 1′
           |> substitute (_< 1′ + 1′) (symmetry (∙neutral 1′))
            ∶ 1′ ∙ 1′ < 1′ + 1′))
          (lift ((positive (suc one)) , one , (
            let nz = helper-rationals-2 one in
            symmetry (∙neutral (1′ + 1′))
              ∶ 1′ + 1′ ＝ (1′ + 1′) ∙ 1′
            |> =transitivity ＿ congruence ((1′ + 1′) ∙_) (conclusion-2-7 nz (∙neutral 1′))
              ∶ 1′ + 1′ ＝ (1′ + 1′) / 1′ ⟨ nz ⟩)))
          (λ x (ratx , posx , xlts2) xgt2 →
            helper-rationals-1 one
              ∶ 0′ < 1′
            |> +order 1′
              ∶ 0′ + 1′ < 1′ + 1′
            |> substitute (_< 1′ + 1′) (+commutativity 0′ 1′ ⟫ +neutral 1′)
              ∶ 1′ < 1′ + 1′
            |>  transitivity ＿ xgt2
              ∶ 1′ < x
            |> helper-4-5-1 x
              ∶ x < x ∙ x
            |> transitivity xgt2
              ∶ 1′ + 1′ < x ∙ x
            |> transitivity xlts2
              ∶ x ∙ x < x ∙ x
            |> λ lt → antisymmetry lt lt
              ∶ ⊥)
          ∶ Σ β ∈ ℝ ∧ (ℚ ∋ β ∧ IsTightUpperBound A β)
        |> λ (α , ratα , ubα , tightα) →
        {!   !}
          ∶ ⊥
  infixr 6 _^ℕ⁺_
  _^ℕ⁺_ : ℝ → ℕ⁺ → ℝ
  x ^ℕ⁺ one = x
  x ^ℕ⁺ suc n = x ^ℕ⁺ n ∙ x
  proposition-4-6 : ∀ x n → 0′ < x → ∃! y ∈ ℝ ∧ (0′ < y ∧ x ＝ y ^ℕ⁺ n)
  proposition-4-6 = {!   !}
  infix 6 _√ℕ⁺_⟨_⟩
  _√ℕ⁺_⟨_⟩ : ℕ⁺ → ∀ x → 0′ < x → ℝ
  helper-4-6-1 : ∀ x n → 0′ < x → 0′ < x ^ℕ⁺ n
  helper-4-6-1 x one gz = gz ∶ 0′ < x
  helper-4-6-1 x (suc n) gz =
    helper-4-6-1 x n gz
      ∶ 0′ < x ^ℕ⁺ n
    |> ∙order x gz
      ∶ 0′ ∙ x < x ^ℕ⁺ suc n
    |> substitute (_< x ^ℕ⁺ suc n) (∙commutativity 0′ x ⟫ proposition-2-9 x)
      ∶ 0′ < x ^ℕ⁺ suc n
  n √ℕ⁺ x ⟨ gz ⟩ =
      proposition-4-6 x n gz
      |> λ (y , _) → y
  proposition-4-7 :
    ∀ a {m n k l} (gz : 0′ < a)
      → m ∙1ℕ⁺ / n ∙1ℕ⁺ ⟨ helper-rationals-2 n ⟩
        ＝ k ∙1ℕ⁺ / l ∙1ℕ⁺ ⟨ helper-rationals-2 l ⟩
      → n √ℕ⁺ a ^ℕ⁺ m ⟨ helper-4-6-1 a m gz ⟩
        ＝ k √ℕ⁺ a ^ℕ⁺ l ⟨ helper-4-6-1 a l gz ⟩
  proposition-4-7 = {!   !}

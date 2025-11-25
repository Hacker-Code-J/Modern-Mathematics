Great—here’s what that sentence really means, unpacked carefully and only in the language of forms.

# What we’re given

* A complex torus (X=\mathbb C/\Lambda) (genus (1)).
* Its holomorphic 1-form (\omega). On a torus this is unique up to a nonzero scalar and, crucially, **has no zeros** (because the total number of zeros of a holomorphic 1-form equals (2g-2=0)).

Because (\omega) never vanishes, it can serve as a local “measuring stick” for holomorphic length and thus defines a local coordinate by integration.

# “Local Abel coordinate” (t) defined by (dt=\omega)

Pick a base point (0\in X). Choose a **simply connected** neighborhood (U\ni 0) (e.g., a small topological disc) so that every loop in (U) is null-homologous.

Define
[
t(p) ;:=; \int_{0}^{p}\omega\qquad (p\in U).
]
Because (U) is simply connected and (\omega) is holomorphic (hence closed), the integral is **path-independent**. Consequently (t) is a well-defined holomorphic function on (U), and by construction
[
dt=\omega \quad\text{on }U.
]

## Why (t) is a *coordinate* (i.e., a local biholomorphism)

* (dt=\omega) and (\omega) never vanishes (\Rightarrow) (dt\neq 0).
* A holomorphic function with nonzero differential is a local biholomorphism (Inverse Function Theorem).
* Hence (t) is a **holomorphic uniformizer** at (0).

## Uniqueness/ambiguities

* If you change the base point in (U), you add a constant to (t).
* If you scale the 1-form, (\omega' = c,\omega) with (c\in\mathbb C^\times), then the associated coordinate is (t' = c,t + \text{const}).
* So (dt=\omega) fixes (t) **uniquely up to an additive constant** on the chosen simply connected patch; choosing a normalization (e.g., (t(0)=0)) pins it down.

# Intrinsic vs. covering-map view (they agree)

**Intrinsic integration (above):** chose (U) simply connected and set (t(p)=\int_0^p\omega).

**Covering-map view:** let (\pi:\mathbb C\to X) be the quotient map and choose a local inverse branch (\sigma:U\to\mathbb C) with (\sigma(0)=0). Since (\pi^*\omega=dz), for (p\in U)
[
t(p)=\int_{0}^{p}\omega=\int_{0}^{\sigma(p)} dz = \sigma(p).
]
So (t) is literally the lifted coordinate (z) on (\mathbb C) (modulo an additive constant). This explains the name “Abel coordinate”: it’s the local uniformizing coordinate obtained by integrating the invariant differential.

# Why only **local**?

Globally, if you try to define (t(p)=\int_0^p\omega) on all of (X), the value depends on the homology class of the path: going around a nontrivial loop adds a period in (\Lambda={\int_\gamma\omega}). Thus the **global** Abel map is multivalued on (X), but well-defined on the universal cover (\mathbb C); descending it gives the usual identification (t\sim t+\lambda) for (\lambda\in\Lambda).

# Handy normalizations (often used later)

* Choose cycles ((a,b)) and scale (\omega) so that (\int_a\omega=1). Then (\tau:=\int_b\omega\in\mathfrak H) and in the (t)-coordinate
  [
  \Lambda=\mathbb Z\oplus\mathbb Z\tau,\qquad t\sim t+1\sim t+\tau.
  ]
* Changing the cycle basis by ( \begin{psmallmatrix}a&b\ c&d\end{psmallmatrix}\in\mathrm{SL}_2(\mathbb Z)) sends
  (\tau\mapsto \dfrac{a\tau+b}{c\tau+d}) and rescales (\omega) (hence (t)) by (1/(c\tau+d)).

# Minimal checks you can run

1. **Path-independence:** On a disc (U), (\int_\gamma \omega=0) for every loop (\gamma\subset U) (Cauchy’s theorem) ⇒ (t) well-defined.
2. **Nonvanishing:** (dt=\omega\neq 0) ⇒ (t) is a local coordinate.
3. **Covering compatibility:** With a lift (\sigma), verify (t=\sigma) and (\pi^* dt = dz).

That’s the whole idea: pick the unique (up to scale) nowhere-vanishing holomorphic 1-form (\omega), integrate it locally to get a holomorphic coordinate (t), and remember that globally (t) is only defined modulo periods. This is exactly the coordinate we’ll use to define differentials of the second kind, (\zeta), and then (\wp=-,d\zeta/dt).


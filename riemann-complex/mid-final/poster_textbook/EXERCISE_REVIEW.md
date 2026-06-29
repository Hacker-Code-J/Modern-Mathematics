# Exercise System Review

## Review Scope

This review evaluates the revised exercise system after the additions described
in `EXERCISE_IMPROVEMENT_PLAN.md`.  The question is whether solving the
exercises, then checking the solutions, gives a coherent route to the Big
Picture:

`C/Lambda cong Pic^0(E) cong E(C)`

as complex Lie groups, with chord-tangent addition equal to torus addition
transported by `[wp:wp':1]`.

## Component Verdicts

| Big Picture component | Verdict | Evidence in revised exercises |
| --- | --- | --- |
| Analytic torus `C/Lambda` | Pass | Chs. 2--3 compute genus, verify quotient addition, translations, and complex Lie group requirements. |
| Elliptic functions on the torus | Pass | Ch. 4 now includes descent/ascent between periodic functions on `C` and meromorphic functions on `T`. |
| Residue and zero-pole constraints | Pass | Chs. 1 and 4 connect `df/f`, degree-zero principal divisors, zero-pole counts, and Abel sums. |
| Weierstrass `wp` and `wp'` | Pass | Ch. 5 now computes pole orders and derives the cubic relation as the affine equation. |
| Divisors and `Pic^0` | Pass | Ch. 6 now checks addition of divisor classes and the criterion for equality in `Pic^0`. |
| Genus-one Riemann-Roch | Pass | Ch. 7 now proves the concrete bases `L(2O)=span(1,wp)` and `L(3O)=span(1,wp,wp')`. |
| Abel-Jacobi | Pass | Ch. 8 now proves additivity of the Abel sum and descent to a homomorphism `Pic^0(T)->T`. |
| Weierstrass embedding | Pass with named theorem boundary | Ch. 9 connects `Phi(-z)` with reflection, translates a torus point into cubic and divisor-class notation, and adds a generic injectivity calculation for `Phi`. |
| Plane cubic group law | Pass | Ch. 10 now computes the line divisor as `div(ell/Z)` and turns it into `P+Q+R=O`. |
| Transport theorem | Pass | Ch. 11 now asks for the full step-by-step proof that chord-tangent produces `Phi(u+v)`. |
| Cohomology and moduli | Pass with caveat | Ch. 12 now asks what cohomology explains and what it does not prove. |
| Finite-field directions | Pass with caveat | Ch. 13 now separates rational chord-tangent formulas from complex analytic uniformization. |
| Final synthesis | Pass | Ch. 14 now asks for a map-check table and an explicit Jacobian-addition Abel-sum calculation. |

## Vagueness and Difficulty Check

The revised exercises avoid unsupported prompts such as merely "explain the
relationship."  When an exercise asks for explanation, it specifies the target:
for example, Ch. 11 asks the student to compute the reflection step from
`r=-(u+v)`, and Ch. 14 asks the student to compute the Abel sum of
`[P_1]+[P_2]-[S]-[O]`.

The exercises are realistic for the target reader.  They do not ask students to
prove Riemann-Roch, Abel's theorem, Hasse's theorem, or the full Weierstrass
embedding theorem from scratch.  Instead, they use those stated results in
controlled genus-one situations.

## Solution Alignment

The solution appendix now has entries matching the revised numbering:

- Chapters 1--2 have four exercises each.
- Chapters 3--8, 10--11, and 14 have five exercises each.
- Chapter 9 has six exercises after the generic Weierstrass embedding check was
  added.
- Chapters 12--13 have four exercises each.

The new solution entries answer the stated task rather than merely restating the
result.  In particular:

- Exercise 4.5 converts a concrete principal divisor
  `[a_1]+[a_2]-[b_1]-[b_2]` into the Abel-sum calculation
  `a_1+a_2-b_1-b_2=0` in `C/Lambda`.
- Exercises 7.4 and 7.5 use divisor inequalities, dimension, and pole-order
  independence to identify bases.
- Exercise 8.5 proves descent of `smap` to `Pic^0(T)`.
- Exercise 9.6 explains the generic injectivity calculation for `Phi` while
  naming the half-period and point-at-infinity cases left to the embedding
  theorem.
- Exercises 10.4, 10.5, 11.4, and 11.5 form the explicit
  line-divisor-to-transport proof chain.
- Exercises 14.4 and 14.5 assemble the theorem through a map-check table and a
  Jacobian-addition calculation.

## Calculation-First Check

The exercise system now breaks the Big Picture into concrete calculations rather
than relying on broad conceptual prompts.

| Calculation type | Where it appears | Role in the Big Picture |
| --- | --- | --- |
| Calculus of forms and residues | Chs. 1, 4 | Turns local zero-pole data into global constraints. |
| Topological cell counts | Ch. 2 | Identifies the parallelogram quotient as genus one. |
| Lattice linear algebra | Chs. 3, 8, 11 | Makes quotient addition, Abel sums, and transported addition explicit. |
| Laurent and pole-order calculations | Chs. 5, 7 | Produces `wp`, `wp'`, and the `L(3O)` coordinate space. |
| Divisor coefficient arithmetic | Chs. 6, 8, 10 | Builds `Pic^0` and principal-divisor criteria. |
| Vieta, line-intersection, and line-divisor algebra | Chs. 10, 11, 14 | Converts collinearity into the chord-tangent law. |
| Generic embedding checks | Ch. 9 | Shows how `wp'` removes the generic `z` versus `-z` ambiguity. |
| Jacobian addition Abel sums | Ch. 14 | Computes addition in `Pic^0(E)` from torus addition. |
| Quotient and scaling computations | Ch. 12 | Separates the Jacobian/moduli viewpoint from the chord-tangent proof. |
| Finite-field tables | Ch. 13 | Shows which algebraic formulas survive outside `C`. |

## Reconstruction Test After Revision

A student solving the revised exercises can now reconstruct the following proof
route.

1. `C/Lambda` is a compact genus-one complex Lie group.
2. Meromorphic functions on it are elliptic functions.
3. Principal divisors have degree zero and Abel sum zero.
4. `wp` and `wp'` have pole orders two and three and satisfy the Weierstrass
   cubic equation.
5. Riemann-Roch gives the exact coordinate spaces `L(2O)` and `L(3O)`.
6. `Phi=[wp:wp':1]` sends the torus to the cubic, converts `z -> -z` into
   reflection, and is generically injective by the `wp,wp'` coordinate
   calculation.
7. Abel-Jacobi identifies degree-zero divisor classes with torus points.
8. A line through `P,Q,R` gives the computed principal divisor
   `div(ell/Z)=[P]+[Q]+[R]-3[O]` and hence `P+Q+R=O`.
9. Therefore the chord-tangent result is the reflection of the third
   intersection, which is `Phi(u+v)`.
10. The three notations `z`, `Phi(z)`, and `[Phi(z)]-[O]` represent the same
    genus-one group element, and the Jacobian addition formula follows from a
    zero Abel-sum divisor.

## Remaining Risks

- The exercises still rely on the textbook's proof sketches or stated theorems
  for the deepest inputs: Riemann-Roch, Abel's theorem, the sigma-function
  existence direction, and the global proof that `Phi` is a biholomorphism.
- The solution appendix is calculation-aligned, but a later teaching edition
  could expand the prose around the named theorem inputs.
- The exercise system is sufficient for the stated Big Picture, not for a full
  independent course in algebraic curves or sheaf cohomology.

## Final Verdict

The revised exercise system is sufficient for the Big Picture.  Solving the
exercises alone, followed by checking the solutions, now gives a coherent route
through the analytic torus, elliptic functions, divisors, `Pic^0`, Abel-Jacobi,
the Weierstrass embedding, line divisors, and the transported chord-tangent
group law.

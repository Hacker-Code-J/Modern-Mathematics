# Calculation Exercise Review

## Scope

This report reviews the exercise system after the calculation-first repair pass.
The question is whether the Big Picture can be learned by solving concrete
calculation exercises and then checking the solutions.

The Big Picture is

```text
C/Lambda cong Pic^0(E) cong E(C)
```

as complex Lie groups, with chord-tangent addition equal to torus addition
transported by

```text
z |-> [wp(z) : wp'(z) : 1].
```

The current exercise system is sufficient as a calculation-based route through
the Big Picture, provided the major named theorems stated in the text are
accepted as inputs.  It is not a theorem-free derivation of Riemann-Roch,
Abel's theorem, or the global Weierstrass embedding theorem.

## Big Picture Calculation Map

| Step | Calculation the student performs | Exercise support |
| --- | --- | --- |
| Local residues | Compute `df/f = m dz/(z-p)+du/u` and read off the residue | 1.3 |
| Principal divisors have degree zero | Sum residues of `df/f` on a compact surface | 1.4, 6.2 |
| Genus-one topology | Count `F,E,V` for the glued parallelogram and solve `chi=2-2g` | 2.1, 2.4 |
| Quotient group law | Replace representatives by lattice translates and compute the change | 3.1, 3.4 |
| Lattice linear algebra | Use `GL_2(Z)` inclusions and compute `Im(1/tau)` after basis swap | 3.2, 3.3 |
| Complex Lie group meaning | Check group law, holomorphicity, and holomorphic inverse requirements | 3.5, 14.4 |
| Elliptic functions on the torus | Compute `(F circ q)(z+lambda)` and representative independence | 4.4 |
| Principal Abel sum example | For `div(f)=[a_1]+[a_2]-[b_1]-[b_2]`, compute `a_1+a_2-b_1-b_2 mod Lambda` | 4.5 |
| Weierstrass parity and cubic equation | Reindex the `wp` sum, differentiate, compute pole orders, and substitute `x=wp`, `y=wp'` | 5.1-5.5 |
| Divisor arithmetic | Compute orders, degrees, sums, and equality in `Div^0/Prin` | 6.1-6.5 |
| Genus-one Riemann-Roch usage | Substitute `n=1,2,3`, write divisor inequalities, and identify `L(2O)`, `L(3O)` | 7.1-7.5 |
| Abel-Jacobi descent | Compute Abel sums term by term and show principal divisors map to zero | 8.1-8.5 |
| Projective Weierstrass map | Multiply `[wp:wp':1]` by `z^3` and take the limit at `O` | 9.1 |
| Reflection and generic injectivity | Compute `Phi(-z)` and use `wp'` to remove the generic `z` versus `-z` ambiguity | 9.4, 9.6 |
| Chord-tangent algebra | Substitute `y=mx+b`, compare the `x^2` coefficient, and apply Vieta | 10.2 |
| Line divisor calculation | Compute zeros and poles of `ell/Z` on the cubic | 10.4 |
| Transported addition | Compute the Abel sum `u+v+r`, solve `r=-(u+v)`, and reflect | 10.5, 11.1, 11.4, 11.5 |
| Jacobian addition dictionary | Compute the Abel sum of `[P_1]+[P_2]-[S]-[O]` | 14.5 |

## Chapter-by-Chapter Inventory

| Chapter | Calculation design verdict |
| --- | --- |
| 1 | Strong.  The exercises use partial derivatives, a parametrized integral, and the local logarithmic derivative `df/f`. |
| 2 | Sufficient.  The key Big Picture calculation is the cell count giving genus one. |
| 3 | Strong.  Quotient arithmetic, lattice basis changes, upper-half-plane normalization, translations, and complex Lie group checks are explicit. |
| 4 | Strong after revision.  Exercise 4.5 now gives an explicit principal-divisor Abel-sum calculation instead of only the general weighted-sum statement. |
| 5 | Strong.  Parity, pole order, algebraicity, and the cubic equation are all calculation-based. |
| 6 | Strong.  `Pic^0` is built by divisor coefficients, degree sums, and quotient arithmetic. |
| 7 | Strong after solution repair.  The solutions now write the divisor inequalities for membership in `L(2O)` and `L(3O)`. |
| 8 | Strong, with theorem input.  The Abel-Jacobi descent is computed modulo `Lambda`, while Abel's theorem supplies the principal-divisor criterion. |
| 9 | Stronger after revision.  The chapter now has the dictionary exercise and a generic injectivity calculation for `Phi`; the global embedding theorem is still named input. |
| 10 | Strong after revision.  The line divisor is now computed from `div(ell/Z)` rather than merely invoked. |
| 11 | Strong.  The transport proof is reduced to the Abel-sum equation, reflection, and a projective identity calculation. |
| 12 | Sufficient as contextual material.  Scaling weights, cohomology quotients, and lattice symmetries are calculation-based but not needed for the main proof. |
| 13 | Sufficient as arithmetic context.  Point counting and formula portability are concrete. |
| 14 | Stronger after revision.  The final synthesis now includes a Jacobian-addition Abel-sum calculation and a map-check table separating calculations from named theorems. |

## Coverage Matrix

| Big Picture component | Introduced by calculation | Reinforced by calculation | Synthesized by calculation | Named theorem still used |
| --- | --- | --- | --- | --- |
| `C/Lambda` as compact genus-one complex Lie group | 2.4, 3.1 | 3.2-3.5 | 14.4, 14.5 | Complex structure on quotient |
| Elliptic functions as meromorphic functions on the torus | 4.4 | 4.1, 4.2 | 4.5 | None beyond standard quotient facts |
| Principal divisors and zero-pole constraints | 1.3, 1.4 | 6.1-6.5 | 4.5, 8.5 | Residue theorem |
| `wp`, `wp'`, and the cubic | 5.1-5.5 | 7.4, 7.5 | 9.1, 9.6 | Weierstrass differential equation statement |
| `L(2O)`, `L(3O)` coordinate spaces | 7.1 | 7.3-7.5 | 9.1, 14.4 | Genus-one Riemann-Roch |
| `Pic^0` as degree-zero divisor classes | 6.3-6.5 | 8.1-8.5 | 14.5 | Abel's theorem for principal classes |
| Abel-Jacobi bridge | 8.1-8.4 | 4.5, 8.5 | 14.5 | Abel's theorem |
| Weierstrass map `Phi=[wp:wp':1]` | 5.5, 9.1 | 9.4, 9.6 | 11.4, 14.4 | Global embedding theorem |
| Chord-tangent law | 10.1-10.3 | 10.4, 10.5 | 11.4, 14.1 | Bezout/intersection multiplicity background |
| Chord-tangent equals torus addition | 10.5, 11.1 | 11.4, 11.5 | 14.1, 14.5 | Abel's theorem and embedding theorem |
| Isomorphism as complex Lie groups | 3.5 | 14.4 | 14.5 | Holomorphic inverse/bijectivity inputs |

## Reconstruction Test

If a student reads the notation, theorem statements, exercises, and solutions,
the calculation path is now coherent.

1. The student computes the torus quotient group law and the genus-one topology
   of the parallelogram quotient.
2. The student computes how elliptic functions descend to the quotient and how
   their zeros and poles satisfy degree and Abel-sum constraints.
3. The student computes the Weierstrass coordinates, their pole orders, their
   cubic equation, the point at infinity, and the reflection formula.
4. The student computes divisor classes in `Pic^0`, Abel sums modulo `Lambda`,
   and the descent of the Abel-sum map through principal divisors.
5. The student computes the line divisor from `ell/Z`, then computes its Abel
   sum as `u+v+r`.
6. The student solves `u+v+r=0`, reflects the third intersection, and obtains
   `Phi(u+v)`.
7. The student computes the Jacobian addition relation
   `([P_1]-[O])+([P_2]-[O])=[S]-[O]` from the Abel sum of
   `[P_1]+[P_2]-[S]-[O]`.
8. The student uses the map-check table to see exactly which parts are direct
   calculations and which parts are supplied by named theorems.

This is enough to reconstruct the Big Picture as a calculation-guided theorem
statement.  It is not enough to reprove the deepest named theorems from scratch,
and the text should continue to say so.

## Improvements Applied

| Previous weak spot | Status after repair |
| --- | --- |
| Line divisor invoked more than calculated | Fixed in Exercise 10.4 and its solution by computing `div(ell/Z)`. |
| Abel's theorem used too abruptly | Improved in Exercise 4.5 by adding a concrete principal-divisor Abel-sum example. |
| `L(2O)` and `L(3O)` membership checks terse | Fixed in Solutions 7.4 and 7.5 by writing divisor inequalities. |
| Weierstrass embedding theorem boundary too black-boxed | Improved by new Exercise 9.6, which computes the generic injectivity mechanism. |
| Exercise 9.5 visual mismatched | Fixed with a three-notation dictionary diagram. |
| Tangent and identity edge cases terse | Improved by restricting Exercise 10.1 to the nonvertical affine case and making Solution 11.3 projective. |
| Final synthesis too table/checklist-heavy | Improved by adding the Abel-sum Jacobian addition calculation in Exercise 14.5. |
| Complex Lie group checks not tied to maps | Improved by revising Exercise 14.4 into a map-check table separating calculations from theorem inputs. |

## Remaining Theorem-Dependent Risks

- Riemann-Roch is used as a theorem; the exercises compute its genus-one
  consequences but do not prove it.
- Abel's theorem is used as a theorem; the exercises now give better Abel-sum
  calculations but do not construct the required elliptic functions from
  scratch.
- The global Weierstrass embedding theorem is used as a theorem; Exercise 9.6
  explains generic injectivity but not the full compact global proof.
- Bezout/intersection multiplicity facts are used in the line-divisor
  calculation; the exercises compute the divisor once those facts are accepted.

## Final Verdict

The calculation exercise system is sufficient for the Big Picture, with named
theorem inputs.

The system now breaks the main theorem into concrete residues, integrals,
lattice calculations, pole-order checks, divisor arithmetic, Abel sums,
projective-coordinate computations, Vieta calculations, line-divisor
calculations, and final Jacobian-addition calculations.  The remaining risks are
not exercise-design gaps; they are the expected advanced theorem inputs for a
short genus-one textbook.

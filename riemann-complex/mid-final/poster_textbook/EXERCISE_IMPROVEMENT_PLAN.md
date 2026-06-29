# Exercise Improvement Plan

## Design Principle

The revised exercises should keep the existing chapter order and add a visible
thread through the main theorem.  The added exercises should not introduce new
machinery; they should require students to use definitions and theorem
statements already present in the text.

After the calculation-first revision, the exercises should also avoid treating
"understanding the Big Picture" as a purely verbal task.  Each major conceptual
step should be anchored in a concrete calculus, algebra, or linear-algebra-style
calculation: a residue, an integral, a lattice-coordinate check, a pole-order
dimension count, a divisor coefficient sum, an Abel sum, a Vieta computation, a
cohomology quotient, or a finite-field table.

## Chapter-by-Chapter Plan

### Chapter 1

- Existing role: local computations with the winding form and `df/f`.
- Missing role: connect the local residue computation to the divisor degree.
- Proposed exercise: prove that summing residues of `df/f` on a compact surface
  gives `deg div(f)=0`.
- Expected solution: use `Res_p(df/f)=ord_p(f)` and the compact residue theorem.
- Dependency: Exercises 1.3 and the compact residue theorem from the chapter.
- Big Picture contribution: prepares principal divisors in Chapter 6.

### Chapter 2

- Existing role: compactness, genus, finiteness of zeros and poles.
- Missing role: explain why compact genus one is the right surface type for the
  torus.
- Proposed exercise: combine compactness and `chi=0` to identify a quotient of
  a parallelogram as genus one.
- Expected solution: opposite-side gluing gives a torus with Euler
  characteristic zero; hence genus one.
- Dependency: Chapter 2 definition of genus and Chapter 3 construction.
- Big Picture contribution: makes the analytic model `C/Lambda` visible before
  the group law is transported.

### Chapter 3

- Existing role: quotient group law and lattice bases.
- Missing role: complex Lie group isomorphism language.
- Proposed exercises: show translations on `T` are holomorphic; explain that a
  biholomorphic group map is stronger than an abstract group isomorphism.
- Expected solution: translations lift to `z -> z+a`; the final theorem
  preserves both complex structure and group law.
- Dependency: definition of complex torus.
- Big Picture contribution: clarifies the meaning of `cong`.

### Chapter 4

- Existing role: elliptic-function constraints.
- Missing role: descent/ascent between periodic functions and meromorphic
  functions on `T`; explicit Abel-sum constraint for principal divisors.
- Proposed exercises: prove descent to `T`; rewrite the third Liouville law as
  a statement about the divisor of an elliptic function.
- Expected solution: use the quotient map and periodicity; convert zeros and
  poles into the formal divisor and Abel sum.
- Dependency: Chapters 3 and 4.
- Big Picture contribution: prepares Abel's theorem.

### Chapter 5

- Existing role: parity and algebraicity.
- Missing role: pole order data used by Riemann-Roch and the embedding.
- Proposed exercises: compute pole orders of `wp` and `wp'` at `O`; explain why
  the differential equation cuts out the affine cubic.
- Expected solution: use Laurent expansions and substitute `x=wp`, `y=wp'`.
- Dependency: Chapter 5 theorem and standard Laurent expansions.
- Big Picture contribution: connects analytic functions to the cubic.

### Chapter 6

- Existing role: divisors and `Pic^0`.
- Missing role: group operation in `Pic^0` and equality of divisor classes.
- Proposed exercises: show `[P]-[O]+[Q]-[O]` represents a degree-zero class;
  state when two degree-zero divisors define the same element of `Pic^0`.
- Expected solution: add divisors coefficientwise; equality means difference is
  principal.
- Dependency: Chapter 6 definitions.
- Big Picture contribution: makes the Jacobian group operation explicit.

### Chapter 7

- Existing role: dimensions and pole-order independence.
- Missing role: identify actual bases of `L(2O)` and `L(3O)`.
- Proposed exercises: prove `L(2O)=span(1,wp)` and
  `L(3O)=span(1,wp,wp')`.
- Expected solution: combine dimension counts with pole-order independence.
- Dependency: Chapters 5 and 7.
- Big Picture contribution: explains why `Phi=[wp:wp':1]` uses exactly three
  coordinates.

### Chapter 8

- Existing role: simple Abel sums and injectivity.
- Missing role: group homomorphism property and quotient through principal
  divisors.
- Proposed exercises: prove `s(D+D')=s(D)+s(D')`; show principal divisors map
  to zero, so `s` descends to `Pic^0(T)`.
- Expected solution: linearity of sums and Abel's theorem.
- Dependency: Chapters 4, 6, and 8.
- Big Picture contribution: builds `Pic^0(T)cong T`.

### Chapter 9

- Existing role: extension to `O`, parity, smoothness.
- Missing role: connect `Phi` to divisor classes and to the inverse operation.
- Proposed exercises: show `Phi(-z)=ominus Phi(z)`; translate `z` into
  `[Phi(z)]-[O]`.
- Expected solution: use parity and the map `P -> [P]-[O]`.
- Dependency: Chapters 6, 8, and 9.
- Big Picture contribution: aligns torus points, cubic points, and divisor
  classes.

### Chapter 10

- Existing role: formulas and geometric cases.
- Missing role: line divisor as a principal divisor.
- Proposed exercises: write the divisor of a line function on `E`; convert it
  into `P+Q+R=O` assuming Abel's theorem.
- Expected solution: use Proposition 10 and apply Abel-Jacobi.
- Dependency: Chapters 8 and 10.
- Big Picture contribution: gives the core chord-tangent argument.

### Chapter 11

- Existing role: identifies Abel's theorem in the transport proof.
- Missing role: full transported-addition proof as an exercise.
- Proposed exercises: guided proof that `Phi(u) boxplus Phi(v)=Phi(u+v)`;
  explain why the inverse reflection corresponds to `z -> -z`.
- Expected solution: line divisor, Abel sum, and parity.
- Dependency: Chapters 9--11.
- Big Picture contribution: makes the main theorem reconstructible.

### Chapter 12

- Existing role: cohomology and moduli checks.
- Missing role: distinguish optional structural viewpoint from the main proof.
- Proposed exercise: identify which part of the three-face theorem the
  cohomological quotient explains.
- Expected solution: it re-expresses `Pic^0(E)cong C/Lambda`, not the
  chord-tangent construction directly.
- Dependency: Chapter 12.
- Big Picture contribution: prevents confusion about what is foundational.

### Chapter 13

- Existing role: finite-field examples.
- Missing role: identify what survives outside `C` and what does not.
- Proposed exercise: separate rational chord-tangent formulas from analytic
  torus and `wp` arguments.
- Expected solution: formulas and smooth cubic survive over fields; complex
  analytic uniformization is special to `C`.
- Dependency: Chapter 13.
- Big Picture contribution: clarifies the limits of the Big Picture.

### Chapter 14

- Existing role: broad synthesis.
- Missing role: guided reconstruction of the final theorem from exercises.
- Proposed exercises: write the proof skeleton with named maps; specify the
  category of isomorphism; state which earlier exercise proves each arrow.
- Expected solution: assemble `Phi`, Abel-Jacobi, and chord-tangent transport.
- Dependency: all chapters.
- Big Picture contribution: final exercise-only route through the theorem.

## Expected Outcome

After revision, solving the exercises should allow a student to reconstruct:

- the analytic torus as a compact complex Lie group;
- elliptic functions and `wp` as the analytic coordinate functions;
- divisors and `Pic^0` as the geometric zero-pole language;
- Abel-Jacobi as the bridge from divisors to the torus;
- `Phi=[wp:wp':1]` as the bridge from the torus to the cubic;
- the line-divisor proof of chord-tangent addition;
- the final statement as an isomorphism of complex Lie groups.

## Calculation-First Repair Pass

The follow-up calculation review identified several remaining places where the
exercise system still leaned on prose or named propositions too quickly.  The
repair pass addressed them as follows.

| Gap | Repair |
| --- | --- |
| Line divisor invoked rather than calculated | Chapter 10 now asks students to compute `div(ell/Z)` on the cubic and obtain `[P]+[Q]+[R]-3[O]`. |
| Abel's theorem used too abruptly | Chapter 4 now includes the explicit principal-divisor Abel-sum calculation for `[a_1]+[a_2]-[b_1]-[b_2]`. |
| `L(2O)` and `L(3O)` solution details terse | The solutions now write the divisor inequalities certifying membership before using pole-order independence and dimension. |
| Weierstrass embedding too theorem-dependent | Chapter 9 now includes a generic injectivity calculation showing how `wp'` removes the `z` versus `-z` ambiguity, while naming the exceptional cases left to the theorem. |
| Final synthesis too table-heavy | Chapter 14 now includes an Abel-sum calculation proving the Jacobian addition formula. |
| Complex Lie group map checks too implicit | Chapter 14 now uses a map-check table separating direct calculations from named theorem inputs. |

The intended outcome is not a theorem-free proof of the advanced inputs.
Rather, the exercises now give a concrete calculation path through every major
arrow of the Big Picture while clearly marking where Riemann-Roch, Abel's
theorem, and the global Weierstrass embedding theorem enter.

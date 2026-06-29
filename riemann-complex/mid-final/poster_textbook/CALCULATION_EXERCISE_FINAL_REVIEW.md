# Calculation Exercise Final Review

## Executive Verdict

Sufficient.

The current post-repair exercise system is designed so that a strong final-year
undergraduate or beginning graduate student can understand the Big Picture by
solving calculation exercises and checking the solutions, provided the named
theorem inputs stated in the text are accepted.  The exercises do not reprove
genus-one Riemann-Roch, Abel's theorem, the global Weierstrass embedding
theorem, or Bezout/intersection multiplicity from scratch, but they now clearly
mark where those inputs enter and reduce the main theorem to explicit
calculations around them.

## Big Picture Calculation Chain

The student can reach the final theorem through the following calculation
sequence.

1. Compute the winding form derivatives and the unit-circle integral.
2. Compute `df/f` locally and identify the residue with the order of a zero or
   pole.
3. Sum residues on a compact surface to get degree zero for principal divisors.
4. Count the cells of a glued parallelogram and compute genus one.
5. Compute quotient addition in `C/Lambda` using representatives modulo lattice
   elements.
6. Check lattice basis changes with `GL_2(Z)` and normalize the period ratio to
   the upper half-plane.
7. Compute that translations on `C/Lambda` are well-defined biholomorphic group
   translations.
8. Compute how elliptic functions descend to meromorphic functions on the
   quotient.
9. Pair boundary integrals on a fundamental parallelogram to get elliptic
   zero-pole balancing.
10. Compute the concrete principal-divisor Abel sum
   `a_1+a_2-b_1-b_2 = 0 mod Lambda`.
11. Reindex the `wp` lattice sum, differentiate, and compute the parity of
   `wp` and `wp'`.
12. Use Laurent expansions to compute pole orders of `wp` and `wp'`.
13. Substitute `x=wp(z)`, `y=wp'(z)` into the Weierstrass differential equation
   to get the affine cubic.
14. Compute divisor degrees and equality in `Div^0/Prin`.
15. Use genus-one Riemann-Roch as a theorem, then compute `L(2O)` and `L(3O)`
   from divisor inequalities, pole-order independence, and dimension.
16. Compute Abel sums term by term and verify descent through principal
   divisors once Abel's theorem is accepted.
17. Multiply `[wp:wp':1]` by `z^3` and compute the projective limit at `O`.
18. Compute `Phi(-z)=[wp(z):-wp'(z):1]` and identify cubic reflection.
19. Compute the generic injectivity mechanism: equality of `wp` gives the
   generic `z` or `-z` ambiguity, and equality of `wp'` removes the `-z` case
   away from half-periods.
20. Substitute `y=mx+b` into the cubic, compare the `x^2` coefficient, and use
   Vieta's formula for the chord-tangent `x`-coordinate.
21. Compute the divisor of `ell/Z` on the cubic:
   `div(ell/Z)=[P]+[Q]+[R]-3[O]`.
22. Compute the Abel sum of the line divisor as `u+v+r`.
23. Solve `u+v+r=0`, compute `r=-(u+v)`, and use reflection to obtain
   `Phi(u+v)`.
24. Compute the Abel sum of `[P_1]+[P_2]-[S]-[O]` to get Jacobian addition:
   `([P_1]-[O])+([P_2]-[O])=[S]-[O]`.
25. Fill the final map-check table distinguishing direct calculations from
   named theorem inputs for complex Lie group isomorphisms.

## Coverage Matrix

| # | Review criterion | Exercise support | Solution support | Direct calculation | Named theorem input | Remaining weakness |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | Residues and integrals | 1.1-1.4, 4.1-4.2 | Solutions compute derivatives, parametrized integral, `df/f`, and residue sum | Yes | Residue theorem | None for the Big Picture |
| 2 | Euler characteristic and genus counts | 2.1, 2.4 | Solution computes `0=2-2g` and `1-2+1=0` | Yes | Classification formula `chi=2-2g` | None |
| 3 | Lattice representatives and quotient calculations | 3.1-3.4 | Solutions compute representative changes, `GL_2(Z)` inclusions, `Im(1/tau)`, translations | Yes | Quotient complex structure background | None |
| 4 | Elliptic-function periodicity | 4.2, 4.4 | Solutions pair parallelogram sides and compute `(F circ q)(z+lambda)` | Yes | Argument principle for 4.2 | None |
| 5 | Laurent expansions and pole orders of `wp`, `wp'` | 5.4, 7.3-7.5 | Solutions compute pole orders and use them in linear independence | Yes | Laurent expansions are stated inputs | None |
| 6 | Riemann-Roch dimension counts in genus one | 7.1, 7.4, 7.5 | Solutions substitute `n=1,2,3`, write divisor inequalities, and use dimensions | Yes, after theorem input | Genus-one Riemann-Roch | Expected theorem input |
| 7 | Divisor arithmetic and degree-zero calculations | 6.1-6.5, 10.4 | Solutions compute orders, products, inverses, degrees, quotient equality | Yes | Compact principal divisor degree theorem | None |
| 8 | Explicit principal-divisor Abel-sum calculations | 4.5, 8.5 | Solution 4.5 computes `a_1+a_2-b_1-b_2=0 mod Lambda`; 8.5 computes change by `div(f)` | Yes | Third elliptic Liouville law, Abel theorem in 8.5 | None |
| 9 | Descent from `Div^0` to `Pic^0` | 8.4, 8.5 | Solutions compute additivity and show principal divisors are killed | Yes, modulo theorem input | Abel theorem | Expected theorem input |
| 10 | Weierstrass map `Phi=[wp:wp':1]` | 5.5, 9.1, 9.5, 14.4 | Solutions compute cubic equation, projective limit, and the dictionary map | Yes | Global embedding theorem for bijectivity | None beyond named theorem |
| 11 | Generic injectivity calculation for `Phi` | 9.6 | Solution computes `wp(z)=wp(w)`, `wp'(z)=wp'(w)`, and removes generic `-z` ambiguity | Yes | Embedding theorem for half-periods and infinity | Expected theorem boundary is clearly stated |
| 12 | Parity `Phi(-z)=ominus Phi(z)` | 5.1, 5.2, 9.2, 9.4 | Solutions compute evenness, oddness, and homogeneous coordinates | Yes | None beyond `wp` definitions | None |
| 13 | Line-intersection and Vieta computations | 10.1-10.3 | Solutions compute limiting slope, Vieta sum, and vertical line intersections | Yes | Intersection multiplicity background | Edge cases are scoped appropriately |
| 14 | Explicit line divisor `div(ell/Z)` | 10.4 | Solution computes zeros of `ell|_E`, poles of `Z|_E`, and triple pole at `O` | Yes | Bezout/intersection multiplicity | Expected theorem input |
| 15 | Calculation `u+v+r=0` to chord-tangent addition | 10.5, 11.1, 11.4, 11.5 | Solutions compute Abel sum, solve `r=-(u+v)`, and reflect | Yes | Abel theorem and embedding theorem | None for the intended level |
| 16 | Final Jacobian addition via `[P_1]+[P_2]-[S]-[O]` | 14.5 | Solution computes Abel sum `z_1+z_2-(z_1+z_2)-0` and derives the class equality | Yes | Abel theorem | None |
| 17 | Meaning of complex Lie group isomorphism | 3.5, 14.4 | Solutions give checklist and map-check table separating calculations from named theorems | Partly direct | Holomorphic inverse/bijectivity theorem inputs | None; theorem boundary is explicit |

## Reconstruction Test

### `C/Lambda` as a complex Lie group

The student can reconstruct this from the cell count in Chapter 2 and the
quotient arithmetic in Chapter 3.  The exercises compute representative
independence of addition, lattice basis changes, period normalization,
translations, and the final complex Lie group checklist.  The complex structure
on the quotient is accepted from the text, which is appropriate for the target
level.

Verdict: reconstructible from exercises plus stated quotient background.

### `Pic^0(E)` as degree-zero divisor classes

The student can reconstruct this from Chapter 6 divisor arithmetic and Chapter
8 Abel-sum calculations.  The quotient criterion in `Div^0/Prin`, the descent
through principal divisors, and the role of Abel sums are directly exercised.
Exercise 4.5 now gives a concrete principal-divisor Abel-sum model before the
more abstract descent in Chapter 8.

Verdict: reconstructible with Abel's theorem accepted as named input.

### `E(C)` as the Weierstrass cubic

The student computes parity, pole orders, and the substitution
`x=wp(z)`, `y=wp'(z)` into the cubic equation.  Exercise 9.1 handles the
projective point at infinity, and Exercise 9.3 checks the repeated-root
singularity criterion by partial derivatives.

Verdict: reconstructible as the cubic image; global biholomorphism remains the
Weierstrass embedding theorem.

### `Phi=[wp:wp':1]`

The formula is repeatedly exercised: first as the cubic coordinate map, then as
the projective map to `CP^2`, then in the three-notation dictionary.  Exercise
9.6 adds a useful generic injectivity calculation and explicitly says which
cases still require the embedding theorem.

Verdict: reconstructible, with the global theorem boundary clear.

### Abel-Jacobi as the bridge

The student computes Abel sums of `[P]-[Q]`, `[P]+[Q]-2[O]`, arbitrary
degree-zero divisors, and principal divisors.  The student also computes the
Jacobian addition relation in Exercise 14.5.  This gives a strong calculation
route to `Pic^0(E)` as the same group.

Verdict: reconstructible with Abel's theorem accepted.

### Chord-tangent addition as transported torus addition

The student computes the line divisor `div(ell/Z)`, computes its Abel sum as
`u+v+r`, solves `r=-(u+v)`, and uses `Phi(-r)=ominus Phi(r)` to get
`Phi(u+v)`.  The vertical-line identity case is also projectively computed with
`X=xZ`.

Verdict: reconstructible by calculation, with Bezout/intersection multiplicity
and Abel's theorem accepted.

### Final complex Lie group meaning

Exercise 3.5 gives the abstract checklist, and Exercise 14.4 applies it to the
actual maps.  The solution distinguishes direct calculations from named theorem
inputs for holomorphicity, bijectivity, and addition compatibility.

Verdict: reconstructible at the correct level.

## Exercise/Solution Alignment Check

| Exercise | Statement check | Solution check | Alignment verdict |
| --- | --- | --- | --- |
| 4.5 | Requires explicit divisor `[a_1]+[a_2]-[b_1]-[b_2]` and Abel sum modulo `Lambda` | Computes `a_1+a_2-b_1-b_2 in Lambda` and `smap(div(f))=0` | Aligned |
| 7.4 | Requires membership, independence, dimension for `L(2O)` | Writes `div(1)+2[O]>=0`, `div(wp)+2[O]>=0`, independence, dimension | Aligned |
| 7.5 | Requires membership, pole-order independence, dimension for `L(3O)` | Writes three divisor inequalities and dimension argument | Aligned |
| 9.5 | Requires three notations and two identifying formulas | Gives torus, cubic, divisor-class notation and a three-node dictionary visual | Aligned |
| 9.6 | Requires generic injectivity calculation and exceptional cases | Computes equality of `wp`, `wp'`, rules out generic `-z`, and names half-period/infinity cases | Aligned |
| 10.4 | Requires computation of `div(ell/h)` with `h=Z` | Computes zeros from `ell|_E`, poles from `Z|_E`, and triple pole at `O` | Aligned |
| 10.5 | Requires Abel sum of line divisor and `P+Q+R=O` | Chooses preimages and computes `p+q+r-3*0=0 mod Lambda` | Aligned |
| 11.3 | Requires projective line `X=xZ` through `P` and `O` | Lists `P`, `ominus P`, `O` on `X=xZ` and reflects | Aligned |
| 14.4 | Requires map-check table and theorem/calculation distinction | Provides table with direct transport calculation and named theorem inputs | Aligned |
| 14.5 | Requires final dictionary and Abel sum of `[P_1]+[P_2]-[S]-[O]` | Computes zero Abel sum and derives Jacobian addition equality | Aligned |

## Remaining Weak Points

### Named theorem inputs remain necessary

Location: Exercises 7.4-7.5, 8.5, 9.6, 10.4, 14.4-14.5.

Why it matters: These are the deep mathematical steps behind the final
isomorphisms: Riemann-Roch, Abel's theorem, the global Weierstrass embedding
theorem, and Bezout/intersection multiplicity.

Classification: unavoidable theorem input for this textbook level, not a
calculation-design problem.

Recommended fix: no exercise-system repair is required.  Keep the current
theorem-boundary language.  A much longer book could add optional theorem-proof
projects, but that is outside the stated goal.

### Exercise 11.2 remains conceptual by design

Location: Exercise 11.2 and Solution 11.2.

Why it matters: It asks students to compare direct associativity on the cubic
with associativity on the torus.  This is useful for motivation, but it is less
calculation-heavy than the surrounding transport exercises.

Classification: minor calculation-design weakness, not blocking.

Concrete optional fix: add a prompt asking students to list the four line
constructions needed for the two bracketings:
`PQ`, `(P boxplus Q)R`, `QR`, and `P(Q boxplus R)`.  The current solution
already does this in prose, so the fix is optional.

### Some solution prose is intentionally concise

Location: Solutions 8.5, 10.5, 14.4.

Why it matters: These solutions use theorem inputs efficiently.  A student who
wants full proofs of Abel's theorem or the embedding theorem would need more
than exercise solutions.

Classification: unavoidable theorem input and pedagogical brevity, not a
current defect.

Concrete optional fix: add short "Named theorem used here" labels in the
solution appendix.  This would improve readability but is not necessary for
mathematical alignment.

## Final Verdict

The calculation exercise system is sufficient for the Big Picture, with named theorem inputs.

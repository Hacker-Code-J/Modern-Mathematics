# Referee Audit: Algebraic Geometry and Galois Theory

## Verdict

The chapter is ready for student distribution, with the explicit caveat that
the listed source-unclear items remain unresolved. The notes are mathematically
coherent, pedagogically readable, and source-honest.

## Scope

I audited `algebraic_geometry_notes_2026_06_06.tex` against the source PDF
where verification was needed, especially the pages covering the elliptic
curve, the map to `P^1`, the induced function-field inclusion, and the
quadratic Galois extension.

I also reviewed the later calculation-dense expansion, whose purpose is to
make the chapter studyable like a computation-heavy textbook section. Those
added computations are standard background or explanatory calculations, not
newly recovered handwritten source content.

## Mathematical Correctness

- Definitions are introduced before use, including field extensions, affine
  and projective varieties, coordinate rings, function fields, projective
  coordinates, and the elliptic curve notation.
- The Veronese examples are correct as set-theoretic image computations over
  `C`; the proofs handle the point at infinity cases.
- The projective Weierstrass cubic has the correct affine chart
  `y^2 = x^3 + ax + b` and the correct point at infinity `[0:1:0]`.
- The 180-degree torus picture is now explained as a quotient by an involution,
  not as an actual deformation of a torus into a sphere.
- The rational function `x = X/Z` correctly defines a morphism
  `E -> P^1` by the standard fact for nonsingular projective curves.
- The function-field direction is correct: the map `E -> P^1` induces the
  inclusion `C(x) = K(P^1) -> K(E)`.
- The elliptic curve function field is correctly described as
  `C(x)(y)` with `y^2 = x^3 + ax + b`.
- Under the nonsingularity hypothesis, `x^3 + ax + b` has distinct roots and
  is not a square in `C(x)`, so the extension has degree two.
- The Galois group over `C(x)` is correctly identified with `Z/2Z`, generated
  by `y -> -y`.
- The algebraic meaning of unchanged values under the 180-degree symmetry is
  now stated explicitly: invariant functions are the fixed field
  `K(E)^<iota^*> = C(x)`.

## Logical Order and Pedagogy

- The chapter now reads as a coherent path from field extensions to varieties,
  projective space, rational curves, elliptic curves, and Galois theory.
- Learning goals, prerequisites, notation, section summaries, exercises, and
  hints support independent reading.
- The diagrams are limited and mathematically accurate: they clarify the main
  route, the quotient `E/<iota> ~= P^1_C`, and the contravariant
  fixed-field inclusion.
- The invariant-function discussion now explicitly explains that invariant
  rational functions are constant on paired points and descend to the quotient
  curve.
- The exercise set is ordered from basic checks to the elliptic curve example,
  and the hints are accurate without introducing unsupported claims.

## Source Honesty

- Standard background not explicitly recovered from the handwriting is marked
  as prerequisites, explanatory background, standard background, or further
  reading.
- Unreadable diagrams and annotations are not reconstructed as facts.
- Existing `TODO: unclear from source, page X` markers are preserved.

## Correction Made During Audit

- Added one standard-background sentence explaining why the affine Weierstrass
  chart computes the function field of the projective elliptic curve.
- Added a source-honest explanation of the page 6 180-degree torus quotient
  picture: the torus is quotiented by an order-two symmetry, and the quotient
  is the Riemann sphere `P^1`.
- Added the corresponding invariant-field interpretation: checking quantities
  unchanged by the symmetry means taking fixed functions under the pullback
  action `iota^*(y) = -y`.
- Refined the diagram to show both `E -> E/<iota> ~= P^1_C` and
  `K(E)^<iota^*> = C(x) -> K(E)`.
- Added one exercise asking students to compute the invariant subfield
  directly from `K(E) = C(x) + C(x)y`.
- Added a referee-check clarification that invariant functions have the same
  value on paired points and therefore descend to rational functions on the
  quotient curve.
- During the calculation-integrity audit, refined the derivation of
  `K(E)=C(x)(y)` by explicitly identifying `C[x]` inside the affine coordinate
  ring, localizing to `C(x)`, using that `x^3+ax+b` is not a square in
  `C(x)`, and stating the unique representation `a(x)+b(x)y`.

## Substantial Calculation Upgrade

- Added explicit finite-extension computations for `C/R` and
  `Q(sqrt d)/Q`, including bases, coordinates, scalar multiplication, and
  multiplication matrices.
- Expanded coordinate-ring and function-field calculations for
  `V(y-x^2)` and `V(xy-1)`, including homomorphisms, kernels, quotient rings,
  and fraction fields.
- Added projective rescaling checks showing why homogeneous equations are
  well-defined and why nonhomogeneous equations are not.
- Expanded the quadratic and cubic Veronese examples with parameter recovery
  on affine charts and point-at-infinity calculations.
- Added step-by-step computations for the elliptic curve affine chart, the
  point at infinity, the sign involution, the reduction
  `K(E)=C(x)(y)`, the invariant-field calculation, and the Galois
  automorphism.
- Expanded the exercise set to 15 computation-focused exercises with concise
  hints, ordered from routine algebra to quotient, invariant-field, and
  Galois computations.

## Calculation-Integrity Audit

- The finite-extension computations for `C/R` and `Q(sqrt d)/Q` have the
  correct bases, coordinate columns, and multiplication matrices.
- The coordinate-ring computations for `V(y-x^2)` and `V(xy-1)` use correct
  homomorphisms, kernels, quotients, and fraction fields.
- The projective rescaling calculation correctly shows that `XZ-Y^2=0` is
  well-defined, and the `X+1=0` example correctly shows why nonhomogeneous
  equations do not define projective conditions.
- The quadratic and cubic Veronese computations correctly verify the defining
  equations, recover parameters on affine charts, and handle the points at
  infinity.
- The elliptic-curve calculations correctly dehomogenize the cubic, compute
  the point at infinity, and verify the involution `(x,y)->(x,-y)`.
- The function-field calculation now explicitly justifies the representation
  `K(E)=C(x)(y)=C(x)\oplus C(x)y`, which supports the invariant-field
  computation.
- The invariant-field and Galois computations are algebraically correct:
  `iota^*(a(x)+b(x)y)=a(x)-b(x)y`, invariance forces `b(x)=0`, and the
  nontrivial automorphism fixes `x` and sends `y` to `-y`.
- The exercise set and hints match the worked calculations and contain no
  mathematical errors found in this pass.
- The compiled PDF layout was inspected at the calculation-heavy pages and
  remains readable.

## Student-Simulation and Exercise-Solvability Pass

- The compiled PDF was read as a student-facing handout. The chapter is
  independently learnable for a student with the stated prerequisites: basic
  field theory, vector spaces, polynomial rings, and quotient rings.
- All 15 exercises are solvable using material already present before the
  exercise section; no new student-facing material was needed in the LaTeX
  chapter.
- Exercise 12.1 is supported by the field-extension definition and scalar
  multiplication discussion.
- Exercise 12.2 is supported by the `Q(sqrt d)/Q` multiplication-matrix
  computation.
- Exercises 12.3 and 12.4 are supported by the coordinate-ring computations for
  `V(y-x^2)` and `V(xy-1)`, including the relevant homomorphisms and fraction
  fields.
- Exercises 12.5 and 12.6 are supported by the projective rescaling and
  nonhomogeneous-equation counterexample.
- Exercises 12.7, 12.8, and 12.9 are supported by the quadratic and cubic
  Veronese examples, proofs, substitutions, chart computations, and
  point-at-infinity checks.
- Exercises 12.10 and 12.11 are supported by the elliptic-curve
  dehomogenization, point-at-infinity calculation, and sign-involution check.
- Exercise 12.12 is supported by the reduction rules `y^2=f(x)` and
  `y^3=f(x)y`.
- Exercises 12.13 and 12.14 are supported by the unique representation
  `a(x)+b(x)y`, the pullback action `iota^*(y)=-y`, and the Galois
  automorphism computation.
- Exercise 12.15 is supported by the invariant-function explanation: invariant
  rational functions are constant on paired points and descend to the quotient.
- No hints required strengthening, and no solution appendix was needed for the
  current exercise difficulty level.

## Worked-Solutions Companion

- Created a separate worked-solutions companion:
  `algebraic_geometry_notes_2026_06_06_solutions.tex`.
- The companion solves all 15 exercises with explicit calculations and is
  written to be read alongside the main lecture chapter.
- No correction to the main lecture notes was required while preparing the
  solutions.
- The solutions are standard pedagogical calculations and are not presented as
  newly recovered handwritten source content.

## Remaining Source-Unclear Items

- Page 1: illegible arrows in the operation diagram for field extensions.
- Page 2: quotient/local-chart drawings are not labeled precisely enough to
  reconstruct.
- Page 3: side annotations near the embedding `M -> P^N_C` remain unreadable.
- Page 6: the explicit torus-to-cubic map is not given; the 180-degree
  quotient picture is readable, but full branch or fixed-point data are not
  specified.
- Page 8: branch and ramification details for the two-to-one map are not
  specified.

## Remaining Mathematical Risks

- Branch and ramification data for `E -> P^1` are intentionally omitted because
  they are not present in the readable source.
- The torus-to-cubic map is recorded only through its image equation, since the
  formula is absent from the source; the quotient picture is included only at
  the level supported by the source and standard background.
- The introductory definitions of varieties use standard simplified
  conventions appropriate for lecture notes; a full scheme-theoretic treatment
  is outside the scope of the source.

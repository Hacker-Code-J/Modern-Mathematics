# Exercise Audit

## Big Picture Concept List

The exercise system should train a reader to reconstruct the following chain.

1. `T = C/Lambda` is a compact genus-one Riemann surface and a complex Lie
   group.
2. Elliptic functions are meromorphic functions on `T`.
3. Residues, zero-pole counts, and Abel sums constrain elliptic functions.
4. The Weierstrass functions `wp` and `wp'` have controlled poles and satisfy a
   cubic equation.
5. Divisors encode zeros and poles, and principal divisors have degree zero.
6. `Pic^0(E)` is the group of degree-zero divisor classes modulo principal
   divisors.
7. Riemann-Roch in genus one gives `ell(nO)=n`, especially the basis
   `1, wp, wp'` of `L(3O)`.
8. The map `Phi = [wp:wp':1]` identifies the torus with a smooth plane cubic.
9. Abel-Jacobi identifies degree-zero divisor classes with points of the torus.
10. A line divisor `[P]+[Q]+[R]-3[O]` converts collinearity into the group
    equation `P+Q+R=O`.
11. Chord-tangent addition is torus addition transported by `Phi`.
12. The cohomological and arithmetic chapters are secondary viewpoints, not
    prerequisites for the main transport theorem.

## Chapter Inventory Before Revision

The current manuscript has three exercises in each chapter, for 42 exercises.

| Chapter | Existing exercise role |
| --- | --- |
| 1 | Computes the winding form, its integral, and the local residue of `df/f`. |
| 2 | Computes genus from Euler characteristic, checks why compactness matters, and proves zeros/poles are finite. |
| 3 | Checks quotient addition, lattice basis changes, and the upper half-plane parameter. |
| 4 | Uses residue and argument-principle constraints for elliptic functions. |
| 5 | Checks parity of `wp` and `wp'`, then reads the cubic equation as algebraicity. |
| 6 | Computes one divisor on `CP^1`, checks principal divisors form a subgroup, and checks `[P]-[O]` has degree zero. |
| 7 | Computes `ell(O)`, `ell(2O)`, `ell(3O)`, checks `L(O)`, and compares pole orders of `1,wp,wp'`. |
| 8 | Computes Abel sums for simple divisors and uses Abel's theorem for injectivity. |
| 9 | Checks the point at infinity, parity under `z -> -z`, and smoothness via repeated roots. |
| 10 | Treats tangent lines, derives the affine `x`-coordinate formula, and handles vertical lines. |
| 11 | Locates Abel's theorem in the transport proof, discusses associativity, and checks the identity. |
| 12 | Checks invariance of `j`, the cohomological torus quotient, and special lattice symmetries. |
| 13 | Counts one finite-field example, interprets rational addition formulas, and states Hasse's bound. |
| 14 | Asks for a reflection explanation, a three-column dictionary, and chapter viewpoint placement. |

## Concept Coverage Matrix Before Revision

Legend: `I` introduces, `R` reinforces, `C` computes, `P` proves, `S`
synthesizes, `O` omitted or too weak.

| Concept | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Compact torus as complex Lie group | O | R | I/P | O | O | O | O | O | O | O | R | O | O | S |
| Elliptic functions as functions on the torus | O | R | O | I/P | R | O | O | O | O | O | O | O | O | S |
| Residue and zero-pole constraints | I/C | R | O | P | O | R | O | O | O | O | O | O | O | S |
| Abel sum constraints | R | O | O | I | O | O | O | P | O | O | P | O | O | S |
| `wp`, `wp'`, and the cubic equation | O | O | O | R | I/P | O | R | O | R | O | R | O | O | S |
| Divisors and `Pic^0` | O | O | O | R | O | I/P | R | P | O | R | R | R | O | S |
| Genus-one Riemann-Roch | O | R | O | O | O | O | I/C | O | R | O | O | O | O | S |
| Weierstrass embedding | O | O | O | O | R | O | R | O | I/P | O | R | O | O | S |
| Plane cubic group law | O | O | O | O | O | O | O | O | R | I/C | P | O | R | S |
| Transport theorem | O | O | R | R | R | R | R | R | R | R | P | O | O | S |
| Complex Lie group meaning of isomorphism | O | O | R | O | O | O | O | R | R | O | R | R | O | S |

## Dependency Map Before Revision

- Chapters 1--4 correctly build from residues to elliptic-function constraints.
- Chapter 5 uses Chapter 4's compactness and elliptic Liouville ideas, but the
  exercises do not force the student to derive the pole orders needed later.
- Chapter 7 depends on Chapter 5 pole orders, but its exercises only compare
  pole orders; they do not ask the student to connect `L(2O)` and `L(3O)` to
  the coordinates of `Phi`.
- Chapter 8 depends on Chapter 4's Abel sum and Chapter 6's divisor language.
  The existing exercises cover simple cases but do not build the group
  homomorphism `Pic^0(T) -> T` explicitly.
- Chapters 9--11 depend on Chapters 5, 7, and 8.  The existing exercises test
  local facts but leave the full proof chain mostly in exposition.
- Chapter 14 asks for synthesis, but the prior exercises do not give enough
  intermediate checkpoints for a student to reconstruct the theorem without
  reading the text closely.

## Reconstruction Test Before Revision

A student solving only the current exercises could reconstruct:

- the local meaning of residues as orders of zeros and poles;
- compactness as the reason holomorphic functions on compact surfaces are
  constant;
- the quotient group law on `C/Lambda`;
- the existence of zero-pole constraints for elliptic functions;
- parity of `wp` and `wp'`;
- basic divisor notation and the degree-zero condition;
- the formal shape of `L(nO)` in genus one;
- the reflection convention in the chord-tangent law;
- a rough dictionary among torus, Jacobian, and cubic viewpoints.

The same student probably could not reconstruct:

- why `wp` has exactly the pole data needed for `L(2O)` and `wp'` for `L(3O)`;
- how the Abel sum descends to a group map on `Pic^0`;
- why `P -> [P]-[O]` is both a group-compatible and holomorphic identification;
- how a line divisor gives `P+Q+R=O` in the transported group;
- the precise proof that chord-tangent addition equals torus addition;
- the meaning of `cong` as complex Lie group isomorphism in the final theorem.

## Gap Analysis

Missing computations:

- explicit Abel sums of principal divisors;
- pole order computations for `wp`, `wp'`, and simple monomials in them;
- the basis consequences `L(2O)=span(1,wp)` and
  `L(3O)=span(1,wp,wp')`;
- one full secant/tangent divisor computation leading to a group equation.

Missing proof steps:

- descent of elliptic functions to meromorphic functions on the quotient;
- homomorphism property of the Abel-Jacobi map;
- well-definedness of divisor classes under principal divisors;
- line divisor to Abel theorem to chord-tangent sum.

Missing translation exercises:

- translate a point `z in T` to `Phi(z) in E(C)` and to
  `[Phi(z)]-[O] in Pic^0(E)`;
- translate collinearity on the cubic into a principal divisor;
- translate the inverse map on the cubic into `z -> -z` on the torus.

Missing synthesis tasks:

- a final guided proof of the three-face theorem;
- an explicit statement of the category of isomorphism: complex Lie groups,
  not merely abelian groups;
- a checkpoint explaining which later topics are optional context rather than
  necessary for the main theorem.

## Direct Verdict Before Revision

The current exercise system is not sufficient for the Big Picture, because it
tests many individual definitions but does not force the student to assemble the
chain

`elliptic functions -> wp equation -> divisors -> Pic^0 -> Abel-Jacobi -> line divisor -> transported addition`.

The current system is a useful supplement to the exposition.  It is not yet a
self-standing route to the theorem.

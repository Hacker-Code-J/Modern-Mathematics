# Solution Appendix Review

## Scope

Reviewed `chapters/appendices/D_solutions.tex` against the 66 current chapter
exercises.  The review focused on mathematical correctness, logical continuity,
and whether the solutions support the Big Picture:

`C/Lambda cong Pic^0(E) cong E(C)` as complex Lie groups, with chord-tangent
addition transported by `[wp:wp':1]`.

## Corrections Made

- Expanded Exercise 1.1 from a verbal cancellation argument to an explicit
  exterior derivative computation.
- Tightened Exercise 2.3 so the compactness/isolation argument separately
  handles zeros and poles of a nonzero meromorphic function.
- Clarified Exercise 3.3 by tying the move to an orientation choice that places
  the lattice parameter in the upper half-plane.
- Corrected the logic of Exercise 4.1: the decisive contradiction for total
  pole order one is the nonzero residue of a single simple pole, not merely the
  zero-pole count.
- Added the boundary condition needed for the argument-principle proof in
  Exercise 4.2.
- Made Exercise 7.2 explicitly depend on the impossibility of total pole order
  one for nonconstant elliptic functions.
- Clarified that the secant/tangent cubic-root computation in Exercise 10.2
  counts roots with multiplicity.
- Rewrote Exercise 10.5 so the Abel sum of the line divisor is expressed as the
  identity without the confusing notation `P+Q+R-3O=O`.
- Clarified the chosen torus preimages in Exercise 11.1 and the special case
  `P=O` in Exercise 11.3.
- Added the usual exceptional cases to the finite-field addition explanation in
  Exercise 13.2.
- Strengthened Exercise 14.5 by showing that Jacobian addition agrees with
  `[Phi(z_1+z_2)]-[O]` via Abel's theorem.

## Result

The appendix is now logically aligned with the exercise sequence.  No numbering
mismatches were found.  The remaining concision is intentional: the solutions
are complete enough to check the exercise path, while the main chapters remain
responsible for longer proof sketches of Riemann-Roch, Abel's theorem, and the
global Weierstrass embedding.

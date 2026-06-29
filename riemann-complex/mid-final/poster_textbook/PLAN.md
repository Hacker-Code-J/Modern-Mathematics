# Plan -- Complex Tori, Jacobians, and Elliptic Curves

## Goal

Create a new, independent textbook that explains complex tori, Jacobians, and
elliptic curves through the midterm and final exam concepts: differential forms,
residues, compact Riemann surfaces, divisors, and Riemann--Roch.

The central theorem is:

> For a lattice `Lambda` in `C`, the complex torus `T = C/Lambda`, the Jacobian
> `Pic^0(E)`, and the smooth cubic
> `E: Y^2 Z = 4X^3 - g_2 XZ^2 - g_3 Z^3` are canonically isomorphic complex Lie
> groups, and the chord--tangent law on `E(C)` is torus addition transported by
> `z |-> [wp(z):wp'(z):1]`.

## Concept-to-textbook dependency map

| Concept block | Required concepts | Textbook chapters |
| --- | --- | --- |
| One object, three faces | quotient groups, Jacobians, projective cubics | 3, 8, 9, 14 |
| Analytic torus `C/Lambda` | lattices, quotient surfaces, periods | 2, 3 |
| Weierstrass function | elliptic functions, pole counting, Eisenstein constants | 4, 5 |
| Divisors and `Pic^0` | orders, principal divisors, Abel--Jacobi | 6, 8 |
| Riemann--Roch | genus one dimension counts, `L(nO)` | 7 |
| Embedding by `[wp:wp':1]` | `L(3O)`, cubic equation, smoothness | 5, 7, 9 |
| Chord--tangent law | line divisors, third intersection, reflection | 10, 11 |
| Cohomology and moduli | exponential sequence, `H/SL_2(Z)`, `j` | 12 |
| Finite field frontier | rational formulas, Hasse bound, Tate module | 13 |
| Final dictionary | synthesis across all faces | 14 |

## Chapter outline

1. Exam Background: Forms, Residues, and Global Obstructions
2. Compact Riemann Surfaces and Genus
3. Lattices and Complex Tori
4. Elliptic Functions on `C/Lambda`
5. The Weierstrass `wp`-Function
6. Divisors and Principal Divisors
7. Riemann--Roch in Genus One
8. Abel's Theorem and the Jacobian
9. The Weierstrass Embedding into `CP^2`
10. The Plane Cubic and Its Group Law
11. Why Chord--Tangent Equals Torus Addition
12. Cohomology, Moduli, and the `j`-Invariant
13. Finite Fields and Arithmetic Directions
14. Synthesis: The Three Faces of One Group

Appendices:

- A. Complex-analysis toolkit
- B. Exam-to-textbook bridge
- C. Notation glossary
- D. Solutions to exercises
- E. Sage/TikZ figure pipeline notes

## Midterm/final concept map

| Exam theme | Textbook use |
| --- | --- |
| Differential forms and Stokes | residues as global obstructions, compact residue theorem |
| Winding form and Cauchy--Green | prototype for logarithmic differentials and Abel sums |
| Euler characteristic of the torus | genus one and the shape of Riemann--Roch |
| Compact Riemann surfaces | source category for meromorphic functions and maps |
| Principal divisors have degree zero | first half of Abel's theorem |
| Riemann--Roch | dimension counts for functions with controlled poles |
| Double pole on a torus | existence and normalization of `wp` |
| Minimal polynomial of `wp'` | cubic equation defining `E` |

## Figure plan

Reuse existing local figures where they add real explanatory value:

- shared trinity diagram in Chapters 1 and 14.
- shared chord diagram in Chapters 10 and 11.
- shared exponential-sequence diagram in Chapter 12.
- Sage coordinate files from `../sagemath/` through the shared drawing macros.

No new precise numeric figure is needed for the first edition.  If a later
edition adds a precise geometric figure, create a Sage script and wire it into
the existing coordinate pipeline rather than hand-typing coordinates.

## Verification plan

1. Build from `poster_textbook/` with `pdflatex main.tex`.
2. Build a second time to resolve references.
3. Inspect the log for LaTeX errors, undefined references, and serious overfull
   boxes.
4. Record the final status in `CHANGES.md`.

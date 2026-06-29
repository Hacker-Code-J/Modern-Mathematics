# Textbook Plan — *Complex Tori and Elliptic Curves*

**Status:** Approved outline (Step 1). Hand this to the authoring agent.
**Source:** `../torus_elliptic_group_law_notes.tex` (2979 lines, 22 sections).
**Locked decisions:**
1. **Format:** `book` class, split into one file per chapter under `book/chapters/` (see file layout).
2. **Exercises:** every chapter has exercises with **full solutions collected in Appendix D**.

---

## 1. Goal

Expand the source notes into a complete, rigorous, self-contained textbook proving
the central claim:

> The chord–tangent law on a smooth plane cubic *is* the abelian group law on the
> complex torus `C/Λ`, transported to the cubic by the Weierstrass functions `℘` and `℘'`.

Do not modify the source `.tex`; treat it as reference material.

## 2. Reader model & prerequisites

- **Audience:** strong final-year undergraduate / first-year graduate.
- **Assumes:** single-variable complex analysis (holomorphic/meromorphic functions,
  Laurent series, residues, Liouville's theorem, the argument principle), point-set
  topology of quotients, elementary group theory and linear algebra.
- **Develops from scratch (genus-one case only):** Riemann surfaces, divisors,
  Riemann–Roch.

## 3. Part / chapter structure (22 source sections → 6 parts, 16 chapters)

| Ch | Title | Source §§ | Added beyond the notes |
|----|-------|-----------|------------------------|
| **Part I — Tori as Riemann Surfaces** | | | |
| 1 | Introduction & Overview | §1 | Reading guide, dependency diagram, main theorem stated up front |
| 2 | Lattices and the Complex Torus | §3.1–3.2 | Lattice equivalence/homothety, `τ=ω₂/ω₁`, explicit charts proving it is a Riemann surface |
| 3 | The Torus as Group and as Surface | §3.3–3.5 | Full `S¹×S¹` proof, genus/Euler-characteristic tie-in, topological vs. complex structure |
| **Part II — Elliptic Functions** | | | |
| 4 | Elliptic Functions & Liouville's Theorems | §4 | **Major expansion:** all three Liouville theorems (residue sum `=0`; #zeros `=` #poles; `Σzᵢ − Σpⱼ ∈ Λ`) — Abel later needs these |
| 5 | Divisors and the Degree-Zero Theorem | §5 | `Div(T)`, `Pic⁰`, the Abel-sum invariant as a map `Div⁰ → T` |
| **Part III — Riemann–Roch on Genus One** | | | |
| 6 | Riemann–Roch and Its Consequences | §6 | Careful statement (proof sketch + citation), dimension counts that force `1, ℘, ℘'` |
| **Part IV — The Weierstrass Functions** | | | |
| 7 | The Weierstrass `℘`-Function | §7 | Convergence proof, Eisenstein series `G_k`, full derivation of `℘'² = 4℘³ − g₂℘ − g₃`, discriminant `Δ ≠ 0` |
| 8 | The Embedding into `CP²` | §8, §9 | `Φ = [℘:℘':1]`, point at infinity `O=[0:1:0]`, isomorphism of Riemann surfaces, inverses ↔ reflection |
| **Part V — The Group Law on the Cubic** | | | |
| 9 | Abel's Sum Law | §10 | Both conditions proved, related back to Liouville III |
| 10 | Lines Cut Principal Divisors | §11 | Bézout / intersection multiplicity made precise, line at infinity |
| 11 | Transporting the Group Law (Why It's Forced) | §12, §19 | Merge: transport theorem + the "no arbitrary convention" argument |
| 12 | The Chord–Tangent Law in Cases | §13–§16 | Pictorial dictionary, identity, `P+Q`, `2P`, vertical lines, 2-torsion |
| **Part VI — Formulas, Computations, Synthesis** | | | |
| 13 | Explicit Coordinate Formulas | §17 | Full derivations of addition/doubling, all special cases |
| 14 | The Analytic Addition Formula | §18 | `℘(z+w)` identity, reflected-sign explanation |
| 15 | Worked Computations & Pitfalls | §20, §21 | Symbolic example + numeric run on `y²=4x³−4x`, `y²=x³+ax+b` comparison |
| 16 | Synthesis & Further Directions | §22 | Recap, then pointers: `j`-invariant, isogenies, torsion, curves over `Q`/`F_p`, modular forms |

**Appendices**
- **A — Complex-analysis toolkit:** Liouville / residues / argument principle / Laurent refresher.
- **B — Exam-to-lecture bridge:** §2 content relocated as reference.
- **C — The Sage→TikZ figure pipeline:** how `coords*.tex` is generated; reproducibility.
- **D — Solutions to all exercises** (full solutions, per decision 2).

## 4. Notation table (consolidates preamble macros + objects in play)

| Symbol | Macro | Meaning |
|--------|-------|---------|
| `C, R, Z` | `\C \R \Z` | number systems |
| `CP^n` | `\CP` | complex projective space |
| `H` | `\HH` | upper half-plane |
| `Λ = Zω₁ + Zω₂` | `\LambdaLat` | lattice; `τ = ω₂/ω₁ ∈ H` |
| `T = C/Λ` | — | complex torus; `O` = image of `0` = identity |
| `℘, ℘'` | `\wp \wpprime` | Weierstrass function and derivative |
| `g₂, g₃, Δ` | — | invariants; discriminant `g₂³ − 27g₃²` |
| `G_k` | — | Eisenstein series of weight `k` |
| `O, M` | `\OO \M` | holomorphic / meromorphic functions |
| `Div, Pic, Jac` | `\Div \Pic \Jac` | divisors, Picard, Jacobian |
| `div f, ord_p, Res, deg` | `\divisor \ord \Res \degdiv` | divisor of `f`, order, residue, degree |
| `L(D), ℓ(D)` | — | Riemann–Roch space and its dimension |
| `K` | — | canonical divisor (on `T`, `K = 0`) |
| `Φ` | — | the `℘`-embedding `T → E ⊂ CP²` |
| `E: Y²Z = 4X³ − g₂XZ² − g₃Z³` | — | the cubic; `⊕` = its group law, `+` = torus's |

**Action item:** keep `\divisor` (`\operatorname{div}`) distinct from `\degdiv`. The
preamble currently defines `\degdiv` as `\operatorname{deg}` — confirm whether it
should render differently from a plain `\deg`, and fix consistently.

## 5. Figure plan — reuse vs. create

**Reuse as-is (already inline; relocate to the right chapter):**

| Existing figure (source line) | Chapter |
|---|---|
| dependency flow diagram (263) | 1 |
| lattice (385), fundamental domain w/ side IDs (460) | 2 |
| torus parallelogram group law (536) | 3 |
| `℘`-shape (995) | 7 |
| projective map (1183) | 8 |
| reflection figures (1379, 1403) | 8 |
| pictorial dictionary (1707), identity (1836), `P+Q` (1913), `2P` (2004) | 12 |
| chord (2158), tangent (2254), vertical (2350), two-torsion (2401) | 12 |

**Sage assets already built but unused in the notes — wire these in (high value):**

- `07_branched_cover.sage` + `10_sphere_render.sage` → **Ch 8**: degree-2 branched
  cover `T → CP¹` via `℘` (four branch points = 2-torsion).
- `11_correspondence.sage` → **Ch 11/12**: torus-square ↔ cubic correspondence.
- `09_torus_markers.sage` → **Ch 5**: a divisor (zeros/poles) drawn on the torus.

**New figures to create (via the Sage pipeline, not hand-typed coordinates):**

- **N1** lattice homothety / equivalence classes (Ch 2) — extend `01_lattice.sage`.
- **N2** genus-one handle + Euler-characteristic cell decomposition (Ch 3) — likely pure TikZ.
- **N3** fundamental parallelogram annotated with zeros⊖poles for Liouville III (Ch 4) — new `13_liouville.sage`.
- **N4** recap "big picture" diagram for Ch 16 (pure TikZ; expand the §22 takeaway).

**Rule:** new figures requiring precise geometry get a new `sagemath/NN_name.sage`
wired into `sagemath/build_coords.sh`. Never hand-type coordinates.

## 6. Exercises

4–8 per chapter, graded easy → hard, **full solutions in Appendix D**. Theme seeds:

- Ch 2 — verify lattice axioms/charts, count fundamental domains.
- Ch 4 — prove the Liouville theorems, residue sums.
- Ch 6 — compute `ℓ(D)` for small divisors `D`.
- Ch 7 — Eisenstein recurrences, derive `Δ`.
- Ch 12–13 — hand-compute `P⊕Q` and `2P` on `y²=4x³−4x`, check against the Sage
  sample points in `sagemath/coords_curve_sample.tex`.

## 7. File layout

```
book/
  PLAN.md             % this file
  main.tex            % documentclass{book}; shared preamble; \input chapters
  preamble.tex        % macros + theorem envs + keyidea, lifted from the notes
  chapters/
    01_intro.tex ... 16_synthesis.tex
    appendix_A.tex ... appendix_D.tex
  CHANGES.md          % running per-chapter status log
sagemath/             % existing pipeline, extended (13_liouville.sage, etc.)
```

`main.tex` reuses the source preamble verbatim where possible: amsthm theorem
environments, the `keyidea` box, the color palette (`formteal`, `formgold`, …),
and `\input{sagemath/coords*.tex}` for figures.

## 8. Working method (for the authoring agent)

1. This plan is the approved Step-1 outline — no need to re-plan; you may refine
   chapter internals.
2. Implement **one chapter at a time**. After each: run `pdflatex` twice (and
   `sagemath/build_coords.sh` if a Sage script was added), fix all errors, then
   report what was written, compile status, and page/word count.
3. Log each chapter's status in `book/CHANGES.md`.
4. Compile cleanly with `pdflatex` (zero errors; no overfull boxes > 5pt; no
   undefined refs). Load `cleveref` for cross-references.
5. Do not refactor or delete the source notes. Never invent theorems — if unsure a
   claim is true, flag it rather than assert it.
6. Ask before adding external packages beyond what the source preamble already uses.

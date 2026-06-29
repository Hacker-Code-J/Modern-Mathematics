# CHANGES

## 2026-06-15

- Created a new independent textbook project in `poster_textbook/`.
- Added `main.tex`, `preamble.tex`, `README.md`, `PLAN.md`, fourteen chapter
  files, and five appendices.
- The first edition covers the subject from the exam background through the
  analytic, geometric, algebraic, cohomological, moduli, and arithmetic
  viewpoints.
- Existing `book/` and `poster/` sources were not modified.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice after the
  final edit.
- Output: `main.pdf`, 55 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  fatal errors, or errors.

## 2026-06-15 standalone-textbook revision

- Reworked the title, preface, part title, chapter prose, synthesis theorem, and
  exercises so the PDF reads as a standalone textbook rather than as commentary
  on a poster.
- Moved the notation glossary into front matter immediately before the table of
  contents as `chapters/00_notation.tex`.
- Removed the duplicate notation appendix.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 55 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  fatal errors, or errors.

## 2026-06-15 big-picture front matter

- Added `chapters/00_big_picture.tex` before the notation list.
- The new front-matter chapter states the final object to understand, the three
  presentations \(\C/\Lambda\), \(\Pic^0(E)\), and \(E(\C)\), and the proof
  route through tori, elliptic functions, divisors, Riemann--Roch, and line
  intersections.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 57 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  fatal errors, or errors.

## 2026-06-15 monochrome figures

- Remapped the shared figure palette in `preamble.tex` to black/gray so imported
  TikZ diagrams and generated Sage figures render in a classic monochrome
  textbook style.
- Replaced the poster-style trinity, chord, and exponential-sequence figures with
  local clean TikZ macros: `\classicTrinityDiagram`, `\classicChordDiagram`, and
  `\classicExpSequenceDiagram`.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 57 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  fatal errors, or errors.

## 2026-06-15 clarify isomorphism category

- Clarified in the Big Picture that the three-way isomorphism is meant in the
  category of complex Lie groups: the maps are both biholomorphic and compatible
  with the group laws.
- Updated the final Three-face theorem and exam bridge to distinguish this from
  a weaker abstract abelian-group isomorphism.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 57 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  fatal errors, or errors.

## 2026-06-15 chapter-only structure

- Removed all `\part{...}` divisions from `main.tex`.
- The book now presents a single linear sequence of chapters, followed by
  appendix chapters, so the table of contents is not broken into large part
  blocks.
- Tightened the Chapter 3 torus illustration label spacing so the chapter-only
  layout builds without page-fill warnings.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 49 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 solution appendix TikZ visualizations

- Added ten compact monochrome TikZ diagrams to
  `chapters/appendices/D_solutions.tex`.
- Inserted solution-side visual support for the winding form, torus
  side-identification, quotient translation, Abel sum, Riemann--Roch pole-order
  ladder, Abel-Jacobi descent to `Pic^0`, torus inverse/cubic reflection, line
  divisor, transported chord--tangent addition, and the final
  `C/Lambda`--`E(C)`--`Pic^0(E)` dictionary.
- Kept the figures schematic and classical: no color, no new packages, thin
  lines, and labels tied directly to the surrounding solution steps.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 55 pages.
- Rendered representative appendix pages containing the diagrams and inspected
  readability.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 remove Appendix D

- Removed the Appendix D input from `main.tex`.
- Deleted the now-unused `chapters/appendices/E_figure_pipeline.tex` source
  file, which contained the Sage/TikZ figure pipeline notes.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 47 pages.
- Confirmed the book sources and extracted PDF text contain no remaining
  Appendix D or figure-pipeline appendix entries.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 professional title page

- Replaced the default `book` class title output with a custom monochrome title
  page using centered classical typography, horizontal rules, and a concise
  statement of the book's mathematical focus.
- Added PDF title and subject metadata through the existing `hyperref` setup.
- Reworded the title-page description to remove the phrase "a self-contained
  account of the equivalence" and use a more direct mathematical statement.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 47 pages.
- Rendered the first page to an image and inspected the title-page spacing and
  legibility.
- Confirmed `pdfinfo` reports the new title and subject metadata.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 twelve-week syllabus

- Added `chapters/00_syllabus.tex` as a front-matter syllabus after notation.
- Organized the book as a twelve-week, three-month course with one two-hour
  lecture per week.
- Included course aims, a suggested lecture format, a week-by-week reading plan,
  and an exercise/assessment structure.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 49 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 syllabus redesign

- Reorganized the syllabus from a plain list into a more varied course handout:
  course-at-a-glance box, lecture-rhythm table, learning outcomes, module map,
  four weekly-road-map tables, assessment table, and a closing key idea.
- Added the standard `array` package and a ragged-right table column type for
  clean paragraph columns in syllabus tables.
- Allowed ragged page bottoms in front matter and restored flush-bottom layout
  for the main chapters, so table-heavy front-matter pages do not create
  page-fill warnings.
- Adjusted section order and page breaks so headings stay attached to their
  corresponding tables.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` until outlines and
  references were stable.
- Output: `main.pdf`, 51 pages.
- Rendered representative syllabus pages and inspected table readability and
  heading placement.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 professional course-guide syllabus

- Replaced the decorated syllabus handout with a calmer textbook-style
  `Course Guide`.
- Organized the syllabus into an aim statement, prerequisites table,
  four-module course-structure table, single weekly lecture-plan table, written
  work table, and a short final target.
- Clarified in the course aim that
  \(\C/\Lambda\cong\Pic^0(E)\cong E(\C)\) means isomorphism of complex Lie
  groups.
- Removed the earlier boxed overview and fragmented week-by-week blocks from
  the syllabus source.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 49 pages.
- Rendered the two course-guide pages and inspected spacing, hierarchy, and
  table readability.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 exercise-system audit and repair

- Added `EXERCISE_AUDIT.md` with a Big Picture concept list, chapter inventory,
  coverage matrix, dependency map, reconstruction test, gap analysis, and
  pre-revision verdict.
- Added `EXERCISE_IMPROVEMENT_PLAN.md` with chapter-by-chapter exercise repair
  targets.
- Added 24 exercises across Chapters 1--14, increasing the exercise count from
  42 to 66.
- Added matching solution entries in `chapters/appendices/D_solutions.tex` for
  every new exercise.
- Added `EXERCISE_REVIEW.md` with an independent post-revision assessment and a
  sufficient-for-the-Big-Picture verdict.

Big Picture gaps filled:

- Added exercises connecting residues to degree-zero principal divisors.
- Added exercises on the complex Lie group meaning of the final isomorphisms.
- Added descent/ascent exercises for elliptic functions on `C/Lambda`.
- Added pole-order and Riemann--Roch basis exercises for `wp`, `wp'`,
  `L(2O)`, and `L(3O)`.
- Added divisor-class, Abel-Jacobi, and `Pic^0` quotient exercises.
- Added line-divisor and transported-addition exercises leading to the
  chord--tangent law.
- Added final synthesis exercises naming the maps and comparing torus, cubic,
  and divisor-class notation.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 53 pages.
- Confirmed the revised exercise count is 66 and solution numbering runs
  through the corresponding entries.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 solution appendix review and TikZ prompt

- Reviewed `chapters/appendices/D_solutions.tex` for correctness, logical
  continuity, and alignment with the revised exercise sequence.
- Expanded and corrected solution explanations where the previous wording was
  too terse or potentially misleading, especially the winding-form derivative,
  the total-pole-order argument for elliptic functions, the line-divisor
  Abel-sum step, and the final Jacobian addition dictionary.
- Added `SOLUTION_APPENDIX_REVIEW.md` documenting the review scope and
  corrections.
- Added `TIKZ_VISUALIZATION_PROMPT.md`, a reusable autonomous Codex prompt for a
  future classic monochrome TikZ visualization pass.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 53 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 full solution visualization pass

- Added a compact `smallvisual` TikZ style in `preamble.tex` for dense
  solution-side diagrams.
- Expanded `chapters/appendices/D_solutions.tex` so every one of the 66
  numbered solution entries has a nearby monochrome TikZ picture.
- Added 56 new pictures beyond the 10 previously inserted diagrams, covering
  local residue computations, compactness arguments, lattice representatives,
  divisor bookkeeping, Riemann--Roch dimension and pole-order checks,
  Abel-Jacobi descent, Weierstrass coordinates, chord--tangent proof steps,
  cohomology/moduli summaries, finite-field counts, and final dictionary maps.
- Kept the figures schematic, black-and-white, and compact; no new LaTeX
  packages were introduced.

Verification:

- Confirmed `chapters/appendices/D_solutions.tex` has 66 solution entries and
  66 TikZ pictures.
- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice after the
  final edits.
- Output: `main.pdf`, 61 pages.
- Rendered representative solution appendix pages, including the beginning,
  middle, and final synthesis pages, and adjusted crowded labels.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 calculation-first exercise revision

- Rewrote exercise prompts across Chapters 5 and 8--14 so the Big Picture is
  tested through explicit calculations rather than broad verbal explanation.
- Required concrete outputs: direct substitutions, lift computations modulo
  \(\Lambda\), Abel sums, divisor coefficient sums, limiting slopes, Vieta
  coefficient comparisons, cohomology quotient checks, scaling weights,
  finite-field tables, and proof checklists.
- Updated `chapters/appendices/D_solutions.tex` so the affected solutions show
  the new calculation steps explicitly.
- Updated `EXERCISE_IMPROVEMENT_PLAN.md` and `EXERCISE_REVIEW.md` with the
  calculation-first design rule and a calculation coverage table.

Verification:

- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 63 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 calculation-gap repair pass

- Implemented the recommendations from `CALCULATION_EXERCISE_REVIEW.md`.
- Revised Exercise 4.5 to use the explicit principal-divisor Abel-sum
  calculation
  \([a_1]+[a_2]-[b_1]-[b_2]\mapsto a_1+a_2-b_1-b_2\).
- Added Exercise 9.6, a generic injectivity calculation for the Weierstrass map
  that explains how \(\wp'\) removes the \(z\) versus \(-z\) ambiguity while
  naming the half-period and point-at-infinity cases left to the embedding
  theorem.
- Revised Exercise 10.4 so students compute
  \(\divisor(\ell/Z)=[P]+[Q]+[R]-3[O]\) directly.
- Revised Exercise 11.3 to use the projective line \(X=xZ\) through
  \(P=(x,y)\) and \(O=[0:1:0]\).
- Revised Exercises 14.4 and 14.5 to add a map-check table and a final
  Jacobian-addition Abel-sum calculation.
- Strengthened the matching solutions, including the divisor inequalities for
  \(L(2O)\) and \(L(3O)\), the corrected Exercise 9.5 dictionary visual, and a
  new diagram for Exercise 9.6.
- Updated `CALCULATION_EXERCISE_REVIEW.md`, `EXERCISE_REVIEW.md`, and
  `EXERCISE_IMPROVEMENT_PLAN.md` to reflect the repaired calculation path and
  remaining named theorem inputs.

Verification:

- Confirmed the exercise system now has 67 exercise statements, 67 solution
  entries, and 67 solution-side TikZ pictures.
- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 65 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

## 2026-06-15 exercise intent annotations

- Added a reusable `\exerciseintent{...}` macro in `preamble.tex` for compact
  gray intent notes before exercises.
- Inserted visible intent notes immediately before all 67 chapter exercises.
- Kept the annotations short and calculation-oriented so each problem states
  what mathematical skill or Big Picture connection it is training.

Verification:

- Confirmed every `\begin{exercise}` in `chapters/*.tex` is immediately
  preceded by an `\exerciseintent{...}` line.
- Built from `poster_textbook/` with
  `pdflatex -interaction=nonstopmode -halt-on-error main.tex` twice.
- Output: `main.pdf`, 67 pages.
- Final log scan found no LaTeX warnings, undefined references, overfull boxes,
  underfull boxes, fatal errors, or errors.

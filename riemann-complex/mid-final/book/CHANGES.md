# CHANGES — authoring log

Per-chapter status for the textbook build (see `PLAN.md`). Update one row when a
chapter moves from stub → drafted → compiled-clean. Record page/word count and
any flagged issues.

**Review-driven revision pass (post-draft).** Acting on the philosophical review:
(1) Ch 6 restructured so the dimension counts ℓ(O)=ℓ([a])=1, ℓ(nO)=n are derived
*elementarily* (new Prop 6.3 `prop:rr-counts`, from Ch 4 Liouville + the explicit
℘,℘′), with Riemann–Roch (Thm 6.6) demoted to the general theorem and genuinely
used only for the converse of Abel / Pic⁰≅T (Cor 6.8), which Rem 6.9 flags as the
one place needing existence machinery and off the critical path; count-citations
in Ch 8/10/15/16 + App B/D rerouted to `prop:rr-counts`. (2) Ch 7 Thm 7.11
generation: even-case hand-wave replaced by a full proof (even functions have even
order at 2-torsion, matching the double zero of ℘−eᵢ). (3) Ch 1 reading guide:
Part IV graduate-level signpost. (4) Ch 9: load-bearing period computation
restored to the necessity proof.

**σ-function pass (full self-containment).** Added §7.7 "The σ-Function and the
Converse of Abel" (Def 7.12 σ; Prop 7.13 convergence/odd/simple-zeros; ζ=σ′/σ with
ζ′=−℘; Prop 7.14 quasi-periodicity σ(z+ωₖ)=−σ(z)exp(ηₖ(z+ωₖ/2)); Rem 7.15 Legendre;
**Thm 7.16 converse of Abel constructively** via F=∏σ(z−aᵢ)/∏σ(z−bᵢ); Rem 7.17). All
identities verified numerically (truncated-lattice ζ′=−℘, σ odd, quasi-periodicity,
F(z+ωₖ)/F(z)=1). Rewired Ch 6 Cor 6.8 to use Thm 7.16 (dropping prop:rr-dims), and
rewrote Rem 6.9 + Ch 6 intro/summary + Ch 9 sufficiency/remark so Riemann–Roch is
now pure enrichment, needed nowhere. **Epistemic status: every load-bearing result
is now proved within the book; nothing is cited-not-proved.** Book 124 pp, compiles
clean (0 overfull, 0 undefined, 0 warnings, 0 ??).

**Publication-readiness pass.** (1) Bibliography: manual `\thebibliography` (9
entries, pdflatex-only) added in `\backmatter`; inline mentions in Ch 6, Ch 16,
App A converted to `\cite`. (2) Preface added (front matter): thesis, audience,
self-containment, how-to-read. (3) List of Symbols added (front matter): grouped
two-column table. (4) Consistency audit — found and fixed a real notation clash:
`\sigma` meant both the Weierstrass σ-function (Ch 7) and the Abel–Jacobi sum map
(Ch 5); renamed the latter to `\smap` (𝔰), `\bar\smap`, across Ch 5/6/9 + App D
(labels untouched). Terminology otherwise consistent (two-/three-torsion uniform;
fundamental vs period parallelogram is an intentional origin-vs-translated
distinction; affine x / projective X correct); no hard-coded cross-refs, no
doubled-word typos. Book now 129 pp, compiles clean (0 overfull, 0 undefined, 0
undefined citations, 0 warnings, 0 ??).

| Ch / Appx | File | Status | Pages | Notes |
|-----------|------|--------|-------|-------|
| Scaffold | `main.tex`, `preamble.tex` | done | — | book class; preamble lifted from source notes; `\sagedir=../sagemath` |
| Theorem infra | `preamble.tex` | done | — | shared per-chapter counter via `thmtools` `sibling=`; cleveref names each type correctly (`proposition 2.3`, not `theorem 2.3`); `warning` declared as `warningthm` (reserved `\@warning`) and `\let`-aliased so it joins the shared sequence; `exercise` on own per-chapter counter; both named via `\crefname` |
| 1 Introduction & Overview | `chapters/01_intro.tex` | **drafted** | ~6 | motivation, Thm 1.1 stated up front, dependency Fig 1.1, reading guide, standing notation, 4 exercises; compiles clean, all crefs resolve |
| 2 Lattices & the Complex Torus | `chapters/02_lattices.tex` | **drafted** | ~7 | lattices, fundamental domain (Fig 2.1), GL₂(ℤ) basis change, period ratio τ, homothety + moduli ℍ/SL₂(ℤ), gluing (Fig 2.2), explicit charts → Thm 2.10 (compact Riemann surface); 5 exercises; compiles clean |
| 3 Torus as Group & Surface | `chapters/03_torus_group_surface.tex` | **drafted** | ~7 | group law well-def (Fig 3.1), complex Lie group + simply-transitive translations, S¹×S¹ iso (topological only, Warning 3.6), CW structure → χ=0, g=1 (Fig 3.2 new pure-TikZ), topological vs complex layer; 5 exercises; compiles clean |
| 4 Elliptic Functions & Liouville | `chapters/04_elliptic_liouville.tex` | **drafted** | ~8 | major expansion: differential field of elliptic fns; Liouville I (no nonconstant holo); period-parallelogram contour (Fig 4.1 new pure-TikZ) + cancellation lemma; Thm 4.5 residue sum=0 → order≥2; Thm 4.7 valence (N-to-1); Thm 4.8 Abel relation Σzeros−Σpoles∈Λ (full ∮ z f'/f proof); 5 exercises; compiles clean |
| 5 Divisors & Degree-Zero | `chapters/05_divisors.tex` | **drafted** | ~6 | orders (coord-independent), Div(X)+degree, Prin subgroup, Thm 5.5 deg div(f)=0 (residue of df/f), linear equiv + Pic⁰; Abel–Jacobi σ:Div⁰(T)→T kills principals (Thm 4.8) → Thm 5.9 Pic⁰(T)≅T (surjectivity proved, injectivity deferred); 5 exercises; added `\Prin` macro; compiles clean |
| 6 Riemann–Roch | `chapters/06_riemann_roch.tex` | **drafted** (revised) | ~7 | L(D) props (Prop 6.2); **elementary counts ℓ(O)=ℓ([a])=1, ℓ(nO)=n (Prop 6.3)** from Ch 4 + ℘,℘′, no RR; canonical K~0 (Prop 6.5); RR as general theorem (Thm 6.6) + arbitrary-D dims (Prop 6.7); **Cor 6.8 converse of Abel → Pic⁰(T)≅T**, with Rem 6.9 scoping it as the one genuine RR use, off the critical path; ℓ(nO)=n forces 1,℘,℘'; Rem 6.10 cubic from L(6O); 5 exercises; compiles clean |
| 7 Weierstrass ℘ | `chapters/07_weierstrass_wp.tex` | **drafted** | ~9 | full convergence (Lem 7.2 lattice-sum + M-test, Prop 7.4), rigorous periodicity/evenness, Eisenstein G_m + Laurent (Prop 7.6), **Thm 7.7 ℘'²=4℘³−g₂℘−g₃ derived** (g₂=60G₄,g₃=140G₆), roots e_i + Δ≠0 (Prop 7.8/Cor 7.10), 2:1 branched cover (Fig 7.1 — uses `10_sphere_render`), field generation ℂ(℘,℘') (Thm 7.11, even-case now proved in full via even-order-at-2-torsion); **§7.7 σ-function + constructive converse of Abel (Thm 7.16)**; 7 exercises; compiles clean |
| 8 Embedding into CP² | `chapters/08_embedding.tex` | **drafted** | ~8 | Φ=[℘:℘':1] lands on E (Prop 8.1, Fig 8.1), extension Φ(O)=[0:1:0] holo (Prop 8.2), O smooth flex w/ mult-3 line at ∞ (Prop 8.3), L(3O) embedding + E smooth RS, fiber lemma 8.4 → **Thm 8.5 Φ biholomorphism** (analytic half of Main Thm), inverse=reflection (Fig 8.2) + 2-torsion; 5 exercises; added `\id` macro; compiles clean |
| 9 Abel's Sum Law | `chapters/09_abel.tex` | **drafted** | ~5 | full principal-divisor criterion (Thm 9.1, iff): necessity recaps contour proof (Thm 4.8/5.5), sufficiency cites Cor 6.6 / Pic⁰≅T; Prin(T)=ker(deg,σ); three-point form Cor 9.3 ([p]+[q]+[r]−3[0] principal ⟺ p+q+r≡0); 5 exercises; compiles clean |
| 10 Lines Cut Principal Divisors | `chapters/10_lines_divisors.tex` | **drafted** | ~6 | ℓ/Z as function on E, intersection mult (Def 10.1), Bézout line·cubic=3 proved directly (Prop 10.2), div₀(Z|E)=3O (Prop 10.3), div(ℓ/Z)=P+Q+R−3O (Thm 10.4); **Thm 10.5 collinear ⟺ P+Q+R−3O principal ⟺ ⊕-sum=O** (converse via L(3O)=⟨1,℘,℘'⟩); 5 exercises; compiles clean |
| 11 Transporting the Group Law | `chapters/11_transport.tex` | **drafted** | ~5 | merge §12+§19: transported law ⊕ (Def 11.1) vs chord–tangent ⊞ (Def 11.2); **Thm 11.3 ⊕=⊞** (group half of Main Thm) via Thm 10.5; forced-by-3-facts logic; **Prop 11.4 law intrinsic to (E,O)**, assoc. free from ℂ; 5 exercises; compiles clean |
| 12 Chord–Tangent in Cases | `chapters/12_chord_tangent_cases.tex` | **drafted** | ~7 | pictorial dictionary + 4 cases (chord/tangent/vertical/2-torsion), each an instance of P+Q+R=O; 5 Sage figures reused verbatim (Fig 12.1 overview, 12.2 3-panel correspondence — wires in `11_correspondence`, 12.3 tangent, 12.4 vertical, 12.5 2-torsion); E[2]≅(ℤ/2)²; 4 exercises (Vieta setup for Ch 13); compiles clean |
| 13 Coordinate Formulas | `chapters/13_coordinate_formulas.tex` | **drafted** | ~6 | addition formula (Thm 13.1) + doubling (Thm 13.2) full Vieta derivations, degenerate-cases table, **Prop 13.3 law is algebraic → E(k) a group for any field, Δ≠0** (Rem 13.4 arithmetic gateway), worked 2P example on y²=4x³−4x (Python-verified); 5 exercises; added `\Q,\F` macros; compiles clean |
| 14 Analytic Addition Formula | `chapters/14_analytic_addition.tex` | **drafted** | ~5 | **Thm 14.1 ℘ addition formula proved independently** (via h=℘'−A℘−B, Abel + ODE, Vieta), agreement with chord law, reflected y-sign from oddness of ℘'; Prop 14.2 determinant form; Cor 14.3 duplication = geometric doubling; 5 exercises; compiles clean |
| 15 Worked Computations & Pitfalls | `chapters/15_worked_pitfalls.tex` | **drafted** | ~5 | full symbolic chord computation; **exact numeric example** P⊕Q=(−24/25,−28√6/125) on y²=4x³−4x (sympy-verified); Prop 15.1 y=2Y → standard y²=x³+ax+b (a=−g₂/4,b=−g₃/4), explains the ¼; 7-item pitfalls checklist (+Δ≠0); 5 exercises incl. sympy-verified associativity (P⊕Q)⊕S=(49,280√6); compiles clean |
| 16 Synthesis & Further Directions | `chapters/16_synthesis.tex` | **drafted** | ~6 | 10-step complete chain (cross-ref'd); **Fig 16.1 three views** (analytic/geometric/algebraic, new pure-TikZ); further directions: j-invariant+moduli, isogenies+torsion E[n]≅(ℤ/n)², E(ℚ) Mordell–Weil + E(𝔽ₚ) Hasse, modular forms+modularity; reading list; 4 exercises (j=1728, torsion, weights, E(𝔽₅)≅ℤ/6); compiles clean |
| A Complex-Analysis Toolkit | `chapters/appendix_A.tex` | **drafted** | ~3 | reference: holo/meromorphic + Laurent/order/residue, Liouville + max-modulus, residue thm (plane + compact), argument principle/winding; cross-ref'd to uses |
| B Exam-to-Lecture Bridge | `chapters/appendix_B.tex` | **drafted** | ~2 | source §2 relocated; midterm (forms/Stokes, χ=0→g=1) + final (RR, deg div=0, ℘ ODE) lineage, each cross-ref'd |
| C Sage→TikZ Pipeline | `chapters/appendix_C.tex` | **drafted** | ~3 | 12-script table, `\drawprecise*` macros, build_coords.sh, `\input` lines, regeneration steps |
| D Solutions to Exercises | `chapters/appendix_D.tex` | **drafted** | ~14 | full solutions for all 16 chapters (§D.1–D.16), ~75 exercises |

## Open action items (from PLAN.md)
- Resolve `\degdiv` vs. plain `\deg` rendering in the preamble.
- Decide whether figures N2 (genus/handle) and N4 (recap diagram) go through Sage
  or stay pure TikZ.

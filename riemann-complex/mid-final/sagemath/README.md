# SageMath computations for TikZ figures

This folder contains SageMath scripts that compute precise coordinates
for figures in `torus_elliptic_group_law_notes.tex`.

Each script:
- defines the geometry (lattice, curve, special points),
- performs symbolic + numerical computation in SageMath 9.5,
- writes a LaTeX `\newcommand`-style snippet to `coords.tex`
  that the main `.tex` file inputs.

## Files

| Script | Computes |
|---|---|
| `01_lattice.sage` | Basis vectors of a lattice, a few translates, fundamental cell. |
| `02_torus_group_law.sage` | Points $[u]$, $[v]$, $[u+v]$ inside / outside the fundamental parallelogram. |
| `03_elliptic_curve.sage` | Cubic $y^2 = 4x^3 - g_2 x - g_3$ with three real roots; sampled points on both branches. |
| `04_chord_tangent.sage` | Given $P, Q$ on the curve, computes the third intersection $R$ and $P+Q=-R$. |
| `05_tangent_double.sage` | Tangent line at $P$, second meet $R$, and $2P=-R$. |
| `06_two_torsion.sage` | Three nonzero $2$-torsion points (roots of $4x^3-g_2x-g_3$). |
| `07_branched_cover.sage` | Lattice ramification points, $\wp$-images $(e_1,e_2,e_3,\infty)$. |
| `build_coords.sh` | Runs every script and concatenates outputs into `coords.tex`. |

## Conventions

- All numerical coordinates are printed to 4 decimal places.
- We use the curve $y^2 = 4x^3 - g_2 x - g_3$ with **$g_2=4, g_3=0$** (a
  reflection-symmetric, three-real-root curve with roots $\{-1,0,+1\}$).
- For the lattice we use an explicit non-rectangular lattice
  $\Lambda = \mathbb{Z}\omega_1 + \mathbb{Z}\omega_2$ with
  $\omega_1 = 2.4 + 0.25 i$, $\omega_2 = 0.7 + 1.7 i$ to match the
  document's geometric proportions.

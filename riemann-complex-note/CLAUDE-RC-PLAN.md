# Plan: Lecture Notes on Riemann-Roch via Holomorphic Line Bundles and Picard Groups on $\mathbb{CP}^1$

## Goal

Produce a self-contained LaTeX lecture note in the `riemann-complex-note/` folder that develops the Riemann-Roch theorem on $\mathbb{CP}^1$ from the perspective of **holomorphic line bundles** and the **Picard group**, with **winding form integration** as the conceptual backbone, matching the style of `riemann-complex/Riemann-Roch-Thm-CP1.tex`.

The winding form $\frac{df}{f}$ (and its winding number integral $\frac{1}{2\pi i}\oint_\gamma\frac{df}{f}$) should appear as the single primitive tool from which everything else is derived:
- the order $\text{ord}_p(f)$ is a winding number,
- the degree-zero theorem for principal divisors is a global Stokes argument on the winding form,
- the integer $n$ classifying $\mathcal{O}(n)$ is the winding number of its transition function around the equator of $\mathbb{CP}^1$,
- the isomorphism $\text{Pic}(\mathbb{CP}^1) \cong \mathbb{Z}$ says that winding number is the only invariant of a line bundle,
- and the integers $\deg D$ and $\deg K$ in the Riemann-Roch formula are winding counts; $\ell(D)$ is the dimension of the space of sections of the bundle classified by that winding number.

---

## Style Reference: `Riemann-Roch-Thm-CP1.tex`

The new note must match the following conventions from the reference file:

### Document Class & Preamble
- `\documentclass[11pt,openany]{article}`
- Input files: `riemann-complex-preamble`, `riemann-animate`, `tcolorbox`, `theorem`, `tikz`, `riemann-complex-commands`
- `\setstretch{1.25}` for line spacing

### Custom Colors
```latex
\definecolor{titleblue}{RGB}{22,72,130}
\definecolor{softgray}{RGB}{245,247,250}
\definecolor{rulegray}{RGB}{210,215,222}
\definecolor{noteblue}{RGB}{232,241,252}
\definecolor{warnred}{RGB}{252,237,237}
\definecolor{greenbox}{RGB}{236,247,238}
```
And framed environments: `infobox` (blue), `warningbox` (red), `greenboxenv` (green).

### Custom Theorem Boxes
- `\defbox[Title]{...}` — definitions
- `\thmbox{...}` — theorems
- `\probox{...}` — propositions
- `\lembox{...}` — lemmas
- `\corbox{...}` — corollaries

### Custom Macros (add to preamble)
```latex
\newcommand{\CP}{\mathbb{CP}}
\newcommand{\CPone}{\CP^1}
\newcommand{\OO}{\mathcal{O}}
\newcommand{\MM}{\mathcal{M}}
\newcommand{\Div}{\operatorname{Div}}
\newcommand{\Pic}{\operatorname{Pic}}
\newcommand{\Prin}{\operatorname{Prin}}
\newcommand{\degd}{\operatorname{deg}}
\newcommand{\ellD}{\ell}
\newcommand{\ord}{\operatorname{ord}}
\newcommand{\into}{\hookrightarrow}
\newcommand{\surj}{\twoheadrightarrow}
\renewcommand{\div}{\operatorname{div}}
% Winding form: \wform{f} produces \frac{df}{f}
\newcommand{\wform}[1]{\frac{d#1}{#1}}
% Winding number integral: \wind{\gamma}{f}
% Argument #2 must be a single token; for compound expressions (e.g. z^n) wrap in braces: \wind{\gamma}{(z^n)}
\newcommand{\wind}[2]{\frac{1}{2\pi i}\oint_{#1}\frac{d\!\left(#2\right)}{#2}}
```

### Color Annotations in Examples
- `{\color{blue} ...}` for case labels
- `{\color{orange} ...}` for local form of $f$
- `{\color{red} ...}` for pole/zero conditions at $\infty$

### Structural Elements
- Title block: `\Huge\textbf{...}`, author, `\today`
- Opening `infobox` summarizing the main theorem
- `\tableofcontents` followed by a `Notation` subsection
- Each major section starts on a new page (`\newpage`)
- Inline `\observation`, `\begin{example}`, `\begin{remark}` for motivation
- `\fullfunction{\Phi}{A}{B}{a}{b}` for explicit maps

---

## Proposed LaTeX File

**Filename:** `riemann-complex-note/RR-LineBundles-Picard.tex`

---

## Outline of Sections

### Title and Abstract Box
- Title: *Riemann-Roch Theorem via Holomorphic Line Bundles and Picard Group on $\mathbb{CP}^1$*
- Opening `infobox` stating Riemann-Roch:
  $$\ell(D) - \ell(K - D) = \deg D + 1 - g$$
  and the guiding idea: the integers $\deg D$ and $\deg K$ are winding numbers; $\ell(D)$ counts independent sections of the bundle they classify. The note develops this thread using holomorphic line bundles and $\mathrm{Pic}(\mathbb{CP}^1) \cong \mathbb{Z}$.

### Notation Section
Match the reference:
| Symbol | Meaning |
|--------|---------|
| $\mathcal{O}(X)$ | Holomorphic functions on $X$ |
| $\mathcal{M}(X)$ | Meromorphic functions on $X$ |
| $\mathcal{O}(n)$ | Line bundle on $\mathbb{CP}^1$ with transition function $z^n$ — **note:** $\mathcal{O}(X)$ uses a manifold argument and means global holomorphic functions; $\mathcal{O}(n)$ uses an integer argument and means the degree-$n$ line bundle; these must never be confused |
| $H^0(X, \mathcal{L})$ | Global sections of line bundle $\mathcal{L}$ |
| $\mathrm{Pic}(X)$ | Picard group of $X$ |
| $c_1(\mathcal{L})$ | First Chern class = winding number of transition function |
| $\frac{df}{f}$ | Winding form of $f$: globally well-defined logarithmic derivative; locally equal to $d(\log f)$ wherever a holomorphic branch of $\log f$ exists, but that equality is only a local mnemonic |
| $\frac{1}{2\pi i}\oint_\gamma \frac{df}{f}$ | Winding number of $f$ along $\gamma$ = $\mathrm{ord}_p(f)$ for a small loop $\gamma$ around $p$ |

---

### Section 0: The Winding Form

This section is the engine of the entire note. Every integer that appears later — order of a zero/pole, degree of a divisor, winding number of a transition function — is computed by one integral.

**0.1 The Logarithmic Derivative**
- `\defbox[Winding Form]`: For $f \in \mathcal{M}(U)^\times$, the **winding form** of $f$ is the meromorphic 1-form
  $$\frac{df}{f}.$$
- Motivating `\observation`: on any open set where a holomorphic branch of $\log f$ exists, $\frac{df}{f} = d(\log f)$ locally. However, $\frac{df}{f}$ is globally well-defined as a meromorphic 1-form on all of $U$ without any branch choice — the branch ambiguity in $\log f$ (integer multiples of $2\pi i$) disappears after differentiating. The notation "$d(\log f)$" is therefore only a local mnemonic, never a global definition.
- Key computation (color-annotated example): for $f = z^n$,
  $$\frac{d(z^n)}{z^n} = \frac{nz^{n-1}\,dz}{z^n} = n\,\frac{dz}{z}.$$
  So integrating around a small circle $\gamma$ centered at $0$:
  $$\frac{1}{2\pi i}\oint_\gamma \frac{d(z^n)}{z^n} = \frac{n}{2\pi i}\oint_\gamma \frac{dz}{z} = n.$$
  This integer $n$ is both the order of $f$ at $0$ (positive for a zero, negative for a pole) and the winding number of the map $z \mapsto z^n$ around the origin.

**0.2 Winding Number = Order**
- `\defbox[Order via Winding]`: For $f \in \mathcal{M}(X)^\times$ and $p \in X$ with small loop $\gamma_p$ around $p$,
  $$\operatorname{ord}_p(f) := \frac{1}{2\pi i}\oint_{\gamma_p} \frac{df}{f}.$$
- `\observation`: write $f = z^m u$ near $p$ with $u(p) \neq 0$. Then
  $$\frac{df}{f} = m\,\frac{dz}{z} + \frac{du}{u}.$$
  On a sufficiently small disk around $p$ (simply connected and $u$ nonvanishing there), $u$ admits a holomorphic logarithm, so $\frac{du}{u} = d(\log u)$ is exact on that disk; hence $\oint_{\gamma_p}\frac{du}{u} = 0$. Only the pole of $\frac{dz}{z}$ contributes, giving $\operatorname{ord}_p(f) = m$. This computation appears verbatim in `Riemann-Roch-Thm-CP1.tex` (the proof of degree zero) and should be reproduced here with the same style.

**0.3 The Global Stokes Argument: $\deg \div(f) = 0$**
- `\lembox`: For $f \in \mathcal{M}(X)^\times$ on a compact Riemann surface, $\sum_p \operatorname{ord}_p(f) = 0$.
- Proof (reproduce the Stokes proof from the reference): remove small disks $D_j(r)$ around each zero/pole to form $X_r$. On $X_r$, the winding form $\omega = \frac{df}{f}$ is holomorphic (hence smooth), and $d\omega = 0$: locally on $X_r$, $f$ is nonvanishing so $f = e^g$ for a holomorphic branch $g$, giving $\omega = dg$ exact, hence $d\omega = d(dg) = 0$ since $d \circ d = 0$. By Stokes:
  $$0 = \int_{X_r} d\omega = \int_{\partial X_r} \frac{df}{f}.$$
  Since $X_r = X \setminus \bigcup_j D_j(r)$ and $X$ has no boundary, the oriented boundary is $\partial X_r = -\sum_j C_j(r)$: each circle $C_j(r)$ appears with the orientation induced from the removed disk $D_j(r)$, which is opposite to the standard counterclockwise orientation (because removing the disk reverses the outward normal). Therefore:
  $$\int_{\partial X_r}\frac{df}{f} = -\sum_j \oint_{C_j(r)} \frac{df}{f} = -2\pi i \sum_j \operatorname{ord}_{p_j}(f) = 0.$$
  This is the fundamental global constraint imposed by $d\omega = 0$, and it is a purely winding-form argument.
- `infobox`: "The winding form $\frac{df}{f}$ is closed ($d\omega = 0$) wherever $f \neq 0, \infty$. Since $d\omega = 0$ on $X_r$, Stokes' theorem gives $\int_{\partial X_r}\omega = \int_{X_r}d\omega = 0$. It is this **boundary integral** that encodes all the winding numbers and must vanish — not a manifold integral."

**0.4 The Winding Form on $\mathbb{CP}^1$: an Explicit Residue**
- Example (color-annotated): for $f = z - a$ on $\mathbb{CP}^1$,
  $$\frac{d(z-a)}{z-a} = \frac{dz}{z-a}, \quad \operatorname{ord}_a(f) = \frac{1}{2\pi i}\oint_{\gamma_a}\frac{dz}{z-a} = 1,$$
  and passing to $w = 1/z$ near $\infty$:
  $$\frac{d(z-a)}{z-a}\bigg|_{w=1/z} = \frac{-w^{-2}\,dw}{\,w^{-1}-a\,} = \frac{-w^{-1}\,dw}{1-aw}, \quad \operatorname{ord}_\infty(f) = -1.$$
  Total: $1 + (-1) = 0$. ✓
- This verifies the degree-zero law directly from the winding form.

---

### Section 1: Holomorphic Line Bundles on $\mathbb{CP}^1$

**1.1 Definition via Transition Functions**
- `\defbox`: A holomorphic line bundle $\mathcal{L} \to X$ is a rank-1 complex vector bundle with holomorphic transition functions $g_{ij} : U_i \cap U_j \to \mathbb{C}^\times$ satisfying the cocycle condition $g_{ij} g_{jk} = g_{ik}$.
- Remark: On $\mathbb{CP}^1 = U_0 \cup U_\infty$ with $z = 1/w$ on the overlap, a line bundle is determined by a single transition function $g_{0\infty} : U_0 \cap U_\infty \cong \mathbb{C}^\times \to \mathbb{C}^\times$.
- `\observation` (winding form bridge): The overlap $U_0 \cap U_\infty \cong \mathbb{C}^\times$ has $\pi_1 \cong \mathbb{Z}$, generated by $|z| = 1$. The homotopy class of $g_{0\infty}$ is exactly its winding number:
  $$n = \frac{1}{2\pi i}\oint_{|z|=1} \frac{dg_{0\infty}}{g_{0\infty}}.$$
  Two transition functions with the same winding number give isomorphic bundles — *(this is claimed here as motivation and proved in Section 3.3)*. This is why line bundles on $\mathbb{CP}^1$ are classified by $\mathbb{Z}$.

**1.2 The Line Bundles $\mathcal{O}(n)$**
- `\defbox`: $\mathcal{O}(n)$ is defined by the transition function $g_{0\infty}(z) = z^n$.
  - $\mathcal{O}(0)$: trivial bundle ($g = 1$, winding number $0$).
  - $\mathcal{O}(1)$: hyperplane bundle ($g = z$, winding number $1$).
  - $\mathcal{O}(-1)$: tautological bundle ($g = z^{-1}$, winding number $-1$).
- Color-annotated example: For $\mathcal{O}(n)$, compute $\frac{1}{2\pi i}\oint_{|z|=1}\frac{d(z^n)}{z^n} = n$ explicitly (using Section 0.1). This confirms the winding number matches the label $n$.
- `\observation`: Two transition functions $g = z^n$ and $g' = e^{i\theta}z^n$ give isomorphic bundles because they differ by a coboundary: set $\phi_0 \equiv 1$ on $U_0$ and $\phi_\infty \equiv e^{i\theta}$ on $U_\infty$; then $g'_{0\infty} = \phi_0^{-1} g_{0\infty} \phi_\infty$. Both $\phi_i$ are holomorphic and nonvanishing on their charts. Since a coboundary change $g \mapsto \phi_0^{-1}g\phi_\infty$ contributes winding number $\frac{1}{2\pi i}\oint d(h_0 - h_\infty)= 0$ (an exact form integrates to zero around a closed loop), only the winding number of $g_{0\infty}$ itself survives as an invariant.

**1.3 Sections of $\mathcal{O}(n)$: A Winding Constraint**
- `\probox`: A section $s$ of $\mathcal{O}(n)$ consists of $(s_0, s_\infty)$ on $U_0, U_\infty$ satisfying the gluing $s_0 = z^n s_\infty$ on $U_0 \cap U_\infty$.
- The gluing condition $s_0(z) = z^n \cdot s_\infty(1/z)$ for $z \in U_0 \cap U_\infty$ (where $s_\infty$ is expressed in the $w$-coordinate, evaluated at $w = 1/z$) encodes exactly the winding number $n$: the section must "twist" $n$ times as it crosses the equator $|z| = 1$.
- Explicit computation:
  - $H^0(\mathbb{CP}^1, \mathcal{O}(n)) = \operatorname{span}_\mathbb{C}\{1, z, \ldots, z^n\}$ for $n \geq 0$.
  - $H^0(\mathbb{CP}^1, \mathcal{O}(n)) = 0$ for $n < 0$ — no holomorphic function can "untwist" $n < 0$ times.
- Use `{\color{orange} s_0(z) = P(z)}` and `{\color{red} s_\infty(w) = w^n P(1/w)}` format. Derivation: the gluing $s_0(z) = z^n \cdot s_\infty(w)|_{w=1/z}$ rearranges to $s_\infty(w) = w^n s_0(1/w) = w^n P(1/w)$. Expanding with $P(z) = \sum_{k=0}^m a_k z^k$: $s_\infty(w) = \sum_{k=0}^m a_k w^{n-k}$, which is holomorphic at $w = 0$ iff every exponent $n - k \geq 0$, i.e., $\deg P \leq n$. This is the winding constraint: only $n+1$ free coefficients survive.

---

### Section 2: From Divisors to Line Bundles

**2.1 The Line Bundle $\mathcal{O}(D)$ Associated to a Divisor**
- `\defbox` (sheaf of sections): For $D = \sum n_p [p]$, define $\mathcal{O}(D)$ as the sheaf assigning to each open $U$ the set of meromorphic functions $f \in \mathcal{M}(U)$ with $\div(f)|_U + D|_U \geq 0$.
- Transition function description (equivalent): choose a cover $\{U_i\}$ fine enough that on each $U_i$ one can find a meromorphic function $\psi_i$ with $\div(\psi_i) = D|_{U_i}$ (take each $U_i$ to contain at most one support point of $D$). Then $g_{ij} := \psi_i/\psi_j$ is holomorphic and nonvanishing on $U_i \cap U_j$ (since $\div(g_{ij}) = D|_{U_i} - D|_{U_j} = 0$ there), and satisfies the cocycle condition. These are the transition functions of the same line bundle.
- `\remark` (equivalence of the two descriptions): A local section $s$ of the sheaf-of-sections over $U_i$ satisfies $\div(s)|_{U_i} + D|_{U_i} \geq 0$, i.e., $s = \lambda_i \psi_i$ for a holomorphic $\lambda_i$. So $\lambda_i$ is the fiber coordinate in the trivialization given by $\psi_i$, and the transition $\lambda_i = g_{ij}\lambda_j$ recovers the line bundle structure. The two descriptions therefore define the same object.
- Winding form connection: for a small loop $\gamma_p$ encircling a single point $p \in U_i$, the winding number of $\psi_i$ is $\frac{1}{2\pi i}\oint_{\gamma_p}\frac{d\psi_i}{\psi_i} = \operatorname{ord}_p(\psi_i) = n_p$. The transition functions $g_{ij} = \psi_i/\psi_j$ are nonvanishing on overlaps, but the local trivializations $\psi_i$ carry the winding data of $D$ pointwise.
- `\remark` (well-definedness): The $\psi_i$ are not unique — replacing $\psi_i$ by $f_i\psi_i$ for any holomorphic nonvanishing $f_i$ on $U_i$ also satisfies $\div(f_i\psi_i) = D|_{U_i}$. The new transition functions are $g_{ij}' = f_i g_{ij} f_j^{-1}$, a coboundary with $\phi_k = f_k^{-1}$. Hence the resulting line bundle is isomorphic to the original. So $\mathcal{O}(D)$ is well-defined as an isomorphism class.
- Concrete case: $D = n[\infty]$ on $\mathbb{CP}^1$ gives $g_{0\infty}(z) = z^n$, winding number $n$, so $\mathcal{O}(D) = \mathcal{O}(n)$.
- `\thmbox`: The map $D \mapsto \mathcal{O}(D)$ is a group homomorphism $\Div(\mathbb{CP}^1) \to \operatorname{Pic}(\mathbb{CP}^1)$, because adding divisors corresponds to multiplying transition functions, which adds winding numbers.

**2.2 Global Sections Recover $L(D)$**
- `\thmbox`: $H^0(\mathbb{CP}^1, \mathcal{O}(D)) = L(D)$.
- Proof: Unwind definitions — a section of $\mathcal{O}(D)$ over all of $\mathbb{CP}^1$ is exactly a meromorphic function $f$ with $\div(f) + D \geq 0$, i.e., $f \in L(D)$.
- `infobox`: "The winding form perspective makes $H^0(\mathcal{O}(D)) = L(D)$ transparent: both encode the constraint that the winding number of $f$ at each point $p$ is at least $-n_p$."

**2.3 Linearly Equivalent Divisors Give Isomorphic Line Bundles**
- `\thmbox`: $D \sim D' \iff \mathcal{O}(D) \cong \mathcal{O}(D')$.
- Proof ($\Rightarrow$, at the transition function level): Suppose $D - D' = \div(g)$ for some $g \in \mathcal{M}(\mathbb{CP}^1)^\times$. Take local trivializations $\psi_i$ for $D$ (with $\div(\psi_i) = D|_{U_i}$). Then $\psi_i' := \psi_i / g$ satisfies $\div(\psi_i') = D|_{U_i} - \div(g)|_{U_i} = D'|_{U_i}$. The transition functions become $g_{ij}' = \psi_i'/\psi_j' = (\psi_i/g)/(\psi_j/g) = \psi_i/\psi_j = g_{ij}$. Identical transition functions give isomorphic line bundles, so $\mathcal{O}(D) \cong \mathcal{O}(D')$.
- Proof ($\Leftarrow$): If $\mathcal{O}(D) \cong \mathcal{O}(D')$, the isomorphism supplies holomorphic nonvanishing $\phi_i$ on each $U_i$ satisfying $g_{ij}' = \phi_i^{-1}g_{ij}\phi_j$. Define $h_i := \phi_i^{-1}\psi_i/\psi_i'$ on each $U_i$. On each overlap:
  $$h_i/h_j = \frac{\phi_i^{-1}\psi_i/\psi_i'}{\phi_j^{-1}\psi_j/\psi_j'} = \frac{\phi_j}{\phi_i}\cdot\frac{g_{ij}}{g_{ij}'} = \frac{\phi_j}{\phi_i}\cdot\frac{\phi_i}{\phi_j} = 1,$$
  so $h_i$ patches to a globally defined meromorphic function $h$. Its divisor: $\div(h_i) = \div(\phi_i^{-1}) + \div(\psi_i) - \div(\psi_i') = 0 + D|_{U_i} - D'|_{U_i} = (D-D')|_{U_i}$, giving $\div(h) = D - D'$ and hence $D \sim D'$.
- Note: simply patching $\psi_i/\psi_i'$ alone does not work, because $(\psi_i/\psi_i')/(\psi_j/\psi_j') = g_{ij}/g_{ij}' = \phi_i\phi_j^{-1} \neq 1$ in general. The coboundary $\phi_i$ from the isomorphism is essential.
- `\corbox`: In particular, $\ell(D) = \ell(D')$ (the isomorphism $\mathcal{O}(D) \cong \mathcal{O}(D')$ induces $H^0(\mathcal{O}(D)) \cong H^0(\mathcal{O}(D'))$). For the explicit vector-space isomorphism, multiplication by the function $g$ with $\div(g) = D - D'$ gives $\Phi_g: L(D) \xrightarrow{\sim} L(D')$, $f \mapsto gf$ — see `Riemann-Roch-Thm-CP1.tex` for the detailed proof.
- Winding form reading: $\div(g)$ records the winding numbers of $g$ at each point; replacing $\psi_i$ by $\psi_i/g$ shifts all local winding data by $-\div(g)$, exactly changing $D$ to $D'$. The transition functions, being ratios of local trivializations, are unchanged.

---

### Section 3: The Picard Group $\mathrm{Pic}(\mathbb{CP}^1)$

**3.1 Definition of the Picard Group**
- `\defbox`: $\mathrm{Pic}(X)$ is the group of isomorphism classes of holomorphic line bundles on $X$, with group operation $\otimes$ (tensor product) and identity $\mathcal{O}_X$.
- Remark: Inverse of $[\mathcal{L}]$ is $[\mathcal{L}^{-1}] = [\mathcal{L}^\vee]$ (dual bundle).

**3.2 The Degree Map as a Winding Number**
- `\defbox`: The degree of $\mathcal{L}$ is the winding number of its transition function around the equator $|z| = 1$:
  $$\deg \mathcal{L} := \frac{1}{2\pi i}\oint_{|z|=1} \frac{dg_{0\infty}}{g_{0\infty}}.$$
- Well-definedness: Two transition functions representing the same line bundle differ by a coboundary $g_{0\infty}' = \phi_0^{-1}g_{0\infty}\phi_\infty$, where $\phi_0$ is holomorphic nonvanishing on $U_0 \cong \mathbb{C}$ and $\phi_\infty$ on $U_\infty \cong \mathbb{C}$. Since $U_0$ and $U_\infty$ are simply connected, $\phi_i = e^{h_i}$ for entire $h_i$, so the coboundary contributes $\frac{1}{2\pi i}\oint_{|z|=1}d(h_\infty - h_0) = 0$ (exact form on a closed loop). Hence $\deg$ is independent of the choice of $g_{0\infty}$ within an isomorphism class. Note: the coboundary $\phi_0^{-1}\phi_\infty$ is defined only on the overlap $U_0 \cap U_\infty \cong \mathbb{C}^\times$, so the degree-zero law for global functions does not apply here; simple connectivity of the charts is the correct tool.
- $\deg\mathcal{O}(D) = \deg D$: Assume $D$ has no support on $|z|=1$ (generic case). With $g_{0\infty} = \psi_0/\psi_\infty$ and $\frac{d(gg')}{gg'} = \frac{dg}{g} + \frac{dg'}{g'}$:
  $$\frac{1}{2\pi i}\oint_{|z|=1}\frac{dg_{0\infty}}{g_{0\infty}} = \underbrace{\frac{1}{2\pi i}\oint_{|z|=1}\frac{d\psi_0}{\psi_0}}_{\displaystyle=\sum_{|p|<1}n_p} - \underbrace{\frac{1}{2\pi i}\oint_{|z|=1}\frac{d\psi_\infty}{\psi_\infty}}_{\displaystyle=-\sum_{|p|>1\text{ or }p=\infty}n_p} = \sum_p n_p = \deg D.$$
  The first term is the argument principle applied counterclockwise in the $z$-chart, counting zeros/poles of $\psi_0$ inside $|z|<1$. The second term carries a **minus sign** from an orientation reversal: $|z|=1$ traversed counterclockwise in $z$ becomes $|w|=1$ traversed **clockwise** in $w = 1/z$, so the argument principle in the $w$-chart gives the negative of the sum of winding numbers inside $|w|<1$ (i.e., outside $|z|=1$ plus $\infty$), hence $-\sum_{|p|>1\text{ or }p=\infty}n_p$. This is the same orientation-reversal mechanism as the $\partial X_r$ sign in Section 0.3. The equatorial argument principle (not the global Stokes of Section 0.3) is what connects the transition function winding number to the total degree.
- `\probox`: $\deg : \mathrm{Pic}(\mathbb{CP}^1) \to \mathbb{Z}$ is a group homomorphism. Proof: $\deg(\mathcal{L} \otimes \mathcal{L}') = \deg \mathcal{L} + \deg \mathcal{L}'$ because winding numbers of products add: $\frac{d(gg')}{gg'} = \frac{dg}{g} + \frac{dg'}{g'}$.

**3.3 $\mathrm{Pic}(\mathbb{CP}^1) \cong \mathbb{Z}$**
- `\thmbox`:
  $$\mathrm{Pic}(\mathbb{CP}^1) \cong \mathbb{Z}, \qquad [\mathcal{L}] \mapsto \frac{1}{2\pi i}\oint_{|z|=1}\frac{dg_{0\infty}}{g_{0\infty}}.$$
- Proof strategy (no circularity — both injectivity and surjectivity of $\Div \to \mathrm{Pic}$ follow from one lemma):
  - *Key lemma* (from `Riemann-Roch-Thm-CP1.tex`, used as a black box here): every divisor $D$ on $\mathbb{CP}^1$ satisfies $D \sim (\deg D)[\infty]$. The proof uses $\div(z-a) = [a] - [\infty]$ to move all finite points to $[\infty]$ one at a time.
  - *Surjectivity of $\mathrm{Pic}(\mathbb{CP}^1) \cong \mathbb{Z}$*: $z^n$ achieves every winding number $n$, and $\mathcal{O}(n)$ is a line bundle of degree $n$.
  - *Injectivity (degree is the only invariant)*: Any line bundle $\mathcal{L}$ of degree $n$ has a meromorphic section $s$ (since $\mathcal{O}(n)$ is defined by explicit sections). The divisor $D = \div(s) + n[\infty]$ satisfies $\mathcal{O}(D) \cong \mathcal{L}$. By the key lemma, $D \sim n[\infty]$, so $\mathcal{L} \cong \mathcal{O}(D) \cong \mathcal{O}(n[\infty]) = \mathcal{O}(n)$ (using Section 2.3). Two bundles of the same degree are therefore both $\cong \mathcal{O}(n)$, hence isomorphic.
  - *Why no circle*: §3.4's surjectivity of $\Div \to \mathrm{Pic}$ also follows from the key lemma (every $\mathcal{O}(n) = \mathcal{O}(n[\infty])$ comes from the divisor $n[\infty]$), independently of the injectivity argument. The key lemma is the sole prior input to both.
- Use `\fullfunction{\Phi}{\mathrm{Pic}(\mathbb{CP}^1)}{\mathbb{Z}}{[\mathcal{L}]}{\deg \mathcal{L}}` for the isomorphism.
- `greenboxenv`: contrast with higher-genus curves. On a genus-$g$ curve, the degree map $\deg: \mathrm{Pic}(X) \to \mathbb{Z}$ still exists but its kernel $\mathrm{Pic}^0(X)$ — line bundles of degree 0 — is a $g$-dimensional complex torus (the Jacobian), not just $\{0\}$. On $\mathbb{CP}^1$ ($g=0$), $\mathrm{Pic}^0(\mathbb{CP}^1) = 0$: every degree-0 line bundle is trivial, because $D \sim 0$ whenever $\deg D = 0$ (by the argument from `Riemann-Roch-Thm-CP1.tex`). This is the sense in which $\mathbb{CP}^1$ is the simplest case.

**3.4 The Short Exact Sequence**
- `\remark`: By Liouville's theorem, every holomorphic function on the compact Riemann surface $\mathbb{CP}^1$ is constant, so $\mathcal{O}(\mathbb{CP}^1)^\times = \mathbb{C}^\times$. This means there are no nontrivial globally holomorphic gauge transformations on $\mathbb{CP}^1$.
- `\probox`: There is a short exact sequence
  $$0 \to \mathbb{C}^\times \to \mathcal{M}(\mathbb{CP}^1)^\times \xrightarrow{\div} \Div(\mathbb{CP}^1) \to \mathrm{Pic}(\mathbb{CP}^1) \to 0.$$
- Winding form reading: the map $\div$ sends $f \mapsto \sum_p \operatorname{ord}_p(f)[p]$, where each $\operatorname{ord}_p(f) = \frac{1}{2\pi i}\oint_{\gamma_p}\frac{df}{f}$ is a local winding number. Exactness at $\mathcal{M}^\times$ says: a function with all winding numbers zero is holomorphic and nonvanishing. Exactness at $\Div$ says: a divisor is principal iff it is the winding data of a global meromorphic function.
- `\warningbox`: Exactness at the final term $\mathrm{Pic}(\mathbb{CP}^1)$ — i.e., that every line bundle on $\mathbb{CP}^1$ comes from a divisor — requires $H^1(\mathbb{CP}^1, \mathcal{M}^\times) = 0$. This holds because every line bundle on $\mathbb{CP}^1$ is $\mathcal{O}(n)$ for some $n$ (the content of Section 3.3), and $\mathcal{O}(n) = \mathcal{O}(n[\infty])$ comes from the divisor $n[\infty]$. The vanishing of $H^1(\mathcal{M}^\times)$ is not a formal consequence of the sequence alone; it uses the classification already established.

---

### Section 4: The Canonical Bundle and Serre Duality

**4.1 Canonical Line Bundle $K_{\mathbb{CP}^1}$**
- `\defbox`: The canonical bundle $K_X = \Omega^1_X$ is the cotangent line bundle; its sections over $U$ are holomorphic 1-forms on $U$.
- Transition function via the winding form: On the overlap $U_0 \cap U_\infty$, a 1-form $\omega = f(z)\,dz$ transforms as
  $$f(z)\,dz = f(1/w)\cdot d(1/w) = f(1/w)\cdot\left(-\frac{1}{w^2}\right)dw = -\frac{f(1/w)}{w^2}\,dw.$$
  So the transition function of $K$ is $g^K_{0\infty}(z) = -z^{-2}$ (or simply $z^{-2}$ up to sign), which has winding number $-2$:
  $$\deg K = \frac{1}{2\pi i}\oint_{|z|=1}\frac{d(z^{-2})}{z^{-2}} = -2.$$
  Therefore $K_{\mathbb{CP}^1} = \mathcal{O}(-2)$.
- `\observation`: As a consistency check, compute the divisor of the meromorphic 1-form $\frac{dz}{z}$ directly. In the $z$-chart: simple pole at $0$. In the $w$-chart ($w = 1/z$): $\frac{dz}{z} = \frac{-w^{-2}dw}{w^{-1}} = -\frac{dw}{w}$, which has a simple pole at $w = 0$ (i.e., at $\infty$). So $\div\!\left(\frac{dz}{z}\right) = -[0] - [\infty]$, a divisor of degree $-2 = \deg K$. All meromorphic 1-forms on $\mathbb{CP}^1$ have divisor of degree $-2$; none are holomorphic everywhere ($h^0(K) = 0$, consistent with $\ell(K) = \max(0, -2+1) = 0$).
- Corollary: $\deg K = -2$, consistent with $g = 0$ and the genus formula $\deg K = 2g - 2$ (a consequence of Gauss-Bonnet). Note: Riemann-Hurwitz would be the wrong reference here — it governs ramification of covering maps, not the canonical degree.

**4.2 Serre Duality on $\mathbb{CP}^1$**
- `\thmbox` (statement only): For a line bundle $\mathcal{L}$ on a compact Riemann surface $X$ of genus $g$,
  $$H^1(X, \mathcal{L}) \cong H^0(X, K_X \otimes \mathcal{L}^{-1})^\vee.$$
- On $\mathbb{CP}^1$: $H^1(\mathbb{CP}^1, \mathcal{O}(n)) \cong H^0(\mathbb{CP}^1, \mathcal{O}(-n-2))^\vee$.
- Consequence: $h^1(\mathcal{O}(n)) = \max(0, -n-1)$ — to be used in the proof of Riemann-Roch.

---

### Section 5: Riemann-Roch Theorem on $\mathbb{CP}^1$

**5.1 Statement**
- Opening `infobox` (matching the reference): Recall the general form, specialize to $g = 0$, and frame the formula as a winding number balance:
  $$\underbrace{\ell(D)}_{\text{sections: wind} \geq -n_p} - \underbrace{\ell(K-D)}_{\text{obstruction: corrective windings}} = \underbrace{\deg D}_{\text{total winding}} + 1.$$
- `\thmbox`: $\ell(D) - \ell(K - D) = \deg D + 1$ on $\mathbb{CP}^1$.

**5.2 Proof via Winding Numbers**
- Step 1: Reduce to $D = n[\infty]$ — every divisor is equivalent to $n[\infty]$ because any finite point $[a]$ satisfies $[a] \sim [\infty]$ via $\div(z-a) = [a] - [\infty]$, which is a winding-form statement: $\frac{d(z-a)}{z-a}$ has winding number $+1$ at $a$ and $-1$ at $\infty$.
- Step 2: Compute $\ell(n[\infty])$ from Section 1.3 — the gluing condition $s_0 = z^n s_\infty$ with $\text{ord}_\infty(s_\infty) \geq 0$ forces $\deg P \leq n$, giving $\max(0, n+1)$ free coefficients.
- Step 3: The canonical bundle $K_{\mathbb{CP}^1} = \mathcal{O}(-2)$ has degree $-2$ (Section 4.1). By the Picard group classification of Section 3.3 ($\mathrm{Pic}^0(\mathbb{CP}^1) = 0$), the unique degree-$(-2)$ bundle is $\mathcal{O}(-2) = \mathcal{O}(-2[\infty])$, so we take $K = -2[\infty]$ as the canonical divisor representative. Then $K - D = (-n-2)[\infty]$. Compute $\ell(K - D) = \max(0, -n-1)$.
- Step 4 (color-annotated):
  - {\color{blue} $n \geq 0$}: $(n+1) - 0 = n+1$. ✓
  - {\color{blue} $n = -1$}: $0 - 0 = 0$. ✓
  - {\color{blue} $n \leq -2$}: $0 - (-n-1) = n+1$. ✓
- `infobox`: "The Riemann-Roch formula on $\mathbb{CP}^1$ is a bookkeeping identity for winding numbers: the number of independent sections of $\mathcal{O}(n)$ minus the number of independent 'correction' sections equals the total winding $n$ plus one."

**5.3 Cohomological Reformulation**
- `\probox`: Riemann-Roch is equivalent to
  $$h^0(\mathcal{O}(D)) - h^1(\mathcal{O}(D)) = \deg D + 1.$$
- Serre duality gives a vector-space isomorphism $H^1(\mathbb{CP}^1, \mathcal{O}(n)) \cong H^0(\mathbb{CP}^1, \mathcal{O}(-n-2))^\vee$; taking dimensions: $h^1(\mathcal{O}(n)) = h^0(\mathcal{O}(-n-2)) = \max(0, -n-1)$, matching $\ell(K - D)$.
- `\observation`: Three regimes, with distinct behavior:
  - $n \geq 0$: $\ell(D) = n+1 > 0$ and $h^1 = 0$. Riemann-Roch is the clean count $h^0 = \deg D + 1$.
  - $n = -1$: $\ell(D) = 0$ and $h^1 = 0$. Both sides are 0; Riemann-Roch holds trivially.
  - $n \leq -2$: $\ell(D) = 0$ and $h^1 = -n-1 > 0$. The $h^1$ term is nonzero and Serre duality "reflects" the count: $0 - (-n-1) = n+1$ as required.
  Note the causal order: $\ell(D) = 0$ already at $n = -1$ (independently of $h^1$). The $h^1$ obstruction only activates at $n \leq -2$; it does not cause $\ell(D)$ to vanish, but rather accounts for the deficit $\deg D + 1 < 0$ once $\ell(D)$ is already zero.

---

### Section 6: Examples and Applications

**6.1 Table of $\mathcal{O}(n)$ Sections**
Build a table (using `array` or `tabular`) matching style of examples in reference:

| $n$ | $\mathcal{O}(n)$ | $\ell(n[\infty])$ | basis of $H^0$ |
|-----|------|-------|------|
| $n \leq -1$ | $\mathcal{O}(n)$ | $0$ | $\emptyset$ |
| $-2$ | $K_{\mathbb{CP}^1}$ | $0$ | $\emptyset$ |
| $-1$ | $\mathcal{O}(-1)$ | $0$ | $\emptyset$ |
| $0$ | $\mathcal{O}_{\mathbb{CP}^1}$ | $1$ | $\{1\}$ |
| $1$ | $\mathcal{O}(1)$ | $2$ | $\{1, z\}$ |
| $2$ | $\mathcal{O}(2)$ | $3$ | $\{1, z, z^2\}$ |
| $n \geq 0$ | $\mathcal{O}(n)$ | $n+1$ | $\{1, z, \ldots, z^n\}$ |

**6.2 Verify Riemann-Roch on Specific Divisors**
Revisit examples from `Riemann-Roch-Thm-CP1.tex` and restate them in terms of line bundles:
- $D = [0]$: $\mathcal{O}([0]) \cong \mathcal{O}(1)$. Verify $\ell = 2$.
- $D = [0] + [1]$: $\mathcal{O}([0]+[1]) \cong \mathcal{O}(2)$. Verify $\ell = 3$.
- $D = [\infty] - [1]$: $\mathcal{O}([\infty]-[1]) \cong \mathcal{O}(0) = \mathcal{O}$. Verify $\ell = 1$.

**6.3 Morphisms to Projective Space**
- `\probox`: If $\deg D \geq 1$ on $\mathbb{CP}^1$, the map $\phi_D : \mathbb{CP}^1 \to \mathbb{P}^{\ell(D)-1}$ defined by evaluation of a basis of $L(D)$ is a morphism (the base locus is empty for $\deg D \geq 1$ on $\mathbb{CP}^1$).
- Use the reference file's convention throughout: the affine point $z \in \mathbb{C}$ corresponds to the homogeneous point $[1:z] \in \mathbb{CP}^1$.
- Example: $D = [\infty]$, basis $\{1, z\}$. At the affine point $[1:z_0]$: $\phi([1:z_0]) = [1(z_0) : z(z_0)] = [1:z_0]$. So $\phi: [1:z] \mapsto [1:z]$, the identity on $\mathbb{CP}^1$.
- Example: $D = 2[\infty]$, basis $\{1, z, z^2\}$. The map $\phi: [1:z] \mapsto [1:z:z^2]$ is the Veronese embedding $\mathbb{CP}^1 \hookrightarrow \mathbb{CP}^2$, whose image is the conic $\{XZ = Y^2\}$ in $\mathbb{CP}^2 = \{[X:Y:Z]\}$.

---

## File Structure in `riemann-complex-note/`

```
riemann-complex-note/
├── CLAUDE-RC-PLAN.md                       ← this file
├── RR-LineBundles-Picard.tex               ← main lecture note
├── RR-LineBundles-Picard.pdf               ← compiled output
└── RR-LineBundles-Tikz/                    ← TikZ diagrams
    ├── Tikz-WindingForm.tex                ← winding form on C× with loop (Section 0)
    ├── Tikz-Stokes-DegZero.tex             ← Stokes argument for deg div(f)=0 (Section 0)
    ├── Tikz-LineBundleGluing.tex           ← gluing with twist annotation + winding inset (Section 1)
    ├── Tikz-PicardGroup.tex                ← Z-chain with winding numbers (Section 3)
    └── Tikz-RiemannRoch-Balance.tex        ← ℓ(D) vs ℓ(K-D) balance graph (Section 5)
```

---

## TikZ Diagrams to Create

1. **Winding form on $\mathbb{C}^\times$**: A punctured plane with a loop $\gamma$ around the origin, annotated with $\frac{1}{2\pi i}\oint_\gamma \frac{dz}{z} = 1$ and arrows showing the direction of winding. Use to introduce Section 0.
2. **Stokes argument for $\deg \div(f) = 0$**: $\mathbb{CP}^1$ with excised disks $D_j(r)$ around zeros/poles, boundary circles $\gamma_j$ with orientation, and the Stokes identity $\int_{X_r} d\omega = \int_{\partial X_r}\omega = 0$.
3. **Transition function gluing with winding**: Two copies of $\mathbb{C}$ (charts $U_0$, $U_\infty$) glued by $w = z^{-1}$; a fiber over the equator $|z|=1$ with the twist $s_0 = z^n s_\infty$ annotated; a small inset showing $\oint_{|z|=1}\frac{d(z^n)}{z^n} = n$.
4. **Picard group as $\mathbb{Z}$ via winding**: A number line with $\mathcal{O}(n)$ at each integer, with the winding number $n = \frac{1}{2\pi i}\oint\frac{dg}{g}$ written below each node; arrows showing $\mathcal{O}(n) \otimes \mathcal{O}(m) = \mathcal{O}(n+m)$ as winding addition.
5. **Riemann-Roch balance diagram**: A graph of $\ell(D)$ and $\ell(K-D)$ vs $\deg D$; the piecewise-linear curves intersect at $\deg D = -1$; the vertical gap is always $\deg D + 1$. Annotate with "total winding" labels.

---

## Writing Order

0. **Chart setup for $\mathbb{CP}^1$** — must come before Section 0; introduce $U_0, U_\infty$, coordinates $z$ and $w = 1/z$, and the overlap $U_0 \cap U_\infty \cong \mathbb{C}^\times$. Section 0.4 already uses $w = 1/z$ explicitly, so the coordinate dictionary must be established first. This can be a short unnumbered preamble or a Section 0.0 within the winding form chapter.
1. **Section 0** (Winding Form) — every subsequent section borrows its language
2. **Section 1** (Line Bundles) — depends on Section 0 for the winding number of transition functions
3. **Section 2** (Divisors → Line Bundles) — bridge; depends on Sections 0 and 1
4. **Section 3** (Picard Group) — degree map redefined as a winding number; depends on Sections 0–2
5. **Section 4** (Canonical Bundle) — quick application of the winding framework; depends on Section 1
6. **Section 5** (Riemann-Roch) — main theorem; depends on all prior sections
7. **Section 6** (Examples) — can be written in parallel once Section 5 is done
8. TikZ diagrams — #1 and #2 (winding form) alongside Section 0; #3 alongside Section 1; #4 alongside Section 3; #5 alongside Section 5

---

## Key Mathematical Checkpoints

### Prerequisites and Structure
- [ ] Coordinates $U_0, U_\infty, z, w = 1/z$ established before Section 0 (Section 0.0 or preamble)
- [ ] Notation clash $\mathcal{O}(X)$ vs. $\mathcal{O}(n)$ flagged in the Notation section

### Winding Form Thread
- [ ] Goal section uses "winding form $\frac{df}{f}$" (not $\frac{1}{2\pi i}\frac{df}{f}$); winding number integral $\frac{1}{2\pi i}\oint$ stated separately
- [ ] Notation table describes $\frac{df}{f}$ as globally well-defined; "$d\log f$" cited only as a local mnemonic
- [ ] Section 0 defines $\frac{df}{f}$ as globally well-defined without branch choice; $d\omega = 0$ justified via $\omega = dg$ locally (not "$d^2\log f$")
- [ ] §0.3 infobox attributes the zero to the boundary integral $\int_{\partial X_r}\omega$, not to a manifold integral
- [ ] $\operatorname{ord}_p(f)$ is defined as a winding integral in Section 0; phrased as "order of $f$ at $p$" (works for poles and zeros)
- [ ] The degree-zero law $\sum \operatorname{ord}_p(f) = 0$ is proved by Stokes on $\frac{df}{f}$, not stated as a black box
- [ ] The transition function winding number $\frac{1}{2\pi i}\oint_{|z|=1}\frac{dg_{0\infty}}{g_{0\infty}}$ appears explicitly in Sections 1 and 3
- [ ] $\deg \mathcal{L}$ is defined as a winding number in Section 3.2, not as $\deg D$ for an abstract $D$
- [ ] $\deg\mathcal{O}(D) = \deg D$ justified by equatorial argument principle with orientation reversal explained; index "$|p|>1$ or $p=\infty$" used
- [ ] The canonical bundle's degree $-2$ is derived from $d(1/w) = -w^{-2}dw$ (not $\frac{d(1/w)}{1}$), verified against $\div(dz/z) = -[0]-[\infty]$; reference is Gauss-Bonnet $\deg K = 2g-2$, not Riemann-Hurwitz
- [ ] The Riemann-Roch proof in Section 5 uses the language of winding constraints throughout; $K \sim -2[\infty]$ cited from §3.3

### Line Bundles and Picard Group
- [ ] §2.1 gives sheaf-of-sections definition first, then transition function description, with a remark showing they're equivalent via the identification $s = \lambda_i\psi_i$
- [ ] $\mathcal{O}(D)$ transition functions built as $g_{ij} = \psi_i/\psi_j$ from local trivializations $\psi_i$ with $\div(\psi_i) = D|_{U_i}$
- [ ] Well-definedness of $\mathcal{O}(D)$: replacing $\psi_i$ by $f_i\psi_i$ gives coboundant (isomorphic) transition functions
- [ ] $D \sim D' \Rightarrow \mathcal{O}(D) \cong \mathcal{O}(D')$ proved at transition function level ($\psi_i' = \psi_i/g$ gives $g_{ij}' = g_{ij}$); multiplication map used only for the corollary $\ell(D) = \ell(D')$
- [ ] $D \sim D' \Leftarrow \mathcal{O}(D) \cong \mathcal{O}(D')$ proved by patching $h_i = \phi_i^{-1}\psi_i/\psi_i'$ (not $\psi_i/\psi_i'$ alone) into a global meromorphic function; note that $\psi_i/\psi_i'$ alone does not patch
- [ ] $\mathcal{O}(\mathbb{CP}^1)^\times = \mathbb{C}^\times$ by Liouville stated in §3.4 before the short exact sequence
- [ ] Well-definedness of $\deg\mathcal{L}$: coboundary contributes $\oint d(h_\infty - h_0) = 0$ via simple connectivity of $U_0, U_\infty$; degree-zero law NOT cited here (it applies to global functions, not overlap functions)
- [ ] Both injectivity and surjectivity of $\Div \to \mathrm{Pic}$ derived simultaneously from the key lemma $D \sim (\deg D)[\infty]$; no circular dependency
- [ ] §1.1 claim "same winding number $\Rightarrow$ isomorphic" marked as forward reference "(proved in Section 3.3)"
- [ ] $\mathrm{Pic}^0(\mathbb{CP}^1) = 0$ explained as $g = 0$ special case; contrast with $g$-dimensional Jacobian for higher-genus curves
- [ ] Winding addition $\deg(\mathcal{L} \otimes \mathcal{L}') = \deg\mathcal{L} + \deg\mathcal{L}'$ derived from $\frac{d(gg')}{gg'} = \frac{dg}{g} + \frac{dg'}{g'}$

### Computations
- [ ] Sections gluing written as $s_0(z) = z^n \cdot s_\infty(1/z)$; expansion gives $s_\infty(w) = w^n P(1/w)$; holomorphicity at $w=0$ forces $\deg P \leq n$
- [ ] Stokes boundary orientation explained: $\partial X_r = -\sum_j C_j(r)$ due to induced orientation from removed disks
- [ ] $\frac{du}{u}$ exactness attributed to simple connectivity of the local disk, not just nonvanishing of $u$
- [ ] Serre duality stated as vector-space iso $H^1 \cong H^0(\cdots)^\vee$; dimension equality $h^1 = h^0(\cdots)$ stated separately
- [ ] §5.3 observation correctly states: $\ell(D)=0$ from $n=-1$; $h^1$ nonzero only from $n=-2$; three regimes ($n \geq 0$, $n=-1$, $n \leq -2$) each discussed
- [ ] Every $L(D)$ computation matches corresponding entry in `Riemann-Roch-Thm-CP1.tex`
- [ ] Riemann-Roch table covers all three cases; §6.1 table includes row for $n \leq -1$ (basis $\emptyset$)
- [ ] Serre duality proof deferred (marked TBA or `\warningbox`)
- [ ] All homogeneous coordinate examples use reference file convention: affine $z \leftrightarrow [1:z]$; Veronese stated as $[1:z] \mapsto [1:z:z^2]$

### Style
- [ ] Color scheme consistently: blue for case labels, orange for local forms, red for $\infty$-conditions
- [ ] `\wind{\gamma}{f}` macro used consistently for all winding integrals; compound arguments (e.g., $z^n$) wrapped in braces to ensure $\frac{d(z^n)}{z^n}$ renders correctly
- [ ] Each section opens with a one-sentence reminder of how winding forms connect to the section's content

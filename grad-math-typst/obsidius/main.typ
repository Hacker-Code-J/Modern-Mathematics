#set page(width: 8.5in, height: 11in)
#set text(12pt, font: "Libertinus Serif")

#show heading: set text(16pt, weight: "bold")
#show heading.where(level: 1): set text(20pt, weight: "bold")
#show heading.where(level: 2): set text(16pt, weight: "semibold")

#align(center)[
  = Lecture Notes
  == Differential 1-Forms
]

---

= 1. Introduction

In differential geometry, a [*differential 1-form*] is an object that can be
integrated along curves. Intuitively, it is a field of covectors that assigns
to each tangent vector a real number.

---

= 2. Definition

Let $M$ be a smooth manifold.
A [*differential 1-form*] $ω$ on $M$ is a smooth section of the
cotangent bundle $T^* M$.

Equivalently, at each point $p ∈ M$, the value $ω_p$ is a linear map
from the tangent space $T_p M$ to $ℝ$.

---

= 3. Local Representation

In local coordinates $(x^1, x^2, …, x^n)$, a 1-form can be written as:

$ω = ∑_{i=1}^n f_i(x) d x^i$

where $f_i$ are smooth functions on $M$.

---

= 4. Examples

== Example 1: Euclidean Plane

On $ℝ^2$ with coordinates $(x,y)$, consider

$ω = y d x + x d y$

At $(x,y)$ and a tangent vector $v = (a,b)$,

$ω_{(x,y)}(v) = y · a + x · b$

== Example 2: Gradient of a Function

If $f: ℝ^n → ℝ$ is smooth, then its differential $d f$ is a
1-form:

$d f = ∑_{i=1}^n (∂ f / ∂ x^i) d x^i$

---

= 5. Integration of 1-Forms

Given a smooth curve $γ: [a,b] → M$,
we can integrate a 1-form $ω$ along $γ$ as

// $∫_γ ω = ∫_a^b ω_{γ(t)}(γ̇(t)) d t$

---

= 6. Exact and Closed Forms

- A 1-form $ω$ is [*exact*] if there exists $f$ such that $ω = d f$.
- A 1-form is [*closed*] if $d ω = 0$.

On $ℝ^n$, every closed 1-form is locally exact (Poincaré Lemma).

---

= 7. Summary

- 1-forms are dual to vector fields.
- They can be written in local coordinates as linear combinations of $d x^i$.
- They can be integrated along curves.
- They are central in multivariable calculus, differential geometry, and physics.

#pagebreak()

#align(center)[
  *End of Lecture*
]



// #import "@preview/obsidius:0.1.0": *

// // change the title of the document here
// #show: notes.with("My notes");

// Now just start writing!

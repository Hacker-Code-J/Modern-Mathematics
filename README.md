# Modern-Mathematics

## Introduction

This repository contains comprehensive course materials for graduate-level mathematics, including topics like set theory, real analysis, topology, linear algebra and abstract algebra. The content is structured in TeX documents, which include detailed notes, diagrams, and proofs.

## Structure

### Core Materials (`grad-math-full`)
This directory is the core of the repository, featuring detailed documents for various topics in graduate-level mathematics:
- `grad-math-[n].tex`: Main source files for each topic.
- `grad-math-[n].pdf`: Compiled PDFs from the TeX files.

#### Topics Covered in the `grad-math-full` Folder

The `grad-math-full` directory contains detailed documents for graduate-level mathematics courses, organized by specific topics in each document:

---
##### Set Theory
<details>
<summary><strong>grad-math-1.tex/pdf</strong>: Set Theory I</summary>
<ul>
<li>Set, Power Set, Cartesian Product</li>
<li>Union, Intersection, Complement</li>
<li>Function, Image, Pre-image</li>
<li>Injection, Surjection, Bijection</li>
<li>Axiom of Choice</li>
</ul>
</details>

<details>
<summary><strong>grad-math-2.tex/pdf</strong>: Set Theory II</summary>
<ul>
<li>Relation, Equivalence Relation</li>
<li>Equivalence Class, Partition</li>
</ul>
</details>

##### Advanced Calculus and Topology

<details>
<summary><strong>grad-math-3.tex/pdf</strong>: Advanced Calculus I</summary>
<ul>
<li>Boundedness, Supremum and Infimum</li>
<li>Least Upper Bound Property (Completeness Axiom)</li>
<li>Well-Ordering Principle and Mathematical Induction</li>
<li>Archimedean Property</li>
</ul>
</details>

<details>
<summary><strong>grad-math-4.tex/pdf</strong>: Advanced Calculus II</summary>
<ul>
<li>Convergence of Sequences</li>
<li>Inequality Rule for Absolute Values</li>
<li>Limit Theorem (Algebraic Property of Limit of Sequence)</li>
</ul>
</details>

<details>
<summary><strong>grad-math-5.tex/pdf</strong>: Topology I</summary>
<ul>
<li>Topology and Topological Space</li>
<li>Open Set</li>
<li>Continuous Mapping</li>
<li>Distance Function and Metric Space</li>
<li>Convergence of Sequences; Continuity of Functions</li>
</ul>
</details>

<details>
<summary><strong>grad-math-6.tex/pdf</strong>: Advanced Calculus III</summary>
<ul>
<li>Limit of a Function</li>
<li>Continuity of a Function</li>
<li>Monotone Convergent Theorem (MCT)</li>
<li>Nested Interval Property (NIP)</li>
<li>Bolzano-Weierstrass Theorem</li>
<li>Limit Superior and Limit Inferior</li>
</ul>
</details>

##### Linear Algebra and Abstract Algebra

<details>
<summary><strong>grad-math-7.tex/pdf</strong>: Algebraic Structures </summary>
<ul>
<li>Group</li>
<li>Ring</li>
<li>Field</li>
<li>Module</li>
<li>Vector Space</li>
<li>Algebra</li>
</ul>
</details>

<details>
<summary><strong>grad-math-8.tex/pdf</strong>: Linear Algebra I </summary>
<ul>
<li>Linear Combination, Spanning Set</li>
<li>Linearly Independent and Dependent</li>
<li>(Hamel) Basis</li>
<li>Partial Order, POSET</li>
<li>Total Order (Linear Order), TOSET</li>
<li>Maximal, Minimal, Hasse Diagram</li>
<li>Chain, Zorn's Lemma</li>
<li>Hamel Basis Theorem (Existence of Basis)</li>
<li>Invariance of Basis Cardinality; Dimension of Vector Space</li>
</ul>
</details>

<details>
<summary><strong>grad-math-9.tex/pdf</strong>: Linear Algebra II </summary>
<ul>
<li>Uniqueness of Representation with respect to a Basis; Coordinate</li>
<li>Linear Transformation</li>
<li>Vector Space Isomorphism (Linear Isomorphism)</li>
<li>Classification of Vector Space (up to Isomorphism)</li>
<li>Matrix Representation of a Linear Transformation</li>
<li>TBA</li>
</ul>
</details>

<details>
<summary><strong>grad-math-10.tex/pdf</strong>: Linear Algebra to Abstract Algebra</summary>
<ul>
<li>Subspace; Span</li>
<li>Subgroup</li>
<li>Homomorphism; Monomorphism; Epimorphism</li>
<li>Isomorphism</li>
<li>Kernel and Image</li>
</ul>
</details>

<details>
<summary><strong>grad-math-11.tex/pdf</strong>: Abstract Algebra I</summary>
<ul>
<li>Cyclic Group<li>
<li>TBA</li>
</ul>
</details>

<details>
<summary><strong>grad-math-12.tex/pdf</strong>: Abstract Algebra II (TBA) </summary>
<ul>
<li>TBA</li>
</ul>
</details>

---

Each `.tex` file is accompanied by a `.pdf` version which is the compiled and formatted version of the LaTeX document. These documents provide an in-depth look at the fundamental and advanced topics necessary for graduate-level studies in mathematics.

<!--
### Supplementary Materials
- `abstract-algebra/`: Additional notes and resources on abstract algebra.
- `chapter/`: Chapter-wise breakdown of topics.
- `code/`: Example codes, primarily in SageMath, for computational mathematics.
- `preamble/`, `tikz/`, and other directories: Contain various support files like LaTeX preamble settings, TikZ diagrams, custom LaTeX commands, and theorem environments.

### Practice and Examples
- `tikz/`: Extensive examples of mathematical diagrams created using TikZ.
- `latex-practice.tex`: A document to practice LaTeX skills.

### Documentation
- `README.md`: This file.
- `LICENSE`: Licensing information for the use of this repository.
-->

## Usage

To compile the documents, you need a TeX distribution such as TeX Live:
1. Install TeX Live: [Installation Guide](https://www.tug.org/texlive/acquire.html).
2. Navigate to the desired directory.
3. Use the command `pdflatex <file-name.tex>` to compile a file to PDF.

## Contributing

Contributions to the repository are welcome. To contribute:
1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request.

## License

This repository is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

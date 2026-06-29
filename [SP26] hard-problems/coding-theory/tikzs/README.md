# Coding-theory TikZ figures

Standalone TikZ sources for the coding-theory presentation. This repo's
presentation asset directory is `presentation/tikzs` (plural).

Compile from this directory with:

```sh
latexmk -pdf <figure>.tex
```

Use a compiled figure in a Beamer slide with:

```tex
\includegraphics[width=.86\textwidth]{tikzs/<figure>.pdf}
```

## Linear codes

- `linear-code-subspace.tex`
- `linear-encoding-map.tex`
- `linear-parity-check-syndrome.tex`
- `linear-coset-standard-array.tex`
- `linear-distance-balls.tex`

## Hamming codes

- `hamming-syndrome-decoder.tex`
- `hamming-fano-plane.tex`
- `hamming-perfect-packing.tex`
- `hamming-parity-coverage.tex`
- `hamming-secded-flow.tex`

## Cyclic codes

- `cyclic-shift-wheel.tex`
- `cyclic-polynomial-quotient.tex`
- `cyclic-generator-shift-matrix.tex`
- `cyclic-roots-cosets-bch.tex`
- `cyclic-lfsr-encoder.tex`

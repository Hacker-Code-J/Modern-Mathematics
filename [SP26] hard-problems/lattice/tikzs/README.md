# Lattice TikZ figures

The lattice deck currently keeps its diagrams inline in the chapter files so
each slide can be edited in context.

If a diagram grows large, move it into this directory as a standalone TikZ
source and include the compiled PDF from Beamer:

```sh
latexmk -pdf <figure>.tex
```

```tex
\includegraphics[width=.86\textwidth]{tikzs/<figure>.pdf}
```

# Two-torsion (real) and vertical line case.
# Curve: y^2 = 4 x^3 - g_2 x - g_3, g_2=4, g_3=0.

from sage.all import RDF, var, solve

g2 = RDF(4); g3 = RDF(0)
x = var('x')
roots = solve(4*x**3 - g2*x - g3 == 0, x)
ee = sorted([RDF(r.rhs()) for r in roots])
e1, e2, e3 = ee
print("Two-torsion x-coords: e_1={:.4f}, e_2={:.4f}, e_3={:.4f}".format(
    float(e1), float(e2), float(e3)))

# Vertical line case: choose x in (-1,0) (on the oval) or (1,infty)
def y_plus(xv):
    val = 4*xv**3 - g2*xv - g3
    return RDF(val).sqrt() if val >= 0 else None

x_vert = RDF(1.50)
y_vert = y_plus(x_vert)
print("Vertical line x={:.4f}, meets curve at y=+/-{:.4f}".format(
    float(x_vert), float(y_vert)))

with open("coords_torsion.tex", "w") as f:
    f.write("% real 2-torsion x-coords\n")
    f.write(r"\newcommand{\torstwoone}{%.4f}" % float(e1) + "\n")
    f.write(r"\newcommand{\torstwotwo}{%.4f}" % float(e2) + "\n")
    f.write(r"\newcommand{\torstwothree}{%.4f}" % float(e3) + "\n")
    f.write("% vertical-line P = (x_vert, +y_vert), -P = (x_vert, -y_vert)\n")
    f.write(r"\newcommand{\vertx}{%.4f}" % float(x_vert) + "\n")
    f.write(r"\newcommand{\verty}{%.4f}" % float(y_vert) + "\n")
print("Wrote coords_torsion.tex")

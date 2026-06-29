# Chord (secant) law for distinct points.
# Curve: y^2 = 4 x^3 - g_2 x - g_3, with g_2=4, g_3=0.
#
# Given P = (x_P, y_P), Q = (x_Q, y_Q) on the curve, the line PQ has
# slope m = (y_Q - y_P)/(x_Q - x_P), intercept c = y_P - m*x_P.
# Substituting y = m*x + c into the curve gives a cubic in x whose
# roots are x_P, x_Q, x_R; Vieta gives x_R = m^2/4 - x_P - x_Q.
# Then y_R = m*x_R + c, and P+Q = (x_R, -y_R).
#
# We choose P on the oval and Q on the unbounded branch.

from sage.all import RDF, sqrt

g2 = RDF(4); g3 = RDF(0)

def y_plus(xv):
    val = 4*xv**3 - g2*xv - g3
    return RDF(val).sqrt()

# Choose P on oval (so x in (-1, 0)) and Q on unbounded branch (x >= 1)
x_P = RDF(-0.55)
y_P = y_plus(x_P)
x_Q = RDF(1.45)
y_Q = y_plus(x_Q)

m = (y_Q - y_P) / (x_Q - x_P)
c = y_P - m*x_P

# Third intersection by Vieta
x_R = m**2 / 4 - x_P - x_Q
y_R = m*x_R + c

# Sum: P + Q = (x_R, -y_R)
x_S = x_R; y_S = -y_R

# Sanity: check (x_R, y_R) on the curve
print("P = ({:.4f}, {:.4f})".format(float(x_P), float(y_P)))
print("Q = ({:.4f}, {:.4f})".format(float(x_Q), float(y_Q)))
print("Line: y = {:.4f}*x + {:.4f}".format(float(m), float(c)))
print("R = ({:.4f}, {:.4f})  (third intersection)".format(float(x_R), float(y_R)))
print("P+Q = -R = ({:.4f}, {:.4f})".format(float(x_S), float(y_S)))
lhs = y_R**2
rhs = 4*x_R**3 - g2*x_R - g3
print("Sanity (y_R^2 - (4x_R^3 - g_2 x_R - g_3)) = {:.4e}".format(float(lhs - rhs)))

# Line clipping for TikZ: two endpoints just outside the visible curve
# Visible x window: [-1.4, 2.6] for our plot
x_left  = RDF(-1.10)
x_right = RDF( 2.55)
y_left  = m*x_left + c
y_right = m*x_right + c

with open("coords_chord.tex", "w") as f:
    f.write("% chord law: P on oval, Q on branch\n")
    f.write(r"\newcommand{\chordPx}{%.4f}" % float(x_P) + "\n")
    f.write(r"\newcommand{\chordPy}{%.4f}" % float(y_P) + "\n")
    f.write(r"\newcommand{\chordQx}{%.4f}" % float(x_Q) + "\n")
    f.write(r"\newcommand{\chordQy}{%.4f}" % float(y_Q) + "\n")
    f.write(r"\newcommand{\chordRx}{%.4f}" % float(x_R) + "\n")
    f.write(r"\newcommand{\chordRy}{%.4f}" % float(y_R) + "\n")
    f.write(r"\newcommand{\chordSx}{%.4f}" % float(x_S) + "\n")
    f.write(r"\newcommand{\chordSy}{%.4f}" % float(y_S) + "\n")
    f.write(r"\newcommand{\chordlefta}{%.4f}" % float(x_left) + "\n")
    f.write(r"\newcommand{\chordleftb}{%.4f}" % float(y_left) + "\n")
    f.write(r"\newcommand{\chordrighta}{%.4f}" % float(x_right) + "\n")
    f.write(r"\newcommand{\chordrightb}{%.4f}" % float(y_right) + "\n")
print("Wrote coords_chord.tex")

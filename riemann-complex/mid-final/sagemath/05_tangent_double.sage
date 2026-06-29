# Tangent doubling 2P.
# Curve: y^2 = 4 x^3 - g_2 x - g_3, g_2=4, g_3=0.
#
# At P=(x_P, y_P), implicit differentiation gives the slope of the
# tangent line: 2 y y' = 12 x^2 - g_2  =>  y' = (12 x^2 - g_2)/(2y).
# The tangent line is y = m*x + c with m = y'(P), c = y_P - m*x_P.
# Substituting into the cubic gives a cubic whose roots are
# x_P (double) and x_R, so x_P + x_P + x_R = m^2/4, i.e.
# x_R = m^2/4 - 2 x_P.
# Then y_R = m*x_R + c, and 2P = (x_R, -y_R).
#
# We choose P on the oval (small) so that 2P lands on the unbounded
# branch and produces a visually clear figure.

from sage.all import RDF

g2 = RDF(4); g3 = RDF(0)

def y_plus(xv):
    val = 4*xv**3 - g2*xv - g3
    return RDF(val).sqrt()

x_P = RDF(-0.30)
y_P = y_plus(x_P)

# Tangent slope
m = (12*x_P**2 - g2) / (2*y_P)
c = y_P - m*x_P

# Third intersection
x_R = m**2 / 4 - 2*x_P
y_R = m*x_R + c

x_2P = x_R; y_2P = -y_R

print("P  = ({:.4f}, {:.4f})".format(float(x_P), float(y_P)))
print("tangent slope m = {:.4f}".format(float(m)))
print("intercept c     = {:.4f}".format(float(c)))
print("R  = ({:.4f}, {:.4f})  (second intersection)".format(float(x_R), float(y_R)))
print("2P = ({:.4f}, {:.4f})".format(float(x_2P), float(y_2P)))
lhs = y_R**2
rhs = 4*x_R**3 - g2*x_R - g3
print("Sanity (y_R^2 - 4x_R^3 + g_2 x_R + g_3) = {:.4e}".format(float(lhs - rhs)))

# Endpoints of tangent line for clipping
x_left  = RDF(-1.10)
x_right = RDF( 2.55)
y_left  = m*x_left + c
y_right = m*x_right + c

with open("coords_tangent.tex", "w") as f:
    f.write("% tangent doubling\n")
    f.write(r"\newcommand{\dblPx}{%.4f}" % float(x_P) + "\n")
    f.write(r"\newcommand{\dblPy}{%.4f}" % float(y_P) + "\n")
    f.write(r"\newcommand{\dblslope}{%.4f}" % float(m) + "\n")
    f.write(r"\newcommand{\dblRx}{%.4f}" % float(x_R) + "\n")
    f.write(r"\newcommand{\dblRy}{%.4f}" % float(y_R) + "\n")
    f.write(r"\newcommand{\dbltwoPx}{%.4f}" % float(x_2P) + "\n")
    f.write(r"\newcommand{\dbltwoPy}{%.4f}" % float(y_2P) + "\n")
    f.write(r"\newcommand{\dbllefta}{%.4f}" % float(x_left) + "\n")
    f.write(r"\newcommand{\dblleftb}{%.4f}" % float(y_left) + "\n")
    f.write(r"\newcommand{\dblrighta}{%.4f}" % float(x_right) + "\n")
    f.write(r"\newcommand{\dblrightb}{%.4f}" % float(y_right) + "\n")
print("Wrote coords_tangent.tex")

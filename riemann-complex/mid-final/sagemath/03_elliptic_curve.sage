# Elliptic curve y^2 = 4x^3 - g_2 x - g_3
# with g_2 = 4, g_3 = 0  =>  y^2 = 4x(x-1)(x+1).
# Roots: x = -1, 0, +1.  Oval on [-1, 0], unbounded branch on [+1, infty).

from sage.all import RDF, var, solve, factor, QQ, RIF

g2 = RDF(4)
g3 = RDF(0)
x = var('x')

# Find roots of 4 x^3 - g_2 x - g_3 = 0
roots = solve(4*x**3 - g2*x - g3 == 0, x)
ee = sorted([RDF(r.rhs()) for r in roots])
e1, e2, e3 = ee
print("e_1 =", e1, "  e_2 =", e2, "  e_3 =", e3)
print("oval branch x in [{:.4f}, {:.4f}]".format(float(e1), float(e2)))
print("unbounded branch x >= {:.4f}".format(float(e3)))

# Sample points on the two branches at chosen x-coordinates
def y_plus(xv):
    val = 4*xv**3 - g2*xv - g3
    if val < 0: return None
    return RDF(val).sqrt()

x_P_oval = RDF(-0.4)
x_Q_oval = RDF(-0.2)
x_branch = RDF(1.3)
x_far = RDF(2.0)

P_oval_x, P_oval_y = x_P_oval, y_plus(x_P_oval)
Q_oval_x, Q_oval_y = x_Q_oval, y_plus(x_Q_oval)
branch_x, branch_y = x_branch, y_plus(x_branch)
far_x, far_y = x_far, y_plus(x_far)

print()
print("Sample point on oval at x=-0.4 : ({:.4f}, {:.4f})".format(float(P_oval_x), float(P_oval_y)))
print("Sample point on oval at x=-0.2 : ({:.4f}, {:.4f})".format(float(Q_oval_x), float(Q_oval_y)))
print("Sample point on branch at x=1.3 : ({:.4f}, {:.4f})".format(float(branch_x), float(branch_y)))
print("Sample point on branch at x=2.0 : ({:.4f}, {:.4f})".format(float(far_x), float(far_y)))

with open("coords_curve.tex", "w") as f:
    f.write("% elliptic curve y^2 = 4x^3 - 4x\n")
    f.write(r"\newcommand{\curvegtwo}{%.4f}" % float(g2) + "\n")
    f.write(r"\newcommand{\curvegthree}{%.4f}" % float(g3) + "\n")
    f.write(r"\newcommand{\rooteone}{%.4f}" % float(e1) + "\n")
    f.write(r"\newcommand{\rootetwo}{%.4f}" % float(e2) + "\n")
    f.write(r"\newcommand{\rootethree}{%.4f}" % float(e3) + "\n")
print("Wrote coords_curve.tex")

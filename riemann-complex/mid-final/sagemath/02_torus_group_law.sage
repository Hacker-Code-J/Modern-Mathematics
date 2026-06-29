# Torus group law: choose two points [u], [v] inside the fundamental
# parallelogram P_Lambda, compute u+v (lifted), and its representative
# inside P_Lambda after subtracting the appropriate lattice vector.

from sage.all import RDF

omega1 = RDF(2.4) + RDF(0.25)*I
omega2 = RDF(0.7) + RDF(1.7)*I

# Choose representatives [u], [v] with barycentric coords in (0,1)^2
# Use the same coordinates as the original figure for continuity.
s_u, t_u = RDF(0.40), RDF(0.30)
s_v, t_v = RDF(0.70), RDF(0.60)

u   = s_u*omega1 + t_u*omega2
v   = s_v*omega1 + t_v*omega2
s   = u + v   # uplifted sum

# Reduce s back into P_Lambda by subtracting integer multiples of the
# basis: we solve s = a*omega1 + b*omega2, then reduce a,b mod 1.
# In matrix form:
#   [ a ] = [ Re w1  Re w2 ]^{-1} [ Re s ]
#   [ b ]   [ Im w1  Im w2 ]     [ Im s ]
from sage.all import Matrix
M = Matrix(RDF, [[omega1.real(), omega2.real()],
                 [omega1.imag(), omega2.imag()]])
rhs = Matrix(RDF, [[s.real()], [s.imag()]])
ab = M.inverse() * rhs
a = ab[0,0]; b = ab[1,0]
# Reduce mod 1
import math
a_red = a - math.floor(a)
b_red = b - math.floor(b)
s_red = a_red*omega1 + b_red*omega2

print("u   = ({:.4f}, {:.4f})".format(float(u.real()), float(u.imag())))
print("v   = ({:.4f}, {:.4f})".format(float(v.real()), float(v.imag())))
print("u+v = ({:.4f}, {:.4f})  (uplifted)".format(float(s.real()), float(s.imag())))
print("(a,b) before mod = ({:.4f}, {:.4f})".format(float(a), float(b)))
print("(a,b) after  mod = ({:.4f}, {:.4f})".format(float(a_red), float(b_red)))
print("[u+v]= ({:.4f}, {:.4f})  (in P_Lambda)".format(float(s_red.real()), float(s_red.imag())))
delta = s - s_red
print("translation = -({:.4f}, {:.4f}) (lattice vector)".format(float(delta.real()), float(delta.imag())))

with open("coords_group.tex", "w") as f:
    f.write("% torus group law: u, v, u+v (lifted), and [u+v] in P_Lambda\n")
    f.write(r"\newcommand{\grupux}{%.4f}" % float(u.real()) + "\n")
    f.write(r"\newcommand{\grupuy}{%.4f}" % float(u.imag()) + "\n")
    f.write(r"\newcommand{\grupvx}{%.4f}" % float(v.real()) + "\n")
    f.write(r"\newcommand{\grupvy}{%.4f}" % float(v.imag()) + "\n")
    f.write(r"\newcommand{\grupsumx}{%.4f}" % float(s.real()) + "\n")
    f.write(r"\newcommand{\grupsumy}{%.4f}" % float(s.imag()) + "\n")
    f.write(r"\newcommand{\grupredx}{%.4f}" % float(s_red.real()) + "\n")
    f.write(r"\newcommand{\grupredy}{%.4f}" % float(s_red.imag()) + "\n")
print("Wrote coords_group.tex")

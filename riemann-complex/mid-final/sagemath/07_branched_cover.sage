# For the 2:1 branched cover wp: T -> CP^1 we need:
#   - the four ramification points on T (the 2-torsion):
#         [0], [w1/2], [w2/2], [(w1+w2)/2]
#   - their wp-images, which are the three roots e_1,e_2,e_3 plus infinity.
#
# We use a symbolic lattice and the Weierstrass invariants g_2 = 4,
# g_3 = 0 (square lattice up to scaling).  This forces e_i = -1,0,1.

from sage.all import RDF

omega1 = RDF(2.4) + RDF(0.25)*I
omega2 = RDF(0.7) + RDF(1.7)*I

# Half-lattice points (in C):
p0   = 0*omega1
p1   = omega1/2
p2   = omega2/2
p12  = (omega1 + omega2)/2

print("Ramification points on T (lattice coords on C):")
for name, p in [("[0]", p0), ("[w1/2]", p1), ("[w2/2]", p2), ("[(w1+w2)/2]", p12)]:
    print("  {:<14} = ({:.4f}, {:.4f})".format(name, float(p.real()), float(p.imag())))

# For visual placement on a donut torus we need angular positions
# (latitude/longitude).  Choose the natural identification:
#   longitude theta = 2*pi * s     where u = s*w1 + t*w2  (s in [0,1))
#   latitude  phi   = 2*pi * t
# Then on a donut of radii R > r > 0, the position is
#   X(s,t) = ((R + r cos phi) cos theta, (R + r cos phi) sin theta, r sin phi)
# For a 2D ASCII-like sketch we project to (x,y) of the donut "side view":
#   we just want the 4 ramification points in the figure's local coords.
import math

R_outer = 2.10
r_inner = 0.90 # half-axis of outer ellipse in TikZ

# 2D donut "front view" approximation: use (R + r cos phi) * cos theta on horiz axis,
# (R + r cos phi) * (small sin theta) for "depth" effect dropped to 0 in our flat sketch.
def front_view(s, t):
    theta = 2*math.pi*s
    phi   = 2*math.pi*t
    R = R_outer
    r = r_inner
    X = (R + 0.5*r*math.cos(phi)) * math.cos(theta) * 0.9
    Y = (R + 0.5*r*math.cos(phi)) * math.sin(theta) * 0.42
    return X, Y

# Ramification points correspond to (s,t) in {0, 1/2}^2.
labels_and_st = [
    ("zero",    0,   0  ),
    ("halfone", 0.5, 0  ),
    ("halftwo", 0,   0.5),
    ("halfsum", 0.5, 0.5),
]
front = {}
for name, s, t in labels_and_st:
    front[name] = front_view(s, t)
    print("  {:<10} (s,t)=({},{}) -> front=({:.4f}, {:.4f})".format(
        name, s, t, *front[name]))

# Weierstrass roots e_1 = -1, e_2 = 0, e_3 = 1 with our g_2=4, g_3=0
print()
print("Weierstrass roots: e_1=-1, e_2=0, e_3=1 (since 4x^3-4x=4x(x-1)(x+1))")
print("and the fourth ramification value is infinity.")

with open("coords_branch.tex", "w") as f:
    f.write("% Donut-front projection of the 4 ramification points on T\n")
    for name in ["zero","halfone","halftwo","halfsum"]:
        x, y = front[name]
        f.write(r"\newcommand{\branch%sx}{%.4f}" % (name, x) + "\n")
        f.write(r"\newcommand{\branch%sy}{%.4f}" % (name, y) + "\n")
    f.write("% Weierstrass roots\n")
    f.write(r"\newcommand{\weieone}{-1.0000}" + "\n")
    f.write(r"\newcommand{\weietwo}{0.0000}"  + "\n")
    f.write(r"\newcommand{\weiethree}{1.0000}" + "\n")
print("Wrote coords_branch.tex")

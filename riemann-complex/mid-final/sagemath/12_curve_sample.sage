# Dense sample of the elliptic curve y^2 = 4x^3 - 4x for TikZ coordinate lists.
#
# Curve: y^2 = 4x(x-1)(x+1).  Real locus has two components:
#   Oval   : x in [e1, e2] = [-1, 0]  (compact component)
#   Branch : x in [e3, +inf) = [1, +inf)  (unbounded component)
#
# Oval parametrization (angle-uniform, smooth at branch points e1=-1 and e2=0):
#   x(phi) = (e1+e2)/2 + (e2-e1)/2 * cos(phi) = -1/2 + (1/2)*cos(phi),  phi in [0, pi]
#   Upper arc: phi goes pi -> 0  (x: -1 -> 0, y > 0)
#   Lower arc: phi goes 0 -> pi  (x:  0 -> -1, y < 0)
#   Full oval for smooth-cycle: upper arc + lower arc (share endpoints)
#
# Branch parametrization: uniform in phi where x = 1 + phi^2 * scale,
# which gives denser sampling near the branch point x=1 (vertical tangent).
# We clip at y = Y_CLIP.
#
# All coordinates in the raw curve coordinate system:
#   x in [-1.5, 2.6],  y in [-Y_CLIP, Y_CLIP].
# The TikZ figure scales these with a scope scale.

import math

Y_CLIP = 3.50     # y-axis clip value
N_OVAL = 200      # angle steps for the oval (each of upper/lower arc)
N_BRANCH = 200    # steps for the branch

# ---------------------------------------------------------------------------
# Oval
# ---------------------------------------------------------------------------
def y_oval(x):
    val = 4.0*x**3 - 4.0*x
    return math.sqrt(max(0.0, val))

oval_upper = []   # upper arc: x from -1 to 0, y >= 0
oval_lower = []   # lower arc: x from 0 to -1, y <= 0  (reversed x-order)

for k in range(N_OVAL + 1):
    phi = math.pi * (1.0 - k / N_OVAL)   # phi: pi -> 0
    x = -0.5 + 0.5 * math.cos(phi)       # x: -1 -> 0
    y = y_oval(x)
    oval_upper.append((x,  y))
    oval_lower.append((x, -y))

# Reverse lower so it goes x: 0 -> -1 (closed loop with upper)
oval_lower_rev = list(reversed(oval_lower))

# Full oval for \plot[smooth cycle]: upper (L->R) + lower (R->L), no repeated endpoint
oval_full = oval_upper + oval_lower_rev[1:-1]

# ---------------------------------------------------------------------------
# Branch  (use  x = 1 + t^2  reparametrization so t=0 -> x=1 smoothly)
# ---------------------------------------------------------------------------
# Determine t_max such that y(x(t_max)) = Y_CLIP
# y^2 = 4x^3 - 4x,  x = 1 + t^2
# Solve numerically for t_max.
def y_branch(x):
    val = 4.0*x**3 - 4.0*x
    return math.sqrt(max(0.0, val))

t_max = 0.0
for _t in [i * 0.01 for i in range(1, 300)]:
    _x = 1.0 + _t**2
    if y_branch(_x) >= Y_CLIP:
        t_max = _t
        break
if t_max == 0.0:
    t_max = 1.5   # fallback

branch_upper = []
branch_lower = []
for k in range(N_BRANCH + 1):
    t = t_max * k / N_BRANCH
    x = 1.0 + t**2
    y = y_branch(x)
    if y > Y_CLIP:
        y = Y_CLIP
    branch_upper.append((x,  y))
    branch_lower.append((x, -y))

# ---------------------------------------------------------------------------
# Output
# ---------------------------------------------------------------------------
def coord_list(pts):
    return " ".join("({:.4f},{:.4f})".format(x, y) for (x, y) in pts)

with open("coords_curve_sample.tex", "w") as fout:
    fout.write("% Elliptic curve y^2 = 4x^3 - 4x sample points.\n")
    fout.write("% Computed by sagemath/12_curve_sample.sage.\n")
    fout.write("% Oval: angle-uniform, " + str(N_OVAL) + " steps per half-arc.\n")
    fout.write("% Branch: t^2 reparametrization, " + str(N_BRANCH)
               + " steps, y clipped at " + "{:.2f}".format(Y_CLIP) + ".\n")
    # Oval: separate upper and lower arcs (for individual drawing)
    fout.write(r"\newcommand{\curveOvalUpper}{" + coord_list(oval_upper) + "}\n")
    fout.write(r"\newcommand{\curveOvalLower}{" + coord_list(list(reversed(oval_lower))) + "}\n")
    # Oval: full cycle (upper L->R, lower R->L) for \plot[smooth cycle]
    fout.write(r"\newcommand{\curveOvalFull}{" + coord_list(oval_full) + "}\n")
    # Branch arcs
    fout.write(r"\newcommand{\curveBranchUpper}{" + coord_list(branch_upper) + "}\n")
    fout.write(r"\newcommand{\curveBranchLower}{" + coord_list(branch_lower) + "}\n")
    # Clip and x-range metadata
    fout.write(r"\newcommand{\curveYclip}{%.4f}" % Y_CLIP + "\n")
    fout.write(r"\newcommand{\curveXmaxBranch}{%.4f}" % branch_upper[-1][0] + "\n")

# Diagnostic output
print("Oval: {} upper + {} lower points".format(len(oval_upper), len(oval_lower)))
print("  y_max on oval (at x=-0.5): {:.4f}".format(y_oval(-0.5)))
print("Branch: {} points, x in [{:.4f}, {:.4f}], y clipped at {:.2f}".format(
    len(branch_upper), branch_upper[0][0], branch_upper[-1][0], Y_CLIP))
print("  t_max = {:.4f}, x_max = {:.4f}".format(t_max, 1.0 + t_max**2))
print("Wrote coords_curve_sample.tex")

# Precise sphere (Riemann sphere CP^1) rendering for TikZ.
#
# Parameterization (unit sphere):
#   X(u,v) = (sin u cos v, sin u sin v, cos u),
#   u in [0, pi]   -- polar angle (0 = north pole, pi = south pole),
#   v in [0, 2 pi) -- azimuthal angle.
#
# Camera at infinity in direction (0, -cos gamma, sin gamma), so the
# camera is in front (negative Y) and above (positive Z).  Projection:
#   x_2d = X
#   y_2d = Y sin gamma + Z cos gamma.
#
# With this convention the north pole (0,0,1) projects to (0, cos gamma)
# at the TOP of the image, and the south pole to (0, -cos gamma) at the
# BOTTOM.  The equator (u = pi/2) projects to an ellipse with semi-axes
# (1, sin gamma).
#
# Visibility: surface normal at (u,v) equals position vector (sin u cos v,
# sin u sin v, cos u).  A point is visible iff the normal has positive
# dot product with the camera direction (0, -cos gamma, sin gamma):
#     n_visible(u,v) = -sin u sin v cos gamma + cos u sin gamma > 0
#   <=> cos u sin gamma > sin u sin v cos gamma.
#
# Silhouette: n_visible = 0 <=> tan u = tan gamma / sin v.

from sage.all import RDF, pi, cos, sin, atan, sqrt, srange
import math

R   = RDF(1.0)
gamma = RDF(30.0) * RDF(pi) / RDF(180)   # elevation angle of camera

cg = cos(gamma); sg = sin(gamma)

def proj(X, Y, Z):
    """Orthographic projection."""
    return (RDF(X), RDF(Y)*sg + RDF(Z)*cg)

def sphere_point(u, v):
    X = R * sin(u) * cos(v)
    Y = R * sin(u) * sin(v)
    Z = R * cos(u)
    return X, Y, Z

def visible(u, v):
    """True iff visible from camera at (0, -cos gamma, sin gamma)."""
    return cos(u)*sg - sin(u)*sin(v)*cg > 0

# -- Silhouette: the great circle perpendicular to the camera direction --
# Solve cos u sin gamma = sin u sin v cos gamma  =>  tan u = tan gamma / sin v.
# For v=0 the silhouette passes through u = pi/2 (equator).
# Projects to a circle of radius R = 1 (verified analytically).
N_silh = 200
silh = []
for k in range(N_silh + 1):
    v = RDF(2)*RDF(pi)*RDF(k)/N_silh
    if abs(sin(v)) < 1e-9:
        u = RDF(pi)/2
    else:
        u = atan(RDF(tan(gamma)) / RDF(sin(v)))
        # branch so that the point is at the silhouette (u in (0, pi))
        if u < 0:
            u = u + RDF(pi)
    X, Y, Z = sphere_point(u, v)
    silh.append(proj(X, Y, Z))

# -- Sample arcs (latitude and longitude curves) --

def sample_arcs(param_func, vis_func, n=240):
    """Sample a parametric curve, splitting at visibility changes."""
    chunks = []
    cur_vis = None
    cur = []
    for k in range(n+1):
        t = RDF(k)/n
        u, v = param_func(t)
        X, Y, Z = sphere_point(u, v)
        x, y = proj(X, Y, Z)
        vis = bool(vis_func(u, v))
        if cur_vis is None:
            cur_vis = vis
            cur = [(float(x), float(y))]
        elif vis == cur_vis:
            cur.append((float(x), float(y)))
        else:
            chunks.append((cur_vis, cur))
            cur_vis = vis
            cur = [(float(x), float(y))]
    if cur:
        chunks.append((cur_vis, cur))
    return chunks

def latitude_chunks(u0):
    """Parallel at fixed u = u0, v in [0, 2pi]."""
    return sample_arcs(lambda t: (u0, RDF(2)*RDF(pi)*t), visible)

def meridian_chunks(v0):
    """Meridian at fixed v = v0, u in [0, pi]."""
    return sample_arcs(lambda t: (RDF(pi)*t, v0), visible)

# Choose latitudes and meridians
NUM = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight"]

# Latitudes: equator + four parallels (two in each hemisphere)
latitude_us = [
    ("North",     RDF(pi)/6),
    ("Tropic",    RDF(pi)/3),
    ("Equator",   RDF(pi)/2),
    ("South",     2*RDF(pi)/3),
    ("Antarctic", 5*RDF(pi)/6),
]

# Meridians: eight longitudes spaced 22.5 deg apart
meridian_vs = [(NUM[k], RDF(k)*RDF(pi)/4) for k in range(8)]

def coord_list(pts):
    return " ".join("({:.4f},{:.4f})".format(x, y) for (x,y) in pts)

with open("coords_sphere.tex", "w") as f:
    f.write("% Precise sphere rendering computed by 10_sphere_render.sage\n")
    f.write("% Unit sphere, gamma = {:.2f} deg elevation\n".format(
        float(gamma*180/pi)))
    f.write(r"\newcommand{\spherer}{1.0000}" + "\n")
    f.write(r"\newcommand{\spheregamma}{%.4f}" % float(gamma*180/pi) + "\n")
    # closed silhouette
    silh_closed = silh + [silh[0]]
    f.write(r"\newcommand{\sphereOutline}{")
    f.write(coord_list(silh_closed))
    f.write("}\n")
    # latitudes
    for name, u0 in latitude_us:
        chunks = latitude_chunks(u0)
        vis_chunks = [c for vis,c in chunks if vis]
        hid_chunks = [c for vis,c in chunks if not vis]
        for j, c in enumerate(vis_chunks):
            f.write(r"\newcommand{\sphereLat%sV%s}{" % (name, chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")
        for j, c in enumerate(hid_chunks):
            f.write(r"\newcommand{\sphereLat%sH%s}{" % (name, chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")
    # meridians
    for name, v0 in meridian_vs:
        chunks = meridian_chunks(v0)
        vis_chunks = [c for vis,c in chunks if vis]
        hid_chunks = [c for vis,c in chunks if not vis]
        for j, c in enumerate(vis_chunks):
            f.write(r"\newcommand{\sphereMer%sV%s}{" % (name, chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")
        for j, c in enumerate(hid_chunks):
            f.write(r"\newcommand{\sphereMer%sH%s}{" % (name, chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")
    # poles
    xN, yN = proj(0, 0, 1)
    xS, yS = proj(0, 0, -1)
    f.write(r"\newcommand{\sphereNorthx}{%.4f}" % float(xN) + "\n")
    f.write(r"\newcommand{\sphereNorthy}{%.4f}" % float(yN) + "\n")
    f.write(r"\newcommand{\sphereSouthx}{%.4f}" % float(xS) + "\n")
    f.write(r"\newcommand{\sphereSouthy}{%.4f}" % float(yS) + "\n")

print("gamma = {:.2f} deg, R = {:.4f}".format(float(gamma*180/pi), float(R)))
print("North pole projects to ({:.4f}, {:.4f})".format(float(xN), float(yN)))
print("South pole projects to ({:.4f}, {:.4f})".format(float(xS), float(yS)))
print("Equator ellipse semi-axes = ({:.4f}, {:.4f})".format(float(R), float(R*sg)))
print("Wrote coords_sphere.tex")

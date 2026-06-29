# Precise torus rendering for TikZ -- consistent with 10_sphere_render.sage.
#
# Parameterization:
#   X(u,v) = ((R + r cos u) cos v, (R + r cos u) sin v, r sin u),
#   u in [0, 2 pi)  -- small circle (meridian),
#   v in [0, 2 pi)  -- big circle (longitude).
#
# Camera: orthographic, camera at (0, -L cos theta, L sin theta), looking
# toward the origin, where theta is the elevation angle above the equator
# (theta = 0 is horizontal, theta = 90 deg is straight down).
#
# Image axes (look-up-right basis):
#   right    = (1, 0, 0)
#   up       = (0, sin theta, cos theta)   -- world +z appears at image top
#   forward  = (0, cos theta, -sin theta)
#
# Projection:
#   x_2d = X
#   y_2d = Y sin theta + Z cos theta.
#
# Visibility: surface normal N = (cos u cos v, cos u sin v, sin u).
# Camera direction from origin: (0, -cos theta, sin theta).  A point is
# visible iff its normal has positive dot product with that direction:
#     n_visible(u,v) = -cos u sin v cos theta + sin u sin theta > 0.
#
# Silhouette: n_visible(u,v) = 0  <=>  tan u = sin v * cot theta.
# Outer branch:  cos u > 0       (the outer rim of the donut tube).
# Inner branch:  cos u < 0       (the inner rim, bounding the donut hole).
#
# Critical condition for the hole to remain open:
# At v = pi/2 the inner silhouette projects to y_2d = R sin theta - r.
# The hole is non-degenerate iff R sin theta > r, i.e. theta > arcsin(r/R).
# For R=1.8, r=0.7 this gives theta_c = arcsin(7/18) ≈ 22.9 deg.
# We use theta = 60 deg, well above the threshold and matching the
# choice in 10_sphere_render.sage's family of views.

from sage.all import RDF, pi, cos, sin, atan, sqrt
import math

R_outer = RDF(1.80)
r_inner = RDF(0.70)
theta   = RDF(60.0) * RDF(pi) / RDF(180)   # camera elevation above equator

st = sin(theta); ct = cos(theta)

def proj(X, Y, Z):
    """Orthographic projection (front-above camera at elevation theta)."""
    return RDF(X), RDF(Y)*st + RDF(Z)*ct

def torus_point(u, v):
    X = (R_outer + r_inner*cos(u)) * cos(v)
    Y = (R_outer + r_inner*cos(u)) * sin(v)
    Z = r_inner * sin(u)
    return X, Y, Z

def visible(u, v):
    """True iff visible (front-above camera).
    Equivalent: sin u sin theta > cos u sin v cos theta."""
    return -cos(u)*sin(v)*ct + sin(u)*st > 0

# ---------------------------------------------------------------
# Silhouette curves.  Solve tan u = sin v * cot theta.
# Outer branch (cos u > 0) -> outer rim of tube.
# Inner branch (cos u < 0) -> donut-hole rim.
# ---------------------------------------------------------------
N_silh = 200
v_grid = [RDF(2)*RDF(pi)*RDF(k)/N_silh for k in range(N_silh+1)]

silh_outer = []
silh_inner = []
cot_t = cos(theta)/sin(theta)
for v in v_grid:
    s = RDF(sin(v))*cot_t
    u_out = atan(s)              # in (-pi/2, pi/2): cos > 0
    u_in  = u_out + RDF(pi)      # branch with cos < 0
    X,Y,Z = torus_point(u_out, v); x,y = proj(X,Y,Z)
    silh_outer.append((float(x), float(y)))
    X,Y,Z = torus_point(u_in,  v); x,y = proj(X,Y,Z)
    silh_inner.append((float(x), float(y)))

# ---------------------------------------------------------------
# Sampling helpers
# ---------------------------------------------------------------
def sample_meridian_arcs(v_val, n=240):
    """Meridian at fixed v: sample u in [0, 2 pi], split at visibility flips."""
    chunks = []
    cur_vis = None
    cur = []
    for k in range(n+1):
        u = RDF(2)*RDF(pi)*RDF(k)/n
        X,Y,Z = torus_point(u, v_val)
        x,y = proj(X,Y,Z)
        vis = bool(visible(u, v_val))
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

def sample_longitude_arcs(u_val, n=240):
    """Longitude (latitude circle) at fixed u: sample v in [0, 2 pi]."""
    chunks = []
    cur_vis = None
    cur = []
    for k in range(n+1):
        v = RDF(2)*RDF(pi)*RDF(k)/n
        X,Y,Z = torus_point(u_val, v)
        x,y = proj(X,Y,Z)
        vis = bool(visible(u_val, v))
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

# ---------------------------------------------------------------
# Output
# ---------------------------------------------------------------
def coord_list(pts):
    return " ".join("({:.4f},{:.4f})".format(x, y) for (x,y) in pts)

with open("coords_torus.tex", "w") as f:
    f.write("% Precise torus rendering computed by 08_torus_render.sage\n")
    f.write("% R={:.4f}, r={:.4f}, elevation theta={:.2f} deg\n".format(
        float(R_outer), float(r_inner), float(theta*180/pi)))
    f.write(r"\newcommand{\torusR}{%.4f}" % float(R_outer) + "\n")
    f.write(r"\newcommand{\torusr}{%.4f}" % float(r_inner) + "\n")

    silh_outer_closed = silh_outer + [silh_outer[0]]
    silh_inner_closed = silh_inner + [silh_inner[0]]
    f.write(r"\newcommand{\torusOuter}{")
    f.write(coord_list(silh_outer_closed))
    f.write("}\n")
    f.write(r"\newcommand{\torusInner}{")
    f.write(coord_list(silh_inner_closed))
    f.write("}\n")

    # 8 meridians at v = k pi/4
    NUM_NAMES = ["Zero","One","Two","Three","Four","Five","Six","Seven"]
    meridian_vs = [RDF(k)*RDF(pi)/4 for k in range(8)]
    for i, vv in enumerate(meridian_vs):
        chunks = sample_meridian_arcs(vv)
        vis_chunks = [c for vis,c in chunks if vis]
        hid_chunks = [c for vis,c in chunks if not vis]
        for j, c in enumerate(vis_chunks):
            f.write(r"\newcommand{\torusMer%sV%s}{" % (NUM_NAMES[i], chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")
        for j, c in enumerate(hid_chunks):
            f.write(r"\newcommand{\torusMer%sH%s}{" % (NUM_NAMES[i], chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")

    # 4 longitudes (latitude circles)
    longitude_us_labels = [(RDF(0),       "Outer"),
                          (RDF(pi)/2,    "Top"),
                          (RDF(pi),      "Inner"),
                          (3*RDF(pi)/2,  "Bottom")]
    for uu, name in longitude_us_labels:
        chunks = sample_longitude_arcs(uu)
        vis_chunks = [c for vis,c in chunks if vis]
        hid_chunks = [c for vis,c in chunks if not vis]
        for j, c in enumerate(vis_chunks):
            f.write(r"\newcommand{\torusLon%sV%s}{" % (name,chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")
        for j, c in enumerate(hid_chunks):
            f.write(r"\newcommand{\torusLon%sH%s}{" % (name,chr(65+j)))
            f.write(coord_list(c))
            f.write("}\n")

# Diagnostic prints
print("R = {:.4f},  r = {:.4f},  theta = {:.2f} deg".format(
    float(R_outer), float(r_inner), float(theta*180/pi)))
print("Critical elevation for non-degenerate hole: arcsin(r/R) = {:.2f} deg".format(
    float(math.degrees(math.asin(float(r_inner)/float(R_outer))))))
print()
print("Outer silhouette extremes:")
for v_deg in [0, 90, 180, 270]:
    v = RDF(v_deg)*RDF(pi)/180
    u = atan(RDF(sin(v))*cot_t)
    X,Y,Z = torus_point(u, v); x,y = proj(X,Y,Z)
    print("  v={:3d} deg: u={:6.2f} deg -> ({:7.4f}, {:7.4f})".format(
        v_deg, float(u*180/pi), float(x), float(y)))
print()
print("Inner silhouette extremes (donut hole boundary):")
for v_deg in [0, 90, 180, 270]:
    v = RDF(v_deg)*RDF(pi)/180
    u = atan(RDF(sin(v))*cot_t) + RDF(pi)
    X,Y,Z = torus_point(u, v); x,y = proj(X,Y,Z)
    print("  v={:3d} deg: u={:6.2f} deg -> ({:7.4f}, {:7.4f})".format(
        v_deg, float(u*180/pi), float(x), float(y)))
print()
print("Sanity: at v=pi/2 the inner silhouette projects to y = R sin theta - r = {:.4f}".format(
    float(R_outer * st - r_inner)))
print("Wrote coords_torus.tex")

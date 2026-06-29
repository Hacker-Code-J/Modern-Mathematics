# Lattice parameters and translates for the lattice tiling figure.
# Output: TikZ-ready coordinates for omega_1, omega_2 and a grid of
# lattice translates.

from sage.all import RDF

omega1 = RDF(2.4) + RDF(0.25)*I
omega2 = RDF(0.7) + RDF(1.7) *I

def fmt(z):
    return "({:.4f},{:.4f})".format(float(z.real()), float(z.imag()))

with open("coords_lattice.tex", "w") as f:
    f.write("% lattice basis\n")
    f.write(r"\newcommand{\latomegaone}{%s}" % fmt(omega1) + "\n")
    f.write(r"\newcommand{\latomegatwo}{%s}" % fmt(omega2) + "\n")
    f.write(r"\newcommand{\latomegasum}{%s}" % fmt(omega1+omega2) + "\n")
    f.write("% basis coordinates (numeric)\n")
    f.write(r"\newcommand{\latwax}{%.4f}" % float(omega1.real()) + "\n")
    f.write(r"\newcommand{\latway}{%.4f}" % float(omega1.imag()) + "\n")
    f.write(r"\newcommand{\latwbx}{%.4f}" % float(omega2.real()) + "\n")
    f.write(r"\newcommand{\latwby}{%.4f}" % float(omega2.imag()) + "\n")
    f.write(r"\newcommand{\latsxc}{%.4f}" % float((omega1+omega2).real()) + "\n")
    f.write(r"\newcommand{\latsyc}{%.4f}" % float((omega1+omega2).imag()) + "\n")
    f.write(r"\newcommand{\latcellcx}{%.4f}" % float((omega1+omega2).real()/2) + "\n")
    f.write(r"\newcommand{\latcellcy}{%.4f}" % float((omega1+omega2).imag()/2) + "\n")

print("omega_1 =", omega1)
print("omega_2 =", omega2)
print("omega_1+omega_2 =", omega1+omega2)
print("|omega_1| = {:.4f}".format(float(abs(omega1))))
print("|omega_2| = {:.4f}".format(float(abs(omega2))))
print("tau = omega_2/omega_1 = {:.4f} + {:.4f} i".format(
    float((omega2/omega1).real()), float((omega2/omega1).imag())))
print("Im(tau) > 0 ?", bool((omega2/omega1).imag() > 0))
print("Lattice cell area = Im(omega_1 bar(omega_2)) = {:.4f}".format(
    float((omega1.real()*omega2.imag() - omega1.imag()*omega2.real()))))
print("Wrote coords_lattice.tex")

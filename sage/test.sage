# Import necessary libraries
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D

# Define the function
def f(z):
    return z**2 - 1  # Note the use of `**` for exponentiation in Python

# Create a grid of x and y values
x_min, x_max = -2, 2
y_min, y_max = -2, 2
resolution = 300
x = np.linspace(x_min, x_max, resolution)
y = np.linspace(y_min, y_max, resolution)
xx, yy = np.meshgrid(x, y)
zz = xx + 1j * yy  # Combine x and y into complex numbers
fz_real = f(zz).real  # Compute only the real part of f(z)

# Create a 3D plot
fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection='3d')

# Plot the surface
surf = ax.plot_surface(xx, yy, fz_real, cmap='viridis', edgecolor='k', alpha=0.9)

# Add color bar
fig.colorbar(surf, ax=ax, shrink=0.5, aspect=10, label="Re(f(z))")

# Set labels and title
ax.set_xlabel("Re(z)")
ax.set_ylabel("Im(z)")
ax.set_zlabel("Re(f(z))")
ax.set_title("3D Plot of the Real Part of $f(z) = z^2 - 1$")

# Show the plot
plt.show()


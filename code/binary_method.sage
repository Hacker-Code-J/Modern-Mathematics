import matplotlib.pyplot as plt
import numpy as np

def binary_sqrt(number, precision=1e-10, max_iter=100):
	if number < 0:
		raise ValueError("Cannot find the square root of a negative number.")

	a, b = 1, 2
	x = (a + b) / 2

	# Lists to store the data for plotting
	x_values = [x]
	f_x_values = [x * x - number]
	
	iteration = 1
	for _ in range(max_iter):
		if abs(x * x - number) <= precision:
			break
	
		if x * x < number:
			a = x
		else:
			b = x
		
		x = (a + b) / 2
		x_values.append(x)
		f_x_values.append(x * x - number)
		
		print(f"Iteration {iteration}: x = {float(x):.50f}")
		iteration += 1
	
	return x, x_values, f_x_values

sqrt_2, x_values, f_x_values = binary_sqrt(2)

# Plot the graph
plt.figure()
plt.plot(x_values, f_x_values, 'o-', markersize=5)
plt.axhline(0, color='black', lw=0.5)
plt.xlabel("x")
plt.ylabel("f(x) = x^2 - 2")
plt.title("Binary method for finding the square root of 2")
x_range = np.linspace(min(x_values), max(x_values), 1000)
y_range = x_range**2 - 2
plt.plot(x_range, y_range, color='red', label='y = x^2 - 2')
plt.show()

print(f"\nSquare root of 2 using Binary method: {float(sqrt_2):.50f}")

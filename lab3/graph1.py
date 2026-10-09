import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import numpy as np

x = np.array([1.675, 9.8625, 19.7375])
x_err = np.array([0.08, 0.07, 0.14])

y = np.array([128.23, 45.66, 31.59])
y_err = np.array([2.0, 1.44, 2.74])

def fit_equation(x, a, b):
    return a * x**b

# Fit a power equation to the datapoints since that is what the graph follows
(b , a) = np.polyfit(np.log(x), np.log(y), 1)
a=np.exp(a)
b=b
x_fit = np.linspace(min(x), max(x), 3000)
y_fit = fit_equation(x_fit, a, b)

# Drawing a rectangle with the uncertainties and using the corners to make the max/min lines
# (x1, x2), (y1, y2) for easy graphing. x=[n_th point][0] y=[n_th point][1]
top_left     = (x - x_err, y + y_err)
top_right    = (x + x_err, y + y_err)
bottom_right = (x + x_err, y - y_err)
bottom_left  = (x - x_err, y - y_err)

# maxline: top-left of first point -> bottom-right of last point (steepest decline)
maxline = np.array([
    [top_right[0][0],     bottom_left[0][-1]],
    [top_right[1][0],     bottom_left[1][-1]],
])
# minline: bottom-left of first point -> top-right of last point (shallowest decline)
minline = np.array([
    [bottom_left[0][0],  top_right[0][-1]],
    [bottom_left[1][0],  top_right[1][-1]],
])
maxline_log = np.log10(maxline)
minline_log = np.log10(minline)


(b_max, a_max) = np.polyfit(maxline_log[0], maxline_log[1], 1)
a_max = 10**a_max

(b_min, a_min) = np.polyfit(minline_log[0], minline_log[1], 1)
a_min = 10**a_min

max_x = np.linspace(maxline[0][0], maxline[0][1], 3000)
min_x = np.linspace(minline[0][0], minline[0][1], 3000)
y_max_fit = fit_equation(max_x, a_max, b_max)
y_min_fit = fit_equation(min_x, a_min, b_min)


plt.figure(figsize=(8, 5))
plt.errorbar(x, y, xerr=x_err, yerr=y_err, fmt='o', ms=4, capsize=3, color='steelblue', label='Data')

axes = plt.gca()
axes.set_xscale('log')
axes.set_yscale('log')

axes.xaxis.set_major_locator(ticker.MultipleLocator(5))
axes.xaxis.set_major_formatter(ticker.ScalarFormatter())

axes.yaxis.set_major_locator(ticker.MultipleLocator(10))
axes.yaxis.set_major_formatter(ticker.ScalarFormatter())

plt.plot(x_fit, y_fit, color="red", linestyle="-", linewidth=1.5, label=f'$y={np.log(b):.4f}x+{a:4f}$')
plt.plot(max_x, y_max_fit, '--', color='gray', label=f'Maxline: $y={b_max:.4f}x+{np.log10(a_max):.4f}$')
plt.plot(min_x, y_min_fit, '--', color='gray', label=f'Minline: $y={b_min:.4f}x+{np.log10(a_min):.4f}$')

plt.grid(True, which='major', linestyle='-', linewidth=0.5, alpha=1)
plt.grid(True, which='minor', linestyle='-', linewidth=0.5, alpha=0.8)
plt.xlabel('Plate Seperation (mm)')
plt.ylabel('Capacitance (pF)')
plt.title("Capacitance vs. Plate Seperation")
plt.legend()
plt.tight_layout()
plt.savefig("plot1.png")
plt.show()
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

x = np.array([1.675, 9.8625, 19.7375])
x_err = np.array([0.08, 0.07, 0.14])

y = np.array([128.23, 45.66, 31.59])
y_err = np.array([2.0, 1.44, 2.74])

def model(x, a, b):
    return a * x**b

(b , a) = np.polyfit(np.log(x), np.log(y), 1)
a=np.exp(a)
b=b
print(a,b)
x_fit = np.linspace(min(x), max(x), 3000)
y_fit = model(x_fit, a, b)


maxline = np.array((((x+x_err)[0], (x-x_err)[-1]), ((y+y_err)[0], (y-y_err)[-1])))
maxline_log = np.log(maxline)
minline = np.array((((x-x_err)[0], (x+x_err)[-1]), ((y-y_err)[0], (y+y_err)[-1])))
minline_log = np.log(minline)


(b_max, a_max) = np.polyfit(maxline_log[0], maxline_log[1], 1)
a_max = np.exp(a_max)

(b_min, a_min) = np.polyfit(minline_log[0], minline_log[1], 1)
a_min = np.exp(a_min)

y_max_fit = a_max * x_fit**b_max
y_min_fit = a_min * x_fit**b_min



plt.figure(figsize=(8, 5))
plt.errorbar(x, y, xerr=x_err, yerr=y_err, fmt='o', ms=4, capsize=3, color='steelblue', label='Data')

plt.semilogy(base=np.e)
plt.semilogx(base=np.e)


plt.plot(x_fit, y_fit, color="red", linestyle="-", linewidth=1.5, label=f'C=${a:.2f}d^{{{b:.4f}}}t$')
plt.plot(x_fit, y_max_fit, '--', color='gray', label=f'Max: a={a_max:.2f}, b={b_max:.4f}')
plt.plot(x_fit, y_min_fit, '--', color='gray', label=f'Min: a={a_min:.2f}, b={b_min:.4f}')


plt.grid(True, which='major', linestyle='-', linewidth=0.5, alpha=0.6)
plt.grid(True, which='minor', linestyle='-', linewidth=0.5, alpha=0.3)
plt.xlabel('x')
plt.ylabel('y')
plt.title("")
plt.legend()
plt.tight_layout()
plt.show()
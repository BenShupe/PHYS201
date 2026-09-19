import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import pandas as pd
import numpy as np
from scipy.optimize import curve_fit

r1 = pd.read_csv('r1.csv')
r1.columns = ['Time','Voltage']

uncertainty_x = 1
uncertainty_y = 0.001

def model(x, a, b):
    return a * np.exp(b * x)

def plot_exp_fit(csv_path, title, yticks, p0):
    df = pd.read_csv(csv_path)
    df.columns = ['Time', 'Voltage']

    (a, b), _ = curve_fit(model, df["Time"], df["Voltage"], p0=p0, maxfev=10000)

    x_fit = np.linspace(min(df["Time"]), max(df["Time"]), 3000)
    y_fit = model(x_fit, a, b)

    maxline = ((df["Time"][0]+uncertainty_x, df['Voltage'][0]+uncertainty_y), (df["Time"].iloc[-1]-uncertainty_x, df['Voltage'].iloc[-1]-uncertainty_y))
    minline = ((df["Time"][0]-uncertainty_x, df['Voltage'][0]-uncertainty_y), (df["Time"].iloc[-1]+uncertainty_x, df['Voltage'].iloc[-1]+uncertainty_y))


    plt.figure(figsize=(8, 5))
    plt.errorbar(df["Time"], df["Voltage"], xerr=uncertainty_x, yerr=uncertainty_y,
                 fmt='o', ms=4, capsize=3, color='steelblue', label='Data')

    plt.semilogy(base=np.e)
    plt.plot(x_fit, y_fit, color="red", linestyle="-", linewidth=1.5, label=f'V=${a:.2f}e^{{{b:.4f}}}t$')

    (maxa, maxb), _ = curve_fit(model, (maxline[0][0], maxline[1][0]), (maxline[0][1], maxline[1][1]), p0=p0)
    (mina, minb), _ = curve_fit(model, (minline[0][0], minline[1][0]), (minline[0][1], minline[1][1]), p0=p0)

    xmax = np.linspace(maxline[0][0], maxline[1][0], 3000)
    ymax = model(xmax, maxa, maxb)

    xmin = np.linspace(minline[0][0], minline[1][0], 3000)
    ymin = model(xmin, mina, minb)

    plt.plot(xmax, ymax, color="blue", linestyle="--", linewidth=1, label="Maximum Uncertainty")
    plt.plot(xmin, ymin, color="blue", linestyle="--", linewidth=1, label="Minimum Uncertainty")


    
    plt.yticks(yticks, [str(t) for t in yticks])
    plt.grid(True, which='major', linestyle='-', linewidth=0.5, alpha=0.6)
    plt.grid(True, which='minor', linestyle='-', linewidth=0.3, alpha=0.3)
    plt.xlabel('Time')
    plt.ylabel('Voltage')
    plt.title(title)
    plt.legend()
    plt.tight_layout()
    plt.savefig(csv_path.split(".")[0])
    # plt.show()

    return a, b

# plot_exp_fit('r1.csv', '$470k \\Omega$ Semilog Graph', [1,2,3,4,5,6], [5, -0.01])
# plot_exp_fit('r2.csv', '$330k \\Omega$ Semilog Graph', [1,2,3,4,5,6], [5, -0.01])
# plot_exp_fit('r3.csv', '$220k \\Omega$ Semilog Graph', [1,2,3,4,5,6], [5, -0.01])
# plot_exp_fit('r4.csv', '$150k \\Omega$ Semilog Graph', [1,2,3,4,5,6], [5, -0.01])
# plot_exp_fit('r5.csv', '$100k \\Omega$ Semilog Graph', [1,2,3,4,5,6], [5, -0.01])
# plot_exp_fit('r6.csv', '$82k \\Omega$ Semilog Graph', [1,2,3,4,5,6], [5, -0.01])

x = np.array([160, 166.6, 120.5, 74.07, 52.91, 43.29])
y = np.array([470000, 316000, 224000, 14800, 99800, 81400])

def linear(x, a, b):
    return a*x+b

(a, b), _ = curve_fit(linear, x, y)

xfit = np.linspace(min(x), max(x), 300)
yfit = linear(xfit, a, b)

plt.plot(xfit, yfit, color = "red", linestyle = "--", label=f"$R={a:.2f}\\tau+{b:2f}$")

plt.scatter(x, y)

plt.legend()
plt.savefig("plot.png")

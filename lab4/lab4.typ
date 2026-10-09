#set page(
  paper: "a4",
  header: [October 8, 2026 #h(1fr) Benjamin Shupe],
  numbering: "1",
)
#let csvtable = (filename, ncols) => {
  block(breakable: false)[#table(
    columns: ncols,
    ..csv(filename).flatten()
  )]
}

#align(center)[
  #text(size: 15pt, weight: "bold")[PHYS 201: Lab 4]
]

#text(weight: "bold")[Objectives: ] The primary objective of the experiment is to determine the equations that give the voltage across a capacitor as a function of time as it discharges through different resistors. From them, the general equation showing how the discharge depends on the capacitance and the resistance will be derived.

#figure(csvtable("data.csv", 5), caption: [Lab 4 Data])
=== Uncertainty in Datapoints
Distance was measured using a meter stick, and the uncertainty is half of the smallest division:\ $delta d=0.0005$m

The uncertainty for all Vm measurements is: $delta = 0.001$, and since we average Vm+ and Vm-\ ($f=("Vm+"-"Vm-")/2$) to get Vm the uncertainty using differential error analysis is as follows:

$delta"Vm"=sqrt(((partial f)/(partial x)delta)^2+((partial f)/(partial y)delta)^2)$
$=sqrt((1/2 * 0.001)^2+(-1/2 * 0.001)^2)=0.001*sqrt(1/2)$

$=plus.minus 0.000707$

By averaging the data we obtain @calc which we will graph to find the slope of the trendline
#figure(csvtable("data2.csv", 3), caption: [Calculated Data])<calc>

Using Python, Matplotlib, and Numpy I graphed Vm vs Distance in log10-log10 for both cases. To weigh the trendline towards the points where the distance was largest I used the ``` w``` parameter in ``` np.polyfit```. Below is the code I used to fit a line to both graphs. there are 8 weights since there are 8 data points.
```python
(b , a) = np.polyfit(np.log(x), np.log(y), 1, w=[1, 1, 1, 1, 1, 2, 2, 2])
```
#figure(image("plot1.png"), caption: [Graph 1])
Numpy fit a power function with the equation: $y=0.001962x^(-2.7734)$. Therefore the slope is: $m=-2.7734$

The equation for the field due to the north pole is: $B_n=m/(x^2 (1-l\/2x)^2)$. Where $x$ is the distance and $l$ is the size of the magnet. I'll average the difference of Vm+ and Vm- for all points to get $l=0.020$m.
Plugging in $m$ and $l$ gives a function in terms of $x$:

$B_n (x)= -2.7734/(x^2 (1-0.020\/2x)^2) = -2.7734/(x - 0.01)^2$


#figure(image("plot2.png"), caption: [Graph 2])
Numpy fit a power function with the equation: $y=0.002634x^(-3.3981)$. Therefore the slope\ is: $m=-3.3981$

The equation for the field due to the south pole is: $B_s=-m/(x^2 (1+l\/2x)^2)$.
$B_s (x)= -3.3981/(x^2 (1+0.020\/2x)^2) = -3.3981/(x - 0.01)^2$

Adding $B_n$ and $B_s$ together gives the equation for the magnetic field where x varies:

$B = B_n + B_s = -(6.1715x^2 - 0.012494x + 0.00061715) / (x² - 0.0001)^2$
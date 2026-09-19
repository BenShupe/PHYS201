#set page(
  paper: "a4",
  header: [September 10, 2026 #h(1fr) Benjamin Shupe],
  numbering: "1",
)
#let csvtable = (filename, ncols) => {
  block(breakable: false)[#table(
    columns: ncols,
    ..csv(filename).flatten()
  )]
}

#align(center)[
  #text(size: 15pt, weight: "bold")[PHYS 201: Lab 2]
]

#text(weight: "bold")[Objectives: ] The primary objective of the experiment is to determine the equations that give the voltage across a capacitor as a function of time as it discharges through different resistors. From them, the general equation showing how the discharge depends on the capacitance and the resistance will be derived.

#text(weight: "bold")[Conclusion: ] #lorem(70)

== Part 1
#figure(table(
  columns: 2,
  align: center,
  table.cell(colspan: 2)[Capacitor Measurements],
  [Nominal], [Measured],
  [$500 mu F$], [$488 plus.minus 1 mu F$]
), caption: [Nominal vs. Measured capacitance])<Cap>

@Cap compares the nominal values written on the capacitor used throught this lab to the real, measured, value.


#let tbl = (i) => table(
  columns: 2,
  align: center + horizon,
  ..csv("r" + str(i) + ".csv").flatten()
  .map(eval.with(mode:"markup"))
)

Several RC circuits were created with different resistors to sample the voltage level at regular intervals as the capacitor discharged.

In this first table the resistance used was $R_1=470 plus.minus 1 "k"Omega$
#figure(tbl(1), caption: [Time vs Voltage of capacitor discharge $R=470"k"Omega$])<r1>

@r1 shows the discharge of a the capacitor over regular voltage intervals. The voltage was sampled over evenly spaced time intervals until the capacitor reached around of quarter of its original value. The time intervals were calculated by dividing the end time by one minus the number of samples: $Delta t = t_"end"/(n-1)=(340"s")/(8-1)=50"s"$

#figure(image("r1.png"), caption: [$470"k"Omega$ semilog Voltage vs. Time capacitor discharge])<r1graph>
The equation relating the voltage across a discharging capacitor to time is:
$
  V=V_0e^(-k t)
$

Where $V_0 = 5.95"V"$ is the inital voltage and $k = 1/tau$ is the slope of the line in semilog which is related to the speed of the capacitor discharging. Taking the natural logarithm of both sides gives:
#figure($
  => ln V = - k t + ln V_0
$)
@r1graph mirrors this equation, showing a linear relationship between time and voltage under semilog base $e$ of voltage (y-axis). We can write this in the form of a linear equation where $y=ln V; m=-k; c=ln V_0;t=x$:
$
  y=-m x + b
$
selecting 2 points that are close will give an approximation of the slope, $m$, lets pick: \ $p_1 =(300 plus.minus 1, 1.75 plus.minus 0.01)$ and $p_2=(340 plus.minus 1, 1.50 plus.minus 0.01)$
$
  m=(y_2-y_1)/(x_2-x_1)=(1.50-1.75)/(340-300)=-6.25 times 10^(-3) => k = 6.25 times 10^(-3) "s"^(-1)
$
The uncertainty in m is:
$
  delta m = sqrt(((partial m)/(partial x_1) delta x)^2+((partial m)/(partial x_2) delta x)^2+((partial m)/(partial y_1) delta y)^2+((partial m)/(partial y_2) delta x)^2) approx 5 times 10^(-5)\
$

We have:
$
  tau = 1/k = 160"s"
$

using the best fit line's slope gives $k=0.0041$, so:
$
  tau = 1/0.0041=243.9"s"
$


#figure(tbl(2), caption: [Time vs Voltage of capacitor discharge $R=330"k"Omega$])
#figure(image("r2.png"), caption: [330kΩ semilog Voltage vs. Time capacitor discharge])

Using the same method from before we get 
$
  tau = 1/0.0060=166.6"s"
$

#figure(tbl(3), caption: [Timevs Voltage of a capacitor discharge $R = 220"k"Omega$])

Using the same method from before we get 
$
  tau = 1/0.0083=120.5"s"
$

#figure(image("r3.png"), caption: [$220"k"Omega$ semilog Voltage vs. Time capacitor discharge])


#figure(tbl(4), caption: [Time vs Voltage of a capacitor discharge $R = 150"k"Omega$])
#figure(image("r4.png"), caption: [$150"k"Omega$ semilog Voltage vs. Time capacitor discharge])


Using the same method from before we get 
$
  tau = 1/0.0135=74.07"s"
$


#figure(tbl(5), caption: [Time vs Voltage of a capacitor discharge $R = 100"k"Omega$])
#figure(image("r5.png"), caption: [$100"k"Omega$ semilog Voltage vs. Time capacitor discharge])


Using the same method from before we get 
$
  tau = 1/0.0189=52.91"s"
$

#figure(tbl(6), caption: [Time vs Voltage of a capacitor discharge $R = 82"k"Omega$])
#figure(image("r6.png"), caption: [$82"k"Omega$ semilog Voltage vs. Time capacitor discharge])


Using the same method from before we get 
$
  tau = 1/0.0231=43.29"s"
$

== Part 2

Plotting $R$ vs $tau$ will show the relationship between them. Using this we can come up with an equation for $R$, $tau$, and $C$. We can use this to experimentally calculate the capacitance.

#image("plot.png")



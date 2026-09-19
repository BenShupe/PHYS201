#set page(
  paper: "a4",
  header: [September 10, 2026 #h(1fr) Benjamin Shupe],
  numbering: "1",
)
#set par(leading: 1.3em)
#let csvtable = (filename, ncols) => {
  block(breakable: false)[#table(
    columns: ncols,
    ..csv(filename).flatten()
  )]
}

#align(center)[
  #text(size: 15pt, weight: "bold")[PHYS 201: Lab 1]
]

#text(weight: "bold")[Objectives: ] To determine: the resistance of each of several resistors at different applied voltages to ascertain which of them are ohmic and which are non-ohmic, the total resistance of two resistors connected in series and then in parallel to see whether the rules for adding resistances are correct, the resistance of each of a number of resistors between 10 and 1,000,000 ohms using both the current divider and the voltage divider circuits to ascertain the range of resistance values that can be measured accurately by each circuit, and the internal resistance of the voltmeter and of the ammeter used in the circuits from the results.

= Part 1

Part 1 tasked us with finding the V-I characteristics of 4 passive elements and using Ohm's law\ $V= I R$ to calculate the resistance of the elements that seem to have constant resistances. 

#text(weight: "bold")[Carbon Resistor:]
#csvtable("carbon.csv", 4)

The resistance is fairly constant, so I'll calculate the average and standard error. $R_"avg"=(sum R_i)/6=(666.66666666+666.66666666+696.96969696+653.06122448+662.35864297+675.67567567)/6=670.2 Omega$ and $"SEM"=1/sqrt(n) sqrt( sum (x_i - mu)^2/(n-1))=1/6 sqrt(1126.81/5)=6.1 Omega$, so $R=670.2plus.minus 6.1 Omega$. The Maximum Power (from $P=V I$) is $0.037"W"$

#text(weight: "bold")[Wire Wound:]
#csvtable("wirewound.csv", 4)
The resistance again is fairly constant, so using the average and SEM, $R= 501.3 plus.minus 3.85 Omega$. The Maximum Power (from $P=V I$) is $0.005"W"$


#text(weight: "bold")[Lamp:]
#csvtable("lamp.csv", 4)
Once again the lamp seems to follow Ohms law and taking the average resistance gives:\ $R=1104 plus.minus 32.7"k"Omega$. The Maximum Power (from $P=V I$) is $11.55 mu "W"$


#text(weight: "bold")[Diode:]
#csvtable("diode.csv",4)
Lastly, a diode was placed in forward bias. The resistance decreases as the voltage gets closer to the diodes forward voltage, since the resistance changes with voltage we can conclude that the diode is not ohmic and therefore does not follow Ohm's Law. The Maximum Power (from $P=V I$) is $0.0375"W"$

== Part 2

Part two had us combine two resistors in series and parallel and predict then measure the average resistance.

#text(weight: "bold")[Wire and Carbon, Series:]
#csvtable("wire+carbon.csv",4)
Firstly, the wire-wound and carbon resistors were combined in series in an experiment similar to that of Part 1. The resistance seems to be constant, so the average measured resistance is calculated to be: $R=1173 plus.minus 4  Omega$. The predicted series resistance is calculated by adding the the resistances by $R_"series"=R_1+R_2 plus.minus (delta_R_1 + delta_R_2)=1171plus.minus 10 Omega $. The measured value is more precise due the errors combining on the prediction.

#text(weight: "bold")[Wire and Carbon, Parallel:]
#csvtable("wirePcarbon.csv", 4)

Next, the wire-wound and carbon resistors were parallel. The resistance again seems to be constant, so the average measured resistance is calculated to be: $R=289.3 plus.minus 3  Omega$. The predicted series resistance is calculated by adding the following formula $R_"parallel"=(R_1 R_2)/(R_1+R_2)$. For the error, differential error analysis must be done $delta_R = sqrt(((partial R_"parallel")/(partial R_1)delta_R_1)^2+((partial R_"parallel")/(partial R_2)delta_R_2)^2)= sqrt((R_1)^4 (delta_R_2)^2 + (R_2)^4 (delta_R_1)^2)/(R_1+R_2)^2$, so then, $R=286.8 plus.minus 1.4 Omega$. Both values are close to eachother. 


== Part 3

In part three we measured the resistance of 6 different resistors using two different methods to compare the values to the manufacturers codes aswell as to find the internal resistance of a voltmeter and ammeter. A resistor of $47Omega$ is placed in series with the power supply to limit the current in the circuit since the maxium output of the power supply is only $500"mW"$

#text(weight: "bold")[Current Divider:]
#csvtable("currentdiv.csv", 6)
The circuit was setup as a current divider with the ammeter in series with ground and the voltmeter across the measured resistor. This circuit yeilded great results that were much more accurate than the manufacturers tolerance for low resistances, however, once the resistance increased this method of measuring became much less accurate. Using this method I can calculate the internal resistance of the voltmeter. since the voltage drop across voltmeter is the same as the resistor it is across and the total current is know, the resistance can be calculated by: $R=V/(I-V/R_"across")=1.746/(3.2mu-1.746/(1"M"))=1.2"M" Omega$


#text(weight: "bold")[Voltage Divider:]
#csvtable("voltagediv.csv", 6)

The circuit was setup as a voltage divider with the ammeter in series with the resistor and the voltmeter across both resistor. This circuit yeilded better results for higher resistances, however, once the resistance decreases this method of measuring became much less accurate. Using this method I can calculate the internal resistance of the ammeter. since the voltage drop across the resistor+ammeter and the current through them is known, the resistance can be calculated by: $R = V/I-R= 9.86 Omega$

== Discussion Points

#text(weight: "bold")[The resistors used in the experiment have a power rating of 2 W. What does the power rating mean? Did you come close to “burning out” any of them?]

The power rating is the maxium power that the resistor can absorb before becoming innaccurate. I did not come close to burning any of them out, all resistors power consumtion was in the milliamps

#text(weight: "bold")[You may have noticed that changing the range on the ammeter or the voltmeter causedhe current and/or voltage reading to change. What caused these changes?]

A few things change the reading. different units mean I will be able to see more or less digits depending on the range I'm in. Also the multi-meter switches between different internal resistors for different ranges, these different resistors can have slightly different resistances, therefore changing the reading

#text(weight: "bold")[Is it advantageous for the internal resistance of an ammeter to be as large or as small as possible? Does it really matter? Explain.]

Its best for it to be as small as possible that way it does not change the resistance of the circuit its connected to. This matters alot since the was you will be reading is a different circuit if the change is significant

#text(weight: "bold")[Is it advantageous for the internal resistance of a voltmeter to be as large or as small as possible? Does it really matter?]Explain.

Ideally the internal resistance should be infinite that way it does not consume current from the circuit. This really matters since it changes the circuit

#text(weight: "bold")[What was the function of the $47 Omega$ resistor on the second circuit board? (Hint: The maximum output of the power supply was 100 mA at 5.0 V.)]

The function was to limit the current flowing into the circuit so it stays within its operating range.

#image("PXL_20260911_045404897.jpg")
#image("PXL_20260911_045410995.jpg")
#image("PXL_20260911_045413120.jpg")
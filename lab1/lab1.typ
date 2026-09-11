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
  #text(size: 15pt, weight: "bold")[ENEL 281 Assignment 5]
]

#text(weight: "bold")[Objectives: ] To determine: the resistance of each of several resistors at different applied voltages to ascertain which of them are ohmic and which are non-ohmic, the total resistance of two resistors connected in series and then in parallel to see whether the rules for adding resistances are correct, the resistance of each of a number of resistors between 10 and 1,000,000 ohms using both the current divider and the voltage divider circuits to ascertain the range of resistance values that can be measured accurately by each circuit, and the internal resistance of the voltmeter and of the ammeter used in the circuits from the results.

#text(weight: "bold")[Conlusion: ]#lorem(75)

= Part 1

#text(weight: "bold")[Carbon Resistor:]
#csvtable("carbon.csv", 4)


#text(weight: "bold")[Wire Wound:]
#csvtable("wirewound.csv", 4)


#text(weight: "bold")[Lamp:]
#csvtable("lamp.csv", 4)


#text(weight: "bold")[Diode:]
#csvtable("diode.csv",4)


== Part 2

#text(weight: "bold")[Wire and Carbon, Series:]
#csvtable("wire+carbon.csv",4)


#text(weight: "bold")[Wire and Carbon, Parallel:]
#csvtable("wirePcarbon.csv", 4)

== Part 3

#text(weight: "bold")[Current Divider:]
#csvtable("currentdiv.csv", 6)


#text(weight: "bold")[Voltage Divider:]
#csvtable("voltagediv.csv", 6)

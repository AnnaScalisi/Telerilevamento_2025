# Code to solve coloblindness problems

# Packages
library(terra)
library(imageRy)

#Installing cblindplot
library(devtools)
install_github("ducciorocchini/cblindplot")
library(cblindplot)

## Importing data
Data can be imported by

setwd("~/Desktop")
vinicunca = rast("vinicunca.jpg")
plot(vinicunca) # immagine vista da persone che non hanno il daltonismo

# Simulating colorblindness
In order to simulate colorblindness we can use the following code:
png("vininunca_out.png")
im.multiframe(1,2)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")

# Solving colorblindness
To solve colorblindness we can use cblindplot package:

dev.off()
rainbow = rast("rainbow.jpg")
plot(rainbow) # variabili climatiche temperatura
cblind.plot(rainbow, cvd="protanopia") # funzione del pacchetto cblindplot
cblind.plot(rainbow, cvd="deuteranopia")
cblind.plot(rainbow, cvd="tritanopia")

Starting from an image in rainbow colors, this can be seen by people with protanopia:

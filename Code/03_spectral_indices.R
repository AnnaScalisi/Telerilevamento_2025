# Code to calculate spectral indices from satellite images

library(imageRy) # beloved package developed at unibo
library(terra)
library(viridis)

im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg") # Satellite Landsat 5
mato1992 = flip(mato1992) # per ruotare l'immagine

# 1 = NIR
# 2 = red
# 3 = green

plot(mato1992)
im.plotRGB(mato1992, r=1, g=2, b=3) # Rio Pexoto, stretch si vede meglio la differenziazione tra gli oggetti. Il rosso è foresta pluviale.
im.plotRGB(mato1992, r=2, g=1, b=3) # Vegetazione verde, suolo nudo rosa.
im.plotRGB(mato1992, r=2, g=3, b=1) # Enfatizzo il suolo nudo e l'acqua in giallo, tutto quello che non è vegetazione.

# Import the 2006 image of the Mato Grosso area
mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg") # Satellite Aster risoluzione spaziale di 15m

im.multiframe(1, 2)
im.plotRGB(mato1992, r=2, g=3, b=1, title="Mato Grosso 1992")
im.plotRGB(mato2006, r=2, g=3, b=1, title="Mato Grosso 2006")

# Radiometric resolution uso immagini a 8bit da 0 a 255. Passo da valori con decimali a valori con interi. 
plot(mato1992[[1]], col=inferno(100))
plot(mato2006[[1]], col=inferno(100))

# DVI: Difference Vegetation Index.
# Tree:          NIR=255, red=0, DVI=NIR-red=255-0=255 # indice di salute.
# Stressed tree: NIR=100, red=20, DVI=NIR-red=100-20=80 # info stato di salute delle piante e quindi di un sistema.

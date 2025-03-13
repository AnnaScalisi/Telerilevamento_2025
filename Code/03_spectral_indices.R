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

# Calculating DVI

im.multiframe(1,2)
plot(mato1992)
plot(mato2006)

# 1 = NIR
# 2 = red

dvi1992 = mato1992[[1]] - mato1992[[2]] # NIR - red
plot(dvi1992)

# range DVI
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

plot(dvi1992, col=magma(100))

# Calculate dvi for 2006
dvi2006 = mato2006[[1]] - mato2006[[2]] # NIR - red
plot(dvi2006)
plot(dvi2006, col=magma(100))

im.multiframe(1,2)
plot(dvi1992, col=magma(100))
plot(dvi2006, col=magma(100))

# Different radiometric resolutions

# DVI 8 bit: range (0-255)
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 -255 = -255

# DVI 4 bit: range (0-15)
# maximum: NIR - red = 15 - 0 = 15
# minimum: NIR - red = 0 - 15 = -15

# NDVI 8 bit: range (0-255)
# maximum: (NIR - red) / (NIR + red) = (255 - 0) / (255 + 0) = 1
# minimum: (NIR - red) / (NIR + red) = (0 - 255) / (0 + 255) = -1

# NDVI 4 bit: range (0-15)
# maximum: (NIR - red) / (NIR + red) = (15 - 0) / (255 + 0) = 1
# minimum: (NIR - red) / (NIR + red) = (0 - 255) / (0 + 255) = -1

# NDVI 3 bit: range (0-15)
# maximum: (NIR - red) / (NIR + red) = (15 - 0) / (255 + 0) = 1
# minimum: (NIR - red) / (NIR + red) = (0 - 255) / (0 + 255) = -1

ndvi1992 = (mato1992[[1]] - mato1992[[2]]) / (mato1992[[1]] + mato1992[[2]])
# ndvi1992 = dvi1992 / (mato1992
plot(ndvi1992)

ndvi2006 = (mato2006[[1]] - mato2006[[2]]) / (mato2006[[1]] + mato2006[[2]])
# ndvi2006 = dvi2006 / (mato2006
plot(ndvi2006)

# Functions from imageRy
dvi1992auto = im.dvi(mato1992, 1, 2)
plot(dvi1992auto)

dvi2006auto = im.dvi(mato2006, 1, 2)
plot(dvi2006auto)

ndvi1992auto = im.ndvi(mato1992, 1, 2)
plot(ndvi1992auto)

ndvi2006auto = im.ndvi(mato2006, 1, 2)
plot(ndvi2006auto)

im.multiframe(1,2)
plot(ndvi1992)
plot(ndvi1992auto)



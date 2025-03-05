# Code for visualizing satellite data

library(terra)
library(imageRy)

# Listing files
im.list() # tutte le funzioni di imageRy iniziano con im.

# Sentinels-2 bands link: https://dataspace.copernicus.eu/explore-data/data-collections/sentinel-data/sentinel-2b2 <- im.import("sentinel.dolomites.b2.tif") # importo immagine del satellite che prende tutte le lunghezze d'onda e assegno un nome. 

cl <- colorRampPalette(c("black", "dark grey", "light grey"))(100) # cambio colori in esterno metto il numero di gamme
plot(b2, col=cl) # 

cl <- colorRampPalette(c("black", "dark grey", "light grey"))(3) # cambio la gama di colori
plot(b2, col=cl)

cl <- colorRampPalette(c("blue", "green", "yellow"))(100) # non va bene per i daltonici si azzera il contrasto rosso/verde e rosso/celeste 8% della pop mondiale è daltonica.
plot(b2, col=cl)

# Exercise: change the color ramp
# https://sites.stat.columbia.edu/tzheng/files/Rcolor.pdf

cl <- colorRampPalette(c("green2", "brown", "burlywood3"))(100)
plot(b2, col=cl)

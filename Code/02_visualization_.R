# R Code for visualizing satellite data

# install.packages("devtools")
library(devtools)
install_github("ducciorocchini/imageRy")

library(terra)
library(imageRy)

# Listing files
im.list() # tutte le funzioni di imageRy iniziano con im.

# Sentinels-2 bands link: https://dataspace.copernicus.eu/explore-data/data-collections/sentinel-data/sentinel-2b2 <- im.import("sentinel.dolomites.b2.tif") # importo immagine del satellite che prende tutte le lunghezze d'onda e assegno un nome. 

b2 = im.import("sentinel.dolomites.b2.tif") # b2 banda del blu
plot(b2, col=cl)

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

# band 3 green
b3 = im.import("sentinel.dolomites.b3.tif") # importo la banda del verde 

# band 4 red
b4 = im.import("sentinel.dolomites.b4.tif") # importo banda del rosso

# band 8 NIR (near infrared)
b8 = im.import("sentinel.dolomites.b8.tif")

par(mfrow=c(1,4)) # con par apro una finestra grafica vuota e come argomento metto mf cioè multiframe ossia vedere insieme più grafici 4 grafici su una riga
plot(b2)
plot(b3)
plot(b4)
plot(b8)

dev.off() # spegni il device

im.multiframe(1,4) # stessa cosa vedi sopra
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# Exercise: plot the bands using im.multiframe() one on top of the other
im.multiframe(4,1)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# How to import several sets altogether

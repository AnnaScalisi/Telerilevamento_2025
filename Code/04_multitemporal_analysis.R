# R code for multitemporal analysis

install.packages("ggridges") # this is needed to create ridgelines plots
library(imageRy)
library(terra)
library(viridis)
library(ggridges)

# Listing the data
im.list()

EN_01 = im.import("EN_01.png") # Ossido di azoto del traffico veicolare monitorati da copernicus ESA di gennaio
EN_01 = flip(EN_01)
plot(EN_01)

EN_13 = im.import("EN_13.png") # Marzo diminuzione degli ossidi di azoto
plot(EN_13)

im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

ENdif = EN_01[[1]] - EN_13[[1]] # Giallo valore maggiore durante gennaio. Blu valore maggiore a marzo. Faccio la differenza tra le due immagini che sono RGB e sottraggo il primo livello di ogni immagine.
plot(ENdif) # Quantità di azoto in quell'immagine

plot(ENdif, col=inferno(100)) # Cambio il colore

#------

Greenland ice melt

gr = im.import("greenland") # Importo tutte e quattro le immagini della Groenlandia dati di temperatura a 16 bit, programma Copernicus

grdif = gr[[1]] - gr[[4]] # Differenza tra la prima e l'ultima immagine
grdif = gr[[1]] - gr[[4]] # 2015 - 2000
plot(grdif)
# All the yellow parts are those in which there is a higher value in 2015
plot(grdif, col=rocket(100))

# Ridgeline plots
im.ridgeline(gr, scale=1) # Prende tutti i pixel e fa le frequenze di ogni pixel basato su pacchetto ggplot2, aggiungo un dataset a una funzione e una scala
im.ridgeline(gr, scale=2)
im.ridgeline(gr, scale=2, palette="inferno") # Aggiungo il colore
im.ridgeline(gr, scale=3, palette="inferno")

im.list()

# Exercise: import the NDVI data from Sentinel
ndvi = im.import("Sentinel2")
im.ridgeline(ndvi, scale=2)

# Changing names
# sources     : Sentinel2_NDVI_2020-02-21.tif  
#              Sentinel2_NDVI_2020-05-21.tif  
#              Sentinel2_NDVI_2020-08-01.tif  
#              Sentinel2_NDVI_2020-11-27.tif 

names(ndvi) = c("02_Feb", "05_May", "08_Aug", "11_Nov")
im.ridgeline(ndvi, scale=2) # Frequenze dei vari dataset
im.ridgeline(ndvi, scale=2, palette="mako") # Cambio colore

pairs(ndvi) # Plot vari ndvi nel tempo

plot(ndvi[[1]], ndvi[[2]]) # plot x pixel febbraio, y pixel maggio
# y = x # may y, feb x
# y = a + bx
# a=0, b=1
# y = a + bx = 0 + 1x = x

abline(0, 1, col="red")

plot(ndvi[[1]], ndvi[[2]], xlim=c(-0.3,0.9), ylim=c(-0.3,0.9)) # Plot con lo stesso range
abline(0, 1, col="red")

im.multiframe(1,3)
plot(ndvi[[1]])
plot(ndvi[[2]])
plot(ndvi[[1]], ndvi[[2]], xlim=c(-0.3,0.9), ylim=c(-0.3,0.9))
abline(0, 1, col="red")





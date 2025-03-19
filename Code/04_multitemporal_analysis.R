# R code for multitemporal analysis

library(imageRy)
library(terra)
library(viridis)

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
plot(grdif)

grdif = gr[[1]] - gr[[4]] # 2015 - 2000
plot(grdif)
# All the yellow parts are those in which there is a higher value in 2015

plot(grdif, col=rocket(100))

# Exporting 




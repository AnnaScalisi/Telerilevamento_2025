# First R coding from scratch

2 + 3

anna <- 2 + 3 # assign an operation to an object
chiara <- 4 + 6

anna+chiara

filippo <- c(0.2, 0.4, 0.6, 0.8, 0.9)   # array
luca <- c(100, 80, 60, 50, 10)    # array 2

plot(luca, filippo)  # grafico a punti
plot(luca, filippo, pch=19)  # cambio tipo di punti
plot(luca, filippo, pch=19, col="blue")  # cambio colore ai punti
plot(luca, filippo, pch=19, col="blue", cex=2) # raddoppio la dimensione dei puntini
plot(luca, filippo, pch=19, col="blue", cex=2, xlab="rubbish", ylab="biomass")  # inserisco e cambio i nomi alle variabili

# Installing packages
# CRAN
install.packages("terra") # installa il pacchetto "terra"
library(terra)  # richiamo il pacchetto che ho installato

install.packages("devtools") # install pacchetti da GitHub
library(devtools)

install_github("ducciorocchini/imageRy") # comando per installare pacchetti da GitHub
library(imageRy)

# Rtools 4.4
# update packages: avoid! just press enter

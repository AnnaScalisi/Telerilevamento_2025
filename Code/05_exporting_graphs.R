# This code helps exporting graphs to images

# Exporting data

#-------

setwd("~/Downloads/") # decido qual'è la working directory. Comando per mac ~ alt 5
setwd("C://utente/Downloads") # comando per windows
setwd("~/Desktop/")

getwd() # per vedere quale cartella

pdf("output.pdf") # Creo un file pdf nella cartella
plot(grdif)
dev.off()

jpeg("output.jpeg") # Creo un file jpeg nella cartella
plot(grdif)
dev.off()

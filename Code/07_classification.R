# R code for classifying images

# install.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg") # rosso vegetazione foresta originaria, infrarosso nel red.

mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg") 

mato1992c = im.classify(mato1992, num_clusters=2) # Discriminiamo due classi foresta e il resto. Unsupervised classification è casuale.
# class 1 = forest
# class 2 = human

mato2006c = im.classify(mato2006, num_clusters=2)
# class 1 = forest
# class 2 = human

f1992 = freq(mato1992c) # numero di pixel
tot1992 = ncell(mato1992c) # totale
prop1992 = f1992 / tot1992 # proporzioni
perc1992 = prop1992 * 100 # percentuale

# human = 17%, forest = 83%

perc2006 = freq(mato2006c) * 100 / ncell(mato2006c)

# human = 54%, forest = 45%

# Creating dataframe

class = c("Forest","Human")
y1992 = c(83,17)
y2006 = c(45,55)
tabout = data.frame(class, y1992, y2006)

p1 = ggplot(tabout, aes(x=class, y=y1992, color=class)) +
  geom_bar(stat="identity", fill="white") +
  ylim=(c(0,100)) # crea la struttura del grafico. con geom.bar scelgo il tipo di grafico

p2 = ggplot(tabout, aes(x=class, y=y2006, color=class)) +
  geom_bar(stat="identity", fill="white") +
  ylim=(c(0,100))

p1 + p2
p1 / p2

p0 = im.ggplot(mato1992)
p00 = im.ggplot(mato2006)
# plot della prima banda con im.ggplot funzione di imageRy

p0 + p00 + p1 + p2







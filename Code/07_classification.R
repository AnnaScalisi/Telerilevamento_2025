# R code for classifying images

library(terra)
library(imageRy)

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










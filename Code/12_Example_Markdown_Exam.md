# Exam project title: title

## Data gathering

Data were gathered from the [Earth Observatory site] (https://www.google.com/search?q=earth+observatory&rlz=1C5CHFA_enIT926IT926&oq=earth+obser&aqs=chrome.0.0i512l2j69i57j0i512l3j0i22i30l4.4912j0j7&sourceid=chrome&ie=UTF-8)

Packages used:

 ` ` `r
 library(terra)
 library(imageRy)
 library(viridis) # in order to plot
 ` ` `
 Setting teh working directory and importing the data:


## Data analysis

Based on the data gathered from the site we can calculate an index, using the first two bands

 ` ` `r

 setwd("~/Desktop/")
 fires = rast("fires.jpg")
 plot(fires)
` ` `

The image is the following:


In order to export the index, we can use the png() function like:

` ` `r

## Index visualisation by viridis

In order to visualize the index with another viridis palette we made use of the following code:

` ` `r
library(viridis)
plot(fireindex, col=inferno(100))
` ` `

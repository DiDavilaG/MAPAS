#tutorial from: http://joshuamccrain.com/tutorials/ggplot_maps/maps_tutorial.html

library(sf)
library(ggplot2)
library(tidyverse)
library(rgdal)
library(maps)
#import data from downloaded file / https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/IVXEHT
#dma_2008.zim
dma <- readOGR("DMAs.shp")
dma.df <- fortify(dma, region = "DMA")
dma.df <- rename(dma.df, DMA = id)
#We’ve read the shapefile in and used fortify() to convert it from a complex 
#spatial object into a simple dataframe, much easier to work with.
# We can go ahead and plot this using ggplot and the geom_polygon() function. 
#This function requires that the aesthetics for x and y had already been set, which in most shapefiles will be called long and lat. NB: the group=group argument here is important – try running it without it to see why.
#We also add the function coord_map() to this code to get a better 
#looking projection – this is a deep rabbit hole to go down if you want to know why.
## Had to install package "mapproj" becuase I kept getting an error. 

ggplot(dma.df, aes(x=long, y=lat, group=group)) + 
  geom_polygon() +
  coord_map()

#We already have a pretty standard map, now all I’m going to do are some simple aesthetic 
#adjustments to see the outlines of the DMAs, remove the map’s background color, 
#grid lines, and x and y axes.

ggplot(dma.df, aes(x=long, y=lat, group=group)) +
  geom_polygon(color="black", size=.5, fill="white") +
  coord_map() +
  theme_void()




# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

install.packages("rasterVis")

#### Packages #####

library(raster)
library(RStoolbox)
library(viridis)
library(patchwork)
library(tidyverse)

setwd("C:/Users/dilet/Documents/lab")

#### Data ####

# Upload all files

TGr <- lapply(list.files(pattern = "lst"), raster) %>%
  stack()

#### Plots ####

p2000 <- ggplot() +
  geom_raster(TGr$lst_2000, mapping = aes(x = x, y = y, fill = lst_2000)) +
  scale_fill_viridis(option = "mako", direction = -1, alpha = 0.8) +
  ggtitle("Temperature in 2000")

p2005 <- ggplot() +
  geom_raster(TGr$lst_2005, mapping = aes(x = x, y = y, fill = lst_2005)) +
  scale_fill_viridis(option = "mako", direction = -1, alpha = 0.8) +
  ggtitle("Temperature in 2005")

p2010 <- ggplot() +
  geom_raster(TGr$lst_2010, mapping = aes(x = x, y = y, fill = lst_2010)) +
  scale_fill_viridis(option = "mako", direction = -1, alpha = 0.8) +
  ggtitle("Temperature in 2010")

p2015 <- ggplot() +
  geom_raster(TGr$lst_2015, mapping = aes(x = x, y = y, fill = lst_2015)) +
  scale_fill_viridis(option = "mako", direction = -1, alpha = 0.8) +
  ggtitle("Temperature in 2015")

p2000 + p2005 + p2010 + p2015

# Make the difference between 2015 and 2000 temperatures

dift <- TGr$lst_2015 - TGr$lst_2000

pdif <- ggplot() +
  geom_raster(dift, mapping = aes(x = x, y = y, fill = layer)) +
  scale_fill_viridis(option = "inferno", direction = 1, alpha = 0.8) +
  ggtitle("Temperature difference between 2000 and 2015")

p2000 + p2015 + pdif

plotRGB(TGr, r = 1, g = 2, b = 4, stretch = "lin")
plotRGB(TGr, r = 1, g = 2, b = 4, stretch = "hist")


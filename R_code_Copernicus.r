# R_code_snow.r

# Copernicus set:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

# Register and Login
# Download data from Criosphere
# The arrow should be blue
# Info: https://land.copernicus.eu/global/content/sce-nhemi-product-s-npp-viirs-data-affected

setwd("C/lab/")

install.packages("ncdf4")
library(ncdf4)
library(raster)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

snow <- raster("c_gls_SCE_202012210000_NHEMI_VIIRS_V1.0.1.nc")
snow

# Plotting the data using ggplot and viridis

snowplot <- ggplot() +
  geom_raster(snow, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent)) +
  scale_fill_viridis(option = "mako")
snowplot

# Crop over Europe

ext <- c(-20, 50, 20, 70)
snow.europe <- crop(snow, ext)

snowplot_eu <- ggplot() +
  geom_raster(snow.europe, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent)) +
  scale_fill_viridis(option = "mako")

# Plot the two sets with the patchwork package

snowplot + snowplot_eu

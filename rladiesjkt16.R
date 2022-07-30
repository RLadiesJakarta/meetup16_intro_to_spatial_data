# load library
library(sp)
library(rgdal)
library(raster)
library(ggplot2)
library(viridis)
library(rasterVis)

# load data
coba <- raster('L1C_T47NRA_A027314_20220530T033443.tif')

b1 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=1)
b2 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=2)
b3 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=3)

plot(coba)
plot(b1)
plot(b2)
plot(b3)
coba1 <- b1 + b2
plot(coba1)
coba2 <- (b1-b2)/(b1+b2)
plot(coba2)
summary(coba2)

# red = b3, green=b2, blue=b1
# true color = sesuai dengan yg dilihat mata. 
coba3<- stack(list(b3, b2, b1))
plotRGB(coba3, axes = TRUE, stretch = "lin", main = "Coba RGB colour composite") 

# red = b1, green=b2, blue=b3
# false color = tidak sesuai dengan penglihatan mata. 
coba4<- stack(list(b1, b2, b3))

plotRGB(coba4, axes = TRUE, stretch = "lin", main = "Coba RGB colour composite") 

compareRaster(b2, b3) 
compareRaster(b2, b1) 

lm(b2~b1)

b2 <- as.matrix(b2)
b1 <- as.matrix(b1)

mdl <- lm(b2~b1)
# b4 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=4)
# b5 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=5)
# b6 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=6)
# b7 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=7)
# b8 <- raster('L1C_T47NRA_A027314_20220530T033443.tif', band=8)
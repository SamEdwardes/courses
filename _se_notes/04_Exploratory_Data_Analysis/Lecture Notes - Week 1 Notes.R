# 3 core plotting systems
## base plotting system - takes a lot of code, you build up code by code. You use a plot function, 
## and then more lines to annotate

library(datasets)
data(cars)
with(cars, plot(speed, dist))

## Latice system from the latice package. specify all plots in one function
## most useful for conditioning types of plots, planel plots... Good for many plots on one screen

library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout= c(4,1))

## ggplot 2 system
## grammar for plotting
## takes ideas from lattice and base
## also good for conditioning plots, lots of defaults

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)


###################
# BASE PLOTTING
###################

# two phases: (1) initalize the plot, then (2) annotate it
# Initililize, e.g. plot, hist, etc.

hist(airquality$Ozone)
par()

with(airquality, plot(Wind, Ozone))

airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# pch = plotting symbol
# lty = line type
# lwd = line width
# col = plotting colour
# xlab = x axis label
# ylab = ylabel

# par() function, other parameters you can change
# las, bg, mar, oma, mfrow, mfcol

with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in NY") ## add a title

#subsetting example
with(airquality, plot(Wind, Ozone, main = 'Ozone and Wind in NY'))
with(subset(airquality, Month ==5), points(Wind, Ozone, col = "blue"))

# add regresion line
with(airquality, plot(Wind, Ozone, main = 'Ozone and Wind in NY', pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

# multiplots
par(mfrow=c(1,2))
with(airquality,{
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main ="Ozone and Solar Radiation")
})

par(mfrow=c(1,1))

# adding data line by line
g <- gl(2, 50, labels = c("Male", "Femal"))
plot(x,y, type="n")
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Femal"], y[g == "Femal"], col = "blue", pch = 19)



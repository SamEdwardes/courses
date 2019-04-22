heat.colors() #red > yellow > white
topo.colors() #blue > green > yellow > white

# grDevices takes palletes of colour and help interpolate between them

# colors() function gives you a list of colour you can plot with
colors()

# colorRamp() takes a palette of colors and return a function that takes values between 0 and 1, indicating the extremes of the colour (e.g. gray() function)
# colorRampPalette() returns a vector of colors

# colorRamp()
pal <- colorRamp(c('red','blue'))
pal(0) # red
pal (1) # blue
pal(0.5) # in between red and blue
pal(seq(0,1,len=10))

# colorRampPalette
pal <- colorRampPalette(c('red','yellow'))
pal(2) # returns two hexadecimal (a max for red)
pal(10) # max on yellow

# RColorBrewer Package
library(RColorBrewer)

# 3 types of palettes: (1) sequential [use for orderd data], (2) diverging [data that moves away from a centre point], 
# (3) qualitative [used to represent data that is not orderd, factors or categorical data]

cols <- brewer.pal(3, "BuGn") #number of colours you want and name of palette
cols #returns three different colors

pal <- colorRampPalette(cols)
image(volcano, col = pal(20))
image(volcano, col = pal(100))
image(volcano, col = pal(10))

# smoothScatter()
# creates a 2d histogram
x <- rnorm(1000)
y <- rnorm(1000)
smoothScatter(x,y)

# rgb() function, takes numbers between 0,1 and returns a hexadecimal string
# add transparnce to colors by using the fourth argurment. 1 being  not transparent, 0 being the most transparent

plot(x,y, pch = 19)
plot(x,y, col = rgb(0,0,0,0.2), pch=19) #add transaprency to the plot

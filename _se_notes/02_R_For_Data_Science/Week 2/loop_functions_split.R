#takes object, factor variale (levels of a group), and then splits into # of groups identified
x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <- gl(3,10)
f

split(x,f)

#split way
lapply(split(x,f),mean)

#tapply way
tapply(x, f, mean)

#split is good to split complicated types of objects

library(datasets)
head(airquality)

#get the mean of all the columns, within each month.
s <- split(airquality,airquality$Month)
s

lapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))

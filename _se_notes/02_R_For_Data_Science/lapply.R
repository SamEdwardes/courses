x <- list(a=1:5, b=rnorm(10))

lapply(x,mean)

b <- lapply(x,mean)

z <- 1:4
lapply(z,runif)

lapply(z, runif, min=0, max=10)

xx <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))
xx

#extract first column from both matricies
lapply(xx, function(elt) elt[,1])


#sapply is variant of lapply only returns a list. sapply does not return a list, for exapmle it would return a vector. sapply simplifis the results where possible.
#if it can't simplifiy, it won'd do anything and will return a list.

lapply(x,mean) #returns list
sapply(x, mean) #returns numeric vector

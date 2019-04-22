help(tapply)

x <- c(rnorm(10), runif(10), rnorm(10,1))

f <- gl(3,10)
f

tapply(x,f,mean)

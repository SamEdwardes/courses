help(apply)

x <- matrix(rnorm(200),20,10)
print(x)

#means of all the columns
apply(x,2,mean)

#means of all the rows
apply(x,1,mean)

#get 25th and 75th percentile for each row
apply(x,1,quantile, probs =c(0.25,0.75))

a <- array(rnorm(2*2*10),c(2,2,10))
a

#take average, colapse third dimension
apply(a,c(1,2),mean) #average over the third dimension

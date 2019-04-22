#could use a for loop, but we will use mapply
help(mapply)

#tedious way to make a list
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))


#the mapply way
mapply(rep, 1:4, 4:1)

#another example
noise <- function(n, mean, sd){
  rnorm(n, mean, sd)
}

noise(5,1,2)

noise(1:5, 1:5, 2) #we get a vector of 5, but we want not what we want...

mapply(noise, 1:5, 1:5, 2) #same as manually typing out a list with 5 function calls

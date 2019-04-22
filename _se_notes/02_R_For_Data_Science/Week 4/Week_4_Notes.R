##############################
#SIMULATION
##############################
set.seed(1) #always set the seed to we can reproduce

x <-  rnorm(20000, mean = 70, sd = 2)
print(x)
hist(x)

y <- rnorm(20000, mean = 70, sd = 50)
print(y)
hist(y)


##############################
#SIMULATING A LINEAR MODEL
##############################

#create model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5+2*x+e

summary(y)
plot(x,y)

#what if x in a binary?
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5+2*x+e

summary(y)
plot(x,y)

#poission model
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5+0.3*x
y <- rpois(100, exp(log.mu))

summary(y)
plot(x,y)


##############################
#RANDOM SAMPLING
##############################
#draws a random sample from a vector of numbers

set.seed(1)
sample(1:10,4) #sample 4 random entries from 1 to 10 without replacement
sample(letters,5) # you can sample letters as well


##############################
#PROFILING TOOL
##############################
# if something is taking a long time, profiler helps you figure out why, and suggests how to speed up
# a systemic way to figure out how much time is being spent in parts of a program
# always focus on writing workable reading code first, then optimize

# system.time()
system.time({
  x <- (rnorm(1000000))
  hist(x)
  })

#Rpfof - the R profiler
#Rprof() has an ouptput that is not very helpful. Every .02 seconds it prints out the function call stack
#summaryRprof()
#byTotal 
## Gives you how much time that function appeared in the call stack. example 100% of time is spent at the top level
## in reality a lot of time is spent in the lower level "helper function"
#and bySelf


test_func <- function(){
  z <- rnorm(1000000)
  print(summary(z))
  pint(hist(z))
  plot(z)
}

test_func


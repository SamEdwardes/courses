# get data
library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x) # 1078
B <- 10000 # of bootstrap resamples, we want this to be large so our monte carlo error is small

# resample, each row will be a new sample, we will do this n times
resamples <- matrix(sample(x, n*B, replace=TRUE), B, n)
head(resamples)[1:5, 1:10]

# take the median of each row
resampledMedians <- apply(resamples, 1, median)
head(resampledMedians)

# plot simulated medians
hist(resampledMedians)

# sd of medians
sd(resampledMedians)
summary(resampledMedians)

# compare the observed median vs. the simulation median
cbind(median(x), mean(resampledMedians))
cbind(median(x), median(resampledMedians))

      
# load and plot data
data("InsectSprays")
head(InsectSprays)
g = ggplot(InsectSprays, aes(spray, count, fill = spray))
g = g + geom_boxplot()
g

# create a subset
subdata <- InsectSprays[InsectSprays$spray %in% c("B","C"),]
head(subdata)


g = ggplot(subdata, aes(spray, count, fill = spray))
g = g + geom_boxplot()
g

group <- as.character(subdata$spray)
y <- subdata$count

testStat <- function(w, g) mean(w[g=="B"]) - mean(w[g=="C"])
observedStat <- testStat(y, group) # this is just the detla of the mean of B less the mean of C

# simulations
permutations <- sapply(1:1000, function(i) testStat(y, sample(group))) 
# here we are breaking the association between y and the group label
# this new distribution is under the null assmption that it does not matter which spray you use (both are equally effective,
# or the H0: x_bar - ybar = 0)
dim(permutations)
head(permutations)
hist(permutations, xlim = range(-20:20))
abline(v = observedStat)

li# Our observed stat
observedStat

# what proportion of times was our simulated stat greater than our observed stat?
mean(permutations > observedStat) # this is our P value, 0
# The P value is very small, so we would reject the null hypothesis
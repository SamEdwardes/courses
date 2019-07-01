# load the data
library(UsingR)
data("galton")
head(galton)
child <- galton$child
parent <- galton$parent
plot(child, parent)

# obtain the means
x_bar <- mean(child)
y_bar <- mean(parent)

# centre the data at zero
child_0 <- child - x_bar
parent_0 <- parent - y_bar
galton_0 <- data.frame(child_0, parent_0)
head(galton_0)
plot(child_0, parent_0)

# find the slope, if we use child_0/parent_0 the intercept will be zero
# all these methods work
slope <- lm(I(parent-mean(parent))~I(child-mean(child))-1, data=galton); slope
slope_0 <- lm(I(parent_0)~I(child_0)-1, data=galton_0); slope_0
lm(child_0 ~ parent_0-1) # parent must go first since its what we are trying to predict
lm(parent_0 ~ child_0-1)
sum(child_0*parent_0) / (sum(child_0^2)) # here is how to do it math like

# to get all the details
lm(parent_0 ~ child_0)
lm(parent ~ child)


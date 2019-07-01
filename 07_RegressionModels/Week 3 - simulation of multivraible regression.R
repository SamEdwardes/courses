n <- 100
x <- rnorm(n)
x2 <- rnorm(n)
x3 <- rnorm(n)

y <- 1 + x + x2 + x3 + rnorm(n, sd =.1)
# we just set intercept to 1
# the rnorm(sd) on the end is the error, it adds some noise

# check out in a df
df <- data.frame(y, x, x2, x3)
head(df, 10)

# get the residual for y having regressed out x2 and x3. note that lm by default contains an intercept
ey <- resid(lm(y ~ x2 + x3))
head(ey)

# do the same for x. 
ex <- resid(lm(x ~ x2 + x3))
head(ex)

# then get the regression through the origin estimate with these two residuals
sum(ey*ex) / sum(ex^2)
# or...
lm(ey ~ ex - 1)

# now if we do lm() on everything
lm(y ~ x + x2 + x3)

# note that we get the same coef for x...
# this goes to show us the way in which linear models adjust the regression estimate from the other variables


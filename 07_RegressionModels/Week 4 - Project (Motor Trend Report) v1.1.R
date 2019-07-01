library(dplyr)
library(ggplot2)
library(knitr)

# load the data
data(mtcars)
num_records <- nrow(mtcars)

# add model details
mtcars$model <- rownames(mtcars)

# clean the data
mtcars <- mtcars %>% mutate(transmission = case_when(
  am == 0 ~ "automatic",
  TRUE ~ "manual"
))

automatic <- mtcars[mtcars$transmission == "automatic","mpg"]
manual <- mtcars[mtcars$transmission == "manual","mpg"]
t_test <- t.test(x=manual, y=automatic, alternative = "two.sided")
# print the data
mtcars_summary <- mtcars %>%
  group_by(transmission) %>%
  summarise("Number of Observations" = n(), "Mean MPG" = round(mean(mpg),2))

kable(mtcars_summary, caption = "Summary of observations")
# plot the data
g <- ggplot(data = mtcars, aes(x=transmission, y=mpg, fill = transmission)) + 
  geom_boxplot(width = 0.5) + 
  geom_point(aes(), alpha = 0.5, size = 2) +
  ggtitle("Automatic vs. Manual")
g
fit1 <- lm(mpg ~ transmission, data = mtcars)
kable(summary(fit1)$coef)
residuals1 <- residuals(fit1)
reisudals1_df <- data.frame(transmission = mtcars$transmission, residuals = residuals1)
ggplot(data = reisudals1_df,
       aes(x = transmission, y = residuals, colour = transmission)) +
  geom_point() + 
  ggtitle("Model #1 Residuals Plot")
fit2 <- lm(mpg ~ wt*transmission, data = mtcars)
kable(summary(fit2)$coef)
ggplot(data=mtcars, aes(x=wt, y=mpg, colour=transmission)) + 
  geom_point() + 
  geom_smooth(method = "lm")
residuals2 <- residuals(fit2)
reisudals2_df <- data.frame(transmission = mtcars$transmission, residuals = residuals2, wt = mtcars$wt)
ggplot(data = reisudals2_df,
       aes(x = wt, y = residuals, colour = transmission)) +
  geom_point() + 
  ggtitle("Model #2 Residuals Plot")
## 

library(quantmod)
library(dplyr)
library(lubridate)

amzn = as_data_frame(as.data.table(getSymbols("AMZN",auto.assign=FALSE)))
sampleTimes = index(amzn)

# How many values were collected in 2012? How many values were collected on Mondays in 2012?

amzn %>%
    filter(year(index) == 2012)

filter(amzn, year(index) == 2012 & wday(index, label = TRUE) == 'Mon')


# Answer
# 250 in 2012
# 47 mondays in 2012
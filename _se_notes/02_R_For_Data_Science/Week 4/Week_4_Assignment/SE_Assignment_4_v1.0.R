# PROGRAMMING ASSIGNMENT 3


################################################################
# 1 - Plot the 30 day mortality rates for heart attack
################################################################

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)

# Histograme of the 30 day death rates from heart attach (column 11 in outcome dataset)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])



##############################

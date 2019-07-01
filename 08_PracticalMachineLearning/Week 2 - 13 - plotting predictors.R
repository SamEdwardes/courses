library(ISLR)
library(ggplot2)
library(caret)
library(Hmisc)
set.seed(12345)

# DON'T use the test set for data explorations

data(Wage)
head(Wage); summary(Wage)

# build training and test set
inTrain <- createDataPartition(y = Wage$wage, p = 0.7, list = FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training); dim(testing)

# explore data
featurePlot(x = training[,c("age", "education", "jobclass")],
            y = training$wage,
            plot = "pairs")
qplot(age, wage, data=training)
qplot(age, wage, colour = jobclass,data=training)
qplot(age, wage, colour=education, data=training) + geom_smooth(method = "lm", formula = y~x)
cutWage <- cut2(training$wage, g=3) # from Hmsic, break table into groups based on quantiles
table(cutWage)
qplot(cutWage, age, data=training, fill=cutWage, geom = c("boxplot"))
qplot(cutWage, age, data=training, fill=cutWage, geom = c("boxplot","jitter"))
# use grid.arrange() to plot two plots side by side

# look at tables
table(cutWage, training$jobclass)
prop.table(table(cutWage, training$jobclass))

# density plots
qplot(wage, colour = education, data = training, geom = "density")

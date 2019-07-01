library(caret)
library(kernlab)
data(spam)
set.seed(12345)

inTrain <- createDataPartition(y = spam$type, p = 0.75, list = FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

hist(training$capitalAve, main="", xlab = "ave. capital run length")

# standardize vairables by subtracting their mean and dividing by sd
# results in mean of 0 and SD of 1
trainCapAve <- training$capitalAve
trainCapAveS <- (trainCapAve - mean(trainCapAve))/sd(trainCapAve)
round(cbind(mean(trainCapAveS), sd(trainCapAveS)),4)

# for the test set, you must normalize using training mean and sd
testCapAve <- testing$capitalAve
testCapAveS <- (testCapAve - mean(trainCapAve))/sd(trainCapAve)
round(cbind(mean(testCapAveS), sd(testCapAveS)),4)

# or using R
# preProcess() will do the same process we just did above
preObj <- preProcess(training[,-58], method=c("center","scale")) # 58 is the actual column that we care about (the outome)
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
round(cbind(mean(trainCapAveS), sd(trainCapAveS)),4)
# you can also apply this obj to the test set.
testCapAveS <- predict(preObj, testing[,-58])$capitalAve
round(cbind(mean(testCapAveS), sd(testCapAveS)),4)

# BoxCox takes contious data and try and make it look like normal data
preObj <- preProcess(training[,-58], method = c("BoxCox"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
par(mfrow=c(1,2))
hist(trainCapAveS)
hist(qqnorm(trainCapAveS))

# imputing data (filling in missing data)

set.seed(13343)
# Make some values NA
training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1],size=1,prob=0.05)==1
training$capAve[selectNA] <- NA

# Impute and standardize
preObj <- preProcess(training[,-58],method="knnImpute") # knnImpute find the 10 nearest data vectors like the one with the missing value
capAve <- predict(preObj,training[,-58])$capAve # predict all the nearest values...

# Standardize true values
capAveTruth <- training$capitalAve
capAveTruth <- (capAveTruth-mean(capAveTruth))/sd(capAveTruth)

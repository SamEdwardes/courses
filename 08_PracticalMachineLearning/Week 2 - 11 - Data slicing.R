library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y = spam$type, 
                               p = 0.75, # 75% allocated to training set
                               list = FALSE)

training <- spam[inTrain,]
testing <- spam[-inTrain,]

# creating K-folds
set.seed(32323)
folds_k <- createFolds(y=spam$type,
                     k=10,
                     list=TRUE,
                     returnTrain = TRUE)

# resampling
set.seed(32323)
folds_re <- createResample(y = spam$type,
                        times = 10,
                        list = TRUE)

# time slices
set.seed(32323)
tme <- 1:1000
folds_time <- createTimeSlices(y=tme,
                          initialWindow = 20, # each sample should have 20 samples
                          horizon = 10) # we will predict the next 10 samples
                          
names(folds_time)



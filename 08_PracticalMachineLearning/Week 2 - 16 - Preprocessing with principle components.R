# we don't want to include variables that are highly correlated with each other
# we can use PCA to remove these

# how can we take two highly correlated variables and combine them into one better one that
# can hopefully explain more

library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

M <- abs(cor(training[,-58]))
diag(M) <- 0
which(M > 0.8,arr.ind=T)


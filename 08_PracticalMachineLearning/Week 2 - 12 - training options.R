library(caret)
library(kernlab)

inTrain <- createDataPartition(y = spam$type,
                               p = 0.75,
                               list = FALSE)

training <- spam[inTrain,]
testing <- spam[-inTrain,]

modelFit <- train(type ~ .,
                  data = training,
                  method = "glm")

# set training options using args(train.default)
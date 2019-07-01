library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y = spam$type, p = 0.75, list = FALSE)

training <- spam[inTrain,]
testing <- spam[-inTrain,]

set.seed(32343)
modelFit <- train(type ~ ., data = training, method = "glm")

modelFit

modelFit$finalModel

predictions <- predict(modelFit, newdata = testing)
head(predictions, 20)

# confusion matrix
confusionMatrix(predictions, testing$type)

library(datasets)
data(iris)

#1 what is the mean?
tapply(iris$Sepal.Length, iris$Species, mean)

#2 return a vector of the means of the variables...
#apply(iris, 1, mean)
#apply(iris[, 1:4], 1, mean)
apply(iris[, 1:4], 2, mean)
#colMeans(iris)
#apply(iris, 2, mean)
#rowMeans(iris[, 1:4])

#check the class
class(apply(iris[, 1:4], 2, mean))

#3 calculate average mpg by number of cylienrs in car
data(mtcars)
head(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)
#sapply(mtcars, cyl, mean)
#apply(mtcars, 2, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
#split(mtcars, mtcars$cyl)
with(mtcars, tapply(mpg, cyl, mean))
mean(mtcars$mpg, mtcars$cyl)
#lapply(mtcars, mean)

#4 what is the absolute difference between the average horsepower of 4 cyliners cars,
#and the avg of 8

202.21429 - 82.63636

#5 debugging
debug(ls)

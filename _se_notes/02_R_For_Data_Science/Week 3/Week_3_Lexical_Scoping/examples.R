#example #1
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

#example #2
cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}



#input stuff from example: https://www.coursera.org/learn/r-programming/peer/tNy8H/programming-assignment-2-lexical-scoping/discussions/threads/oMkaD-8xEeiXJxK8LgGSdg
sample_vector <- makeVector()
sample_vector$set(c(1,2,3,4,5))
sample_vector$get()
sample_vector$setmean(mean(sample_vector$get()))
sample_vector$getmean()
cachemean(sample_vector)

#my test
sample_vector <- makeVector()
sample_vector$set(c(1,2,3,4,5,6,7,8,9,10))
sample_vector$get()
sample_vector$setmean(mean(sample_vector$get()))
sample_vector$getmean()
cachemean(sample_vector)


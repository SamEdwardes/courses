## These first function creates a list of functions which take in a matrix and save the inverse to the cache
## The second function checks to see if the inverse exists in the cache, if it does not, it calculates it


## makeCacheMatrix returns a list containing functions to: 
##(1) set matrix, (2) get the matrix, (3) set the inverse of the matrix, (4) get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x<<-y
    m<<-NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve checks to see if the inverse has already been calculated. If it has, it returns the inverse stored in the cache,
## if it has not been calculated, it calcualtes it

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  message("solving matrix inverse")
  return(m)
}



####TEST CODE####

#This is code to test if the above two functions are working correctly
sample_matrix <- makeCacheMatrix()
sample_matrix$set(cbind(1:2,3:4))
sample_matrix$get()
#Comment out the below two lines to test out if the cache matrix works when there is no cache
sample_matrix$setinverse(solve(sample_matrix$get()))
sample_matrix$getinverse()
#Solve if there is no cache, or return saved results
cacheSolve(sample_matrix)

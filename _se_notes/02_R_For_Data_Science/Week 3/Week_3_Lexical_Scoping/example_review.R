## Programming Assignment 2

## makeCacheMatrix: This function creates a special  
## "matrix" object that can cache its inverse.
## Assume that the matrix supplied is always invertible

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(mat_inverse) inverse <<- mat_inverse
  getinverse <- function() inverse
  matrix(list(set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse))
}

# cacheSolve: This function computes the inverse of 
# the special "matrix" returned by makeCacheMatrix above. 

cacheSolve <- function(x, ...) {
  inverse <- x[[4]]()
  
  # If the inverse has already been calculated 
  # (and the matrix has not changed), then the 
  # cachesolve should retrieve the inverse from the cache
  
  if(!is.null(inverse)) {
    message("getting cached data")
    ## Return a matrix that is the inverse of 'x'
    return(inverse)
  }
  
  data_matrix <- x[[2]]()
  inverse <- solve(data_matrix, ...)
  x[[3]](inverse)
  ## Return a matrix that is the inverse of 'x'
  inverse 
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
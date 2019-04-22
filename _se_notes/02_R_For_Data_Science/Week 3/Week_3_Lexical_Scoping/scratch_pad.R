# Your assignment is to write a pair of functions that cache the inverse of a matrix.

#Write the following functions:

#1 makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

#2 cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

# Computing the inverse of a square matrix can be done with the solve function in R. 
##For example, if X is a square invertible matrix, then solve(X) returns its inverse.

# For this assignment, assume that the matrix supplied is always invertible.
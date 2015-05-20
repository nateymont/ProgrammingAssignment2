## Overall - these two functions work together to verify if there is an inverse matrix in cache and if not 
##  then it solves the matrix and stores it in cache.

##checks to see if inverse matrix is stored in cache, if not it prepares the matrix to be solved.
makeCacheMatrix <- function(x = numeric()) {
  ## set the cached value or NULL if nothing is cached
  ## initially nothing is cached so set it to NULL
  cache <- NULL
  ## store a matrix
  setMatrix <- function(newValue) {
    x <<- newValue
    ## since the matrix is assigned a new value, flush the cache
    cache <<- NULL
  }
  ## returns the stored matrix
  getMatrix <- function() {
    x
  }
  ## cache the given argument
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  ## get the cached value
  getInverse <- function() {
    cache
  }
  # return a list. Each named element of the list is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}
## Calculates the inverse of the matrix created with makeCacheMatrix
cacheSolve <- function(x0, ...) {
  ## get the cached value
  inverse <- x0$getInverse()
  ## if a cached value exists return it
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  ## if a cached value does not exist get the matrix, caclulate the inverse and store it in the cache
  data <- x0$getMatrix()
  inverse <- solve(data)
  x0y$cacheInverse(inverse)
  ## return the inverse
  inverse
}

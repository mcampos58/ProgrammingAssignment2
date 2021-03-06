## makeCacheMatrix takes a matrix as an argument, and returns a list with 4 functions,
## set, get, setinverse and getinverse
## cacheSolve returns a matrix that is the inverse of the matrix that is passed
## Usage: first run makeCacheMatrix on a matrix and store it to a variable
## Then, use cacheSolve on the variable to calculate the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  ## inv is set initially to NULL
  inv <- NULL
  
  ## the function set sets a new matrix to x and resets inv to NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  ## get returns the cached matrix
  get <- function() x
  
  ## setinverse gets the inverted matrix and caches it to inv
  setinverse <- function(inverse) inv <<- inverse
  
  ## getinverse returns the cached inverted matrix
  getinverse <- function() inv
  
  ## returns the list of functions
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}




cacheSolve <- function(x, ...) {
  ## gets inv using getinverse(), from the list generated by makeCacheMatrix
  inv <- x$getinverse()
  
  if(!is.null(inv)) { ## if inv is not NULL, returns the cached inverse
    message("Getting cached data")
    return(inv)
  }
  
  else {
    data <- x$get() ## gets the cached matrix (not inverse)
    inverse <- solve(data) ## calculates the inverse of the matrix
    x$setinverse(inverse) ## stores it in cache
    inverse ## returns the inverse
  }
}
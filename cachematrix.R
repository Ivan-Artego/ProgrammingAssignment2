## Below are two functions that are used to create a special object
## that stores a matrix and cache its solve

## The first function, makeCacheMatrix creates a special matrix,
## which is really a list containing a function to:
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the solve
## 4) get the value of the solve

makeCacheMatrix <- function(x = matrix(x, nrow = , ncol = )) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setsolve <- function(solve) m <<- solve
      getsolve <- function() m
      list(set = set, get = get,
           setsolve = setsolve,
           getsolve = getsolve)
}

## The following function calculates the solve of the special matrix
## created with the above function. 

cacheSolve <- function(x, ...) {
      m <- x$getsolve()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setsolve(m)
      m
}
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ##create a makeCacheMatrix function having default input as matrix
  m <- NULL ##making the m variable to null 
  set <- function(y) { ##Creating a set object so that only this function value can be changed without describing the object again
    x <<- y ##chaning the parent value of x
    m <<- NULL ##chaning the parent value of m 
  }
  get <- function() x ##getting the value of m
  setinverse <- function(solve) m <<- solve ##solving for inverse
  getinverse <- function() m ##getting the inverse
  list(set = set, get = get, ##creating the list of values
       setinverse = setinverse,
       getinverse = getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse() ##getting the value of inverse
  if(!is.null(m)) { ##checking if m is NULL or not
    message("getting cached data") 
    return(m) ##Returning cached data
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  }


set.seed(2010) ##Setting the seed for reproducibility
a <- matrix(data = (sample(9)) , 3,3) ##creating a matrix

a


y <- makeCacheMatrix(a) ##Storing the Casce Matrix Values

cacheSolve(y) ##Getting the cache value 

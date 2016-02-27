## Programming assignment 2 
## Put comments here that give an overall description of what your
## functions do

## This function will create a new matrix obj which can cache inverse that can be used later 

  makeCacheMatrix <- function(x = matrix()) {
    ## @x: a square invertible matrix
    ## return: a list containing functions to
    ##              1. set the matrix
    ##              2. get the matrix
    ##              3. set the inverse
    ##              4. get the inverse
    ##         this list is used as the input to cacheSolve() 
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    ##print (x)
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    ##print (m)
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
  
  }
  ## End of makecachematrix()
  
  ## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
  ## If the inverse has already been calculated (and the matrix has not changed), 
  ## then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
  inverse<- x$getinverse()
  # if the inverse has already been calculated
  if(!is.null(inverse)) {
    # get it from the cache and skips the computation. 
    message("getting cached data")
    return(inverse)
  }
  # otherwise, calculates the inverse 
  data<-x$get()
  inverse = solve(data)
  # sets the value of the inverse in the cache via the setinv function.
  x$setinverse(inverse)
  
  return(inverse)
}
## end of cacheSolve

## test function
testInverseCache <- function(mat){
  ## Pass a matrix filled with random numbers
  cachematdata <- makeCacheMatrix(mat)
  # Lets do some profiling .. first run
  start.time <-Sys.time()
  # Pass matrix object to cacheSolve
  cacheSolve(cachematdata)
  timeTaken <- Sys.time() - start.time
  print ("Time taken without caching")
  print(timeTaken)
  # Now call again same with same matix .. this time it should pick from cache so 
  ## shall take less time 
  start.time <- Sys.time()
  cacheSolve(cachematdata)
  timeTaken <- Sys.time() - start.time
  print ("Time taken after caching")
  print(timeTaken)
}
## End of testInverseCache

## Sample Test data
set.seed(1)
r = rnorm(4000000)
mat = matrix(r, nrow=2000, ncol=2000)
testInverseCache(mat)

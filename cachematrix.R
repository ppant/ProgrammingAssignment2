## Programming assignment 2 
## Put comments here that give an overall description of what your
## functions do

## This function will create a new matrix obj which can cache inverse that can be used later 

makeCacheMatrix <- function(x = matrix(c(1,2,3,4),nrow = 2, ncol = 2, byrow = TRUE)) {
  
  # ToDo: We need to make special matrix object, inverse of that object to be cached  
  ## inverse will be created in seperate routine
  ## square 2x2 matrix
  print (x)
  cacheSolve(x)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Inverse of a matrix of the x which is getting passed in cachesolve
  invmat<-solve(mat)
  print (invmat)
        ## Return a matrix that is the inverse of 'x'
}

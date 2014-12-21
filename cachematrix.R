## two functions that cache the inverse of a matrix


## this creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

        ## initialize the cache
        cache <- NULL
        
        ## set the matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                cache <<- NULL
        }
        
        ## get the matrix
        getMatrix <- function() {
                x
        }
        
        ## set the inverse
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        
        ## get the inverse
        getInverse <- function() {
                cache
        }
        
        ## return a list of methods
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## get inverse of the matrix object from makeCacheMatrix().
## if inverse has already been calculated, retrieve from cache. Otherwise find inverse.

cacheSolve <- function(x, ...) {
        
        ## returns a matrix that is the inverse of x
        inverse <- x$getInverse()
        
        ## if cached just return the cached data
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        
        ## get the matrix from our object
        data <- x$getMatrix()
        
        calculate the inverse
        inverse <-solve(data)
        
        ## set the inverse
        x$cacheInverse(inverse)
        
        ## return the inverse
        inverse
}


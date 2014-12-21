## two functions that cache the inverse of a matrix


## this creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

        
        cache <- NULL
        
        setMatrix <- function(newValue) {
                x <<- newValue
                cache <<- NULL
        }
        getMatrix <- function() {
                x
        }
        
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        
        getInverse <- function() {
                cache
        }
        
                
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## get inverse of the matrix object from makeCacheMatrix().
## if inverse has already been calculated, retrieve from cache. Otherwise find inverse.

cacheSolve <- function(x, ...) {
        
        
        inverse <- x$getInverse()
        
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$getMatrix()
        inverse <-solve(data)
        x$cacheInverse(inverse)
        
        inverse
}


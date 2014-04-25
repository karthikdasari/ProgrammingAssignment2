## makeCacheMatrix gives a list of four functions
## cacheSolve computes the inverse of a matrix or returns the   
## cached value if the calculation is alredy done 

## makeCacheMatrix returns a list of four functions set, get    ##setinverse and getinverse

makeCacheMatrix <- function(x = matrix()) {
	I <- NULL
        set <- function(y) {
                x <<- y
                I <<- NULL
        }
        get <- function() x
        setInverse <- function(Inverse) I <<- Inverse
        getInverse <- function() I
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)	

}


## This function looks in the element that is passed as an    argument      ##and retrieves the inverse of the original matrix from the cache, 
##or, calculates it and stores it accordingly 

cacheSolve <- function(x, ...) {
      I <- x$getInverse()
        if(!is.null(I)) {
                message("getting cached data")
                return(I)
        }
     matrix <- x$get()
     library(MASS)
       I <- ginv(matrix)  #ginv in the MASS package will give the generalized inverse of a matrix      
       x$setInverse(I)
       I

}

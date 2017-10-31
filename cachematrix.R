# Programming Assignment 2: Lexical Scoping - PBlevins
## The funtions, "makeCacheMatrix" and "cacheSolve" will be used to ## cache the inverse of a matrix.
## Matrix inversion can be a long computation and thus better to  ## cache the inverse of a matrix instead of compute it repeatedly. 

#makeCache Matrix creates a special "matrix" object that can cache its inverse.

    makeCacheMatrix <- function(x = matrix())
            inv <- NULL
            set <- function(y) {
                    x <<- y
                    inv <<- NULL
            }
            get <- function() x
            setInv <- function(inverse) inv <<- inverse
            getInv <- function() inv
            list(set = set, get = get,
                 setInv = setInv,
                 getInv = getInv)
    }

## cacheSolve computes the inverse of the "matrix" created by 
## makeCacheMatrix above. After the invervse is computed, the matrix stays unchanged, and the cacheSolve should return the inverse of the cache. 

    cacheSolve <- function(x, ...) {
            inv <- x$getInv()
            if(!is.null(inv)) {
                    message("getting cached data")
                    return(inv)
            }
            data <- x$get()
            inv <- solve(data, ...)
            x$setInv(inv)
            inv
    }


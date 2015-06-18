## In these two functions we illustrate how we can catch data and save 
## them to be returned instead of repeatedly re-calculate.
        
## this function create a spacial matrix which is actually a list that
## store getters and stters of the matrix and also getter and setter of the data 
## we want to catch
        
makeCacheMatrix <- function(x = matrix()) {
        inverse<-NULL
        set <- function(y)
        {
                x<<-y
                inverse<<-NULL
        }
        get<- function() x
        
        setinverse<-function(inv) inverse<<-inv
        getinverse<-function() inverse
        
        list(set=set,get=get, setinverse=setinverse,getinverse=getinverse)
                
       } 


## this function check if we are already calculate the inverse of the matrix x
## if so we return the inverse, otherwise we calculate it  and set it to the matrix
## to save it for future use.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse<-x$getinverse()
        if(!is.null(inverse)){
                print('we have catched the inverse')
                return (inverse)
                }
         matrix<-x$get()
         inverse=solve(matrix,...)
         x$setinverse(inverse)
         inverse
}

        


Week 3 programming assignment - Caching the Inverse of a Matrix.

# Introduction

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. The cachematrix.R program provides an inter-linked pair of 
functions that cache the inverse of a matrix.

The functions are:

1.  'makeCacheMatrix': This function creates a special "matrix" object
    that can cache its inverse.
    
2.  'cacheSolve': This function computes the inverse of the special
    "matrix" returned by 'makeCacheMatrix'. If the inverse has
    already been calculated (and the matrix has not changed), then
    'cacheSolve' will retrieve the inverse from the cache.
    
The program assumes the specified matrix is correctly defined and is 
invertible.    

# Call commands (with example square matrix)

setwd(file.path(getwd(), "Coursera", "R", "ProgrammingAssignment2-master")) 
source("cachematrix.R")
squareMatrix <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
myMatrix <- makeCacheMatrix(squareMatrix) 
cacheSolve(myMatrix)

# Observed results

If run correctly, the above commands will produce:

> squareMatrix <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
> myMatrix <- makeCacheMatrix(squareMatrix) 
> cacheSolve(myMatrix)
Generating inverse
     [,1] [,2]
[1,]    6    8
[2,]    2    4
> cacheSolve(myMatrix)
Retrieving cached inverse
     [,1] [,2]
[1,]    6    8
[2,]    2    4

# Alternative formulation

Alternative matrix formulations can be utilised provided they are square,
such as:

> squareMatrix <- matrix(c(2, 0, 2, 1, 2, 0, 0, 0, 1), nrow = 3, ncol = 3)


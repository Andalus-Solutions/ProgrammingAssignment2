# Week 3 programming assignment - Caching the Inverse of a Matrix.

# Program:       cachematrix.R
# Written by:    Andrew Eaves
# Last amended:  25 November 2016
# Version:       v1.0

# Purpose:       Inter-linked pair of functions to cache and retrieve the inverse of a matrix.

# Call commands: setwd(file.path(getwd(), "Coursera", "R", "ProgrammingAssignment2-master")) 
#                source("cachematrix.R")
# [example]      squareMatrix <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
#                myMatrix <- makeCacheMatrix(squareMatrix) 
#                cacheSolve(myMatrix)

# Assumptions:   Specified matrix is correctly defined and is invertible.

# ============================================================================================================================= #

# Function 1: Creates a special "matrix" object that stores a matrix and its inverse within a list in the parent environment.

makeCacheMatrix <- function(myMatrix = matrix()) {
        # Create an inverse matrix with absent (not available) real values within the local environment.
        inverseMatrix <- matrix(data = NA_real_, dim(myMatrix))

        # Module to assign required data objects to the parent environment using assignment operators to hold memory.
        set_fn <- function(anyValue) {
                  myMatrix <<- anyValue
                  inverseMatrix <<- NULL
        }

        # Define the retrieval of the matrix from the parent environment. 
        get_fn <- function() myMatrix

        # Define the assignment of the inverse matrix into the parent environment.
        setinvMat_fn <- function(invMat) inverseMatrix <<- invMat

        # Define the retrieval of the inverse matrix from the parent environment.
        getinvMat_fn <- function() inverseMatrix

        # Assign each function to a named element within a list and return it to the parent environment.
        list(set_fn = set_fn, get_fn = get_fn, setinvMat_fn = setinvMat_fn, getinvMat_fn = getinvMat_fn)
}

# ============================================================================================================================= #

# Function 2: Retrieves the inverse matrix from the cache in the makeCacheMatrix() environment or generates a new one.

cacheSolve <- function(myMatrix, ...) {
        # Retrieve the inverse matrix from the makeCacheMatrix() environment list.
        inverseMatrix <- myMatrix$getinvMat_fn()

        # If a populated inverse matrix is already available in the cache then retrieve it ...
        if(all(!is.na(inverseMatrix))) {
                message("Retrieving cached inverse")
                return(inverseMatrix)
        }
        
        # ... otherwise generate and cache the inverse matrix.
                message("Generating inverse")

                # Populate a local matrix. 
                myMatrix2 <- myMatrix$get_fn()

                # Generate the inverse. 
                inverseMatrix <- solve(myMatrix2)

                # Cache the inverse matrix in the makeCacheMatrix() environment.
                myMatrix$setinvMat_fn(inverseMatrix)

                # Display the inverse.
                print(inverseMatrix)
}

# ============================================================================================================================= #

# LU Factorization

## Purpose & How:
The LU factorization function works with the coefficient matrix [A] attained from a given system of equations. The coefficient matrix [A] is factored into an upper [U] triangular matrix and a lower [L] triangular matrix through the use of Gauss Elimination (with forward elimination and partial pivoting). A pivoting [P] matrix is also produced to keep track of the partial pivoting that occurs. The three derived matrices can be used to solve a system of equations, even if the [b] matrix that they are set equal to is changing.

### Inputs:
*A* - coefficient matrix

### Outputs:
*L* - lower triangular matrix
*U* - upper triangular matrix
*P* - the pivot matrix

## Limitations:
* The coefficient matrix must be a square matrix (n x n).

## Other Useful Information:

#### Equations:
[P][A]=[L][U]

# Numerical-Methods
The following repository includes numerical method algorithms created for Mechanical Engineering 105 for the spring 2018 semester.

## What are Numerical Methods?
Algorithms that recast "mathematical operations into the simple kind of algebraic and logical operations compatiable with digital computers."     - Applied Numerical Methods by Steven C. Chapa Chapter 1 Section 3

Life is not made of exact answers; it is made of estimations. As an engineer, our job is to use these numerical methods to determine the best possible estimate with the lowest possible computational time. The goal is to find a balance between the accuracy and the time to be as efficient as possible.

Numerical Methods in Mech 105 focus on root finding, optimization, and solving systems of simultaneous linear algebraic equations.

## Included Methods:

  ### 1. False Position 
 ###### (Linear Interpolations Method)
  A root locating method that uses an interval to bracket the root. A straight line is drawn connecting the endpoints of the function over the interval. Where the line crosses the x-axis is where the new root it located. The new root then replaces the x-value of which ever endpoint creates a y value with the same sign as the y value produced from plugging the new root into the function. This process is repeated until a desirable estimation is achieved.

  ### 2. LU Factorization
  ###### (System of Equations)
  The LU factorization function works with the coefficient matrix [A] attained from a given system of equations. The coefficient matrix [A] is factored into an upper [U] triangular matrix and a lower [L] triangular matrix through the use of Gauss Elimination (with forward elimination and partial pivoting). A pivoting [P] matrix is also produced to keep track of the partial pivoting that occurs. The three derived matrices can be used to solve a system of equations, even if the [b] matrix that they are set equal to is changing.

  ### 3. Simpson
###### (Integration)
The Simpson function works to estimate the sum of all the f(x) values of a set of equally spaced data. It works by taking the area for a parabola connecting 3 points then adding up all the parabolas with a specified equation. If there are an even number of points (an odd number of segments), the function uses the trapezoidal rule on the last segment of the given data. 

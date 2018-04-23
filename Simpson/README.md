# Simpson

## Purpose:
To estimate the integration of a given data set.

## How:
The Simpson function works to estimate the sum of all the f(x) values of a set of equally spaced data. It works by taking the area for a parabola connecting 3 points then adding up all the parabolas with a specified equation. If there are an even number of points (an odd number of segments), the function uses the trapezoidal rule on the last segment of the given data. 

### Inputs:
*x* - independent variables

*y* - dependent variables (w/ respect to x)

### Outputs:
*I* - integral (of the vector of function values 'y' w/ respect to 'x')


## Limitations:
* This is only an estimate and and has an increased error compared to if the 3/8 rule were used.
* The Simpson 1/3 rule is limited to evenly spaced intervals.
* The Simpson 1/3 rule is limited to an odd number of points (even number of segments/intervals).

## Other Useful Information:

#### Equations:
###### Simpson's 1/3 Rule

I=(b-a)*( f(x0) + 4*values1 + 2*values2 + f(xn) )/(3*n)

values1 = summation of y(xi)    i=1,3,5... to n-1

values2 = summation of y(xj)    j=2,4,6... to n-2

###### Trapezoidal Rule

trap = (b-a)*(f(a)+f(b))/2


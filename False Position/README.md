## False Position

## Purpose:
To estimate the location of a root.

## How:
The root locating method uses an interval, a lower and upper bound, to bracket the root. A straight line is drawn connecting the endpoints of the function over the interval. Where the line crosses the x-axis is where the new root it located. The new root then replaces the x-value of which ever endpoint creates a y value with the same sign as the y value produced from plugging the new root into the function. This process is repeated until a desirable estimation is achieved.


#### Inputs:

*func* - the function being evaluated
 
*xl* - the lower guess/bound

*xu* - the upper bound

*es* - the desired relative error (default = 0.0001% )

*maxiter* - the number of iterations desired (default = 200 )



#### Outputs:

*root* - the estimated root location

*fx* - the function evaluated at the root location

*ea* - the approximate relative error (%)

*iter* - the number of iterations performed



## Limitations:



## Other Useful Information:

#### Equation:
*root = xu - ( ( f(xu) * (xl-xu) ) / ( f(xl)-f(xu) ) )
*ea = abs ( (rootNew-root) / rootNew ) * 100

#### Menu Option
The use of a menu allows the user to determine if they would like to set a *maxiter* without having to specificy an *es*

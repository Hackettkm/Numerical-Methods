function [I] = Simpson(x,y)
% PURPOSE
%   The Simpson function integrates experimental data using the Simpson's
%   1/3 Composite rule for data with an even number of intervals and a
%   combination of the Simpson's 1/3 Composite rule with the Trapezoidal
%   rule for data with an odd number of intervals. For odd intervals, the
%   trapezoidal rule is applied to the last interval.
% INPUTS
%   x = independent variables
%   y = dependent variables (w/ respect to x)
% OUTPUT
%   I = integral (of the vector of function values 'y' w/ respect to 'x')
%% Check for Errors

if nargin~=2            % Check if enough input is given.
    error ('Not enough input given. There must be an x vector and a y vector')
end

xL = length(x)          % Number of x elements
yL = length(y)          % Number of y elements

if xL ~= yL             % Check if the x and y vectors have the same number of elements.
    error ('The dimensions of the x and y vectors do not match. Please make sure they are the same length.')
end

D = diff(x)             % Compute the difference between each adjacent values in the x vector.
                        % Note: the resulting vector with have one less
                        % element compared to the x vector.
                        
if max(D)~=min(D)                   % Check that all x inputs are equally spaced. If the max does not equal the min, then they are not.
    change=abs(max(D)-min(D))       % Calculated the difference between max and min to see by how much they are not the same.
    if change<(10^(-10))            % If the difference is very small, it is likely due to a truncation error. 
                                    % Such cases occur with numbers that are not easily stored in binary (i.e.  0.01).
        warning ('A truncation error has occured. It is highly likely that the x inputs are equally spaced.')
    else                            % It is likely the x input values are not equally spaced.
    error ('The x input values are not equally spaced.')
    end
end

%% Intervals

n = xL - 1                  % Number of intervals
Remainder = mod(n,2)        % Determines if the intervals are even or odd.
                            % Remainder = 1 Odd       Remainder = 0 Even

if Remainder == 1           % Odd number of intervals. Warn user of trapesoidal rule use.
    
    warning ('There are an odd number of intervals. The trapezoidal rule will be used on the last interval.')
    xL=xL-1                 % Removes last point that will be used in trapezoidal rule instead.
    n=n-1                   % Turns into even number of intervals for use with the Simpson's 1/3 composite rule.
                            % Last segment/interval removed will be used with trapezoidal rule.
end

%% Find I for Even Intervals

    a=x(1) ; b=x(xL)                % Set the range
    
    count=0                         % Counter will be used for creating vectors.
    
    
    for i=1:2:n-1                   % Equivalent to the summation notation that adds all y(xi) skipping one at a time until it reaches the y value before the end.
        count=count+1
        values1(1,count)=y(i+1)     % i+1 is added because y(x1) is equivalent to the 2nd y value and so forth.
    end
    values1=sum(values1)            % The values are summed up.
    
    
    for j=2:2:n-2                   % Equivalent to the summation notation that adds all y(xj) skipping one at a time until it reaches the y value one away from the end.
        count=count+1
        values2(1,count)=y(j+1)     % j+1 is added because y(x2) is equivalent to the 3nd y value and so forth.
    end
    values2=sum(values2)            % The values are summed up.
    
    
    I=(b-a)*( y(1) + 4*values1 + 2*values2 + y(xL) )/(3*n)   % Simpson's 1/3 Composite Equation
    
%% Find I for Odd Intervals
if Remainder == 1                   % Odd number of intervals
    
    xL=length(x)                    % Reset number of x and y elements
    c=x(xL-1) ; d=x(xL)             % Create new range to encompass the last interval 
    
    trap = (d-c)*(y(xL-1)+y(xL))/2  % Trapezoidal Equation - Single Application

    I= I + trap                     % Combine with intergral from Simpson's 1/3 Rule
end

end


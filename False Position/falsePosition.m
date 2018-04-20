function[root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% PURPOSE:
%   The function falsePosition uses the method of false position to estimate
%  the root of a given function provided the lower and upper
%  bounds, the desired relative error, and the desired number of iterations (the last two being optional).
% INPUTS:
%   func - the function being evaluated
%   xl - the lower guess/bound
%   xu - the upper guess/bound
%   es - the desired relative error (default = 0.0001%)
%   maxiter - the number of iterations desired (default = 200)
% OUTPUTS:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

% Check the number of input values and create any default values.
if nargin < 3 || nargin > 5
    error ('Invalid number of input information given. Please recheck number of input values.')
elseif nargin == 3
    % Set default values.
    es = 0.0001;
    maxiter = 200;
else nargin == 4
    % Check if the 4th value entered is meant to be the approximate
    % relative error or the number of iterations.
    choice=menu('Was the last input value the desired relative error or the max number of iterations?','Relative Error','Max Iterations');
    if choice==1
        % The 4th value is for relative error so it can stay the same and
        % the default for the max number of iterations is set.
        es=es;
        maxiter=200;
    else choice==2
        % The 4th value is for the max number of iterations so it must be
        % changed and the default for the relative error is set.
        maxiter=es;
        es=0.0001;
    end
end

% Check that bounds given actually bracket the root.
fxl=func(xl);    % Function evaluated at xl.
fxu=func(xu);    % Function evaluated at xu.
CheckSign=fxl*fxu;
if CheckSign>0
    % If the sign of the two values is positive then both the values have
    % the same sign and do not bracket the root.
    error('There is no sign change. Root is not bracketed.')
elseif CheckSign==0
    % If the two values multiplied together equals zero than at least one
    % of the values must be zero in which case it is a root.
    error('One of the bracket values is a root.')
end
    
% Function to solve for the first estimated root location.
root = xu - (fxu*(xl-xu)) / (fxl-fxu);

% Set the estimated root as one of the new brackets.
fx=func(root);
if sign(fxl*fx)==1
    xl=root;     % If the evaluated functions have the same sign, then the root will replace the lower bracket value.
else
    xu=root;     % The root will replace the upper bracket value.
end

% Solve for the next estimated root.
fxl=func(xl);
fxu=func(xu);
rootNew = xu - (fxu*(xl-xu)) / (fxl-fxu);


% Solve for the relative error using the previous root estimate and the new
% root estimate.
ea=abs(((rootNew-root)/rootNew))*100;

% The first iteration is complete.
iter=1;

% Repeat this false positioning process until a root is given that gives a
% value for the relative error that is smaller than the desired value or
% until the max number of iterations have been completed.

while ea>=es && iter<maxiter
    
    iter=iter+1;     % Count each iteration.
    
    root=rootNew;    % Set the old root as the new root.
    
    % Set the estimated root as one of the new brackets.
    fx=func(root);
    if sign(fxl*fx)==1
        xl=root;     % If the evaluated functions have the same sign, then the root will replace the lower bracket value.
    else
        xu=root;     % The root will replace the upper bracket value.
    end
    
    % Solve for the next estimated root.
    fxl=func(xl);
    fxu=func(xu);
    rootNew = xu - (fxu*(xl-xu)) / (fxl-fxu);
    
    % Solve for the relative error using the previous root estimate and the
    % new root estimate.
    ea=abs(((rootNew-root)/rootNew))*100;
end

format long
root=double(rootNew)
fx=double(func(root))
iter=double(iter)
ea=double(ea)

end
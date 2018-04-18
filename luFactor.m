function [L,U,P] = luFactor(A)
% PURPOSE:
% The luFactor function is used to factor the coefficient matrix [A] of a
% system of equations into matrices [L] and [U](described below). The
% program, with a method similar to Gauss Elimination, uses forward
% elimination and partial pivoting to achieve the two matrices. Those
% matrices can then be used, along with the pivoting matrix [P], to solve a system of equations by solving for
% the variables that satisfy all the equations simultaneously.
% IMPORTANT RELATIONSHIP:
%   [P][A]=[L][U]
% INPUTS:
%   A = coefficient matrix
% OUTPUTS:
%   L = lower triangular matrix
%   U = upper triangular matrix
%   P = the pivot matrix

clc

%% Check Information Given
% If the user gave too many or too little inputs.
if nargin~=1
    error ('Invalid number of input information given. Please provide one coefficient matrix.')
end

% Check that the matrix is a square matrix.
[r,c]=size(A) 
 % r = number of rows
 % c = number of columns

if r~=c
    error ('The matrix provided is not a square matrix. Please give a new A matrix.')
end

% Check if user entered a zeros matrix.
Zero=zeros(r)
    if A==Zero
        error ('Are you sure about that? You are solving for nothing here if your coefficients are all zero! You may want to rethink your decision.')
    end
%% Set UP
% Set inital pivioting matrix. Note that it is dependent on the size of A.
% The lower triangular matrix will also start the same. The upper
% triangular matrix will start as A.
P = abs(inv(A) * A)
L = abs(inv(A) * A)
U = A

%% 1st Pivot
% Check A matrix and pivot if needed so that the largest absolute value in
% column 1 is in the top left corner of the matrix.

[max_num,max_idx]=max(abs(A(:,1)))
    % max_num holds the greatest absolute value in column 1.
    % max_idx holds the row number that the value is in.

if max_num~=abs(A(1,1))                     % If the max value is not already in the first row.
   U([1 max_idx],:)=A([max_idx 1],:)        % Switch the first row with the row that the max value is in.
   P([1 max_idx],:)=P([max_idx 1],:)        % Switch the same rows in the pivot matrix.
end

%% Eliminate and Pivot 

for j= 2:c                             % For loop to change which column working within.
    
% Eliminating
    for i=j:r                          % For loop to change which row working in.
        
        k=j-1                          % Placeholder to keep in the same column while eliminating 
                                       % the values in the rows of that column below the diagonal.
                                         
        L(i,k)= U(i,k)/U(k,k)          % U(k,k) is the diagonal values. U(i,k) are the values below the diagonal
                                       % that are divided by the diagonal. The answer in placed in the L matrix 
                                       % with the location corresponding to where the U(i,k) was eliminated. 
                                        
        U(i,:)= U(i,:)- L(i,k)*U(k,:)  % Multiply the row of the diagonal value used with the L then subtract it 
                                       % from the row that is being eliminated. The new values replace the row that
                                       % was eliminated.
                                         
    % This is repeated until all the values below the diagonal value in the specific column are equal to zero. 
    end
    
% Pivoting
    [max_num,max_idx]=max(abs(U(j:r,j)))
    
        % max_num holds the greatest absolute value in a column when looking 
        % only at the values below and including the diagonal value.
        
        % max_idx holds the row number that the value is in compared to 
        % the number of rows being examined.
    
     max_idx=max_idx +(j-1)
     
        % Due to how the max function works, the max_idx will not always
        % correspond to the row which is why the (j-1) was added. For
        % example in the third column(j=3) of a 4x4, the max_idx will show
        % only as a 1 or 2. Therefore the rest of the rows above not being
        % analyzed must be added back on to give correct placement.

    if max_num~=abs(U(j,j))                         % If the max value is not where it should be, then switch rows. 
        U([j max_idx],:)= U([max_idx j],:)          % Switches rows in [U] before eliminating that column.
        P([j max_idx],:)= P([max_idx j],:)          % Switch the same row numbers for [P]. 
        L([j max_idx],1:j-1)= L([max_idx j],1:j-1)  % After L values were made, they must also be switched when another 
                                                    % pivoting occurs.However, the whole row does not pivot. Only the 
                                                    % value of the column being worked on and the values to the left will 
                                                    % need to switch rows to stay consistent. 
                                                  
    end
end


end


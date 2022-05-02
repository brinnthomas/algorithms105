function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);%makes matrix full of zeros
if n<0
    disp('Not a valid row number for this function')
end
if m<0
  disp('Not a valid column number for this function')  
end
% Now the real challenge is to fill in the correct values of A
for i=1:n %all row numbers
    for j=1:m%all column numbers
        if i==1
            A(i,j)=j;% if above condition is satisfied it will give a value to j
        elseif j==1
            A(i,j)=i;%if the above condition is satisfied it will give a value to i
        else
        A(i,j)=A(i-1,j)+A(i,j-1);%if neither of the above statements are true it will resort to this condition 
        end
    end 
end
end 
% Things beyond here are outside of your function

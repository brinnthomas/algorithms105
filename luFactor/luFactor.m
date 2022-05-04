function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[rw,cl]=size(A);
if rw~=cl
    error('must be a square matrix')
end
L=eye(rw);
P=eye(rw);
U=A;
for rows=1:rw
    [~,m]=max(abs(U(rows:rw,rows)));%finds the max value in matrix to pivot
    m=m+rows-1;
    if m~=rows
        U([m,rows],:)=U([rows,m],:);%switches the row values and rw in Upper Triangular
        P([m,rows],:)=P([rows,m],:);%Switches the rows rw and row values in Permutation Matrix
        if rows>= 2
            L([m,rows],1:rows-1)=L([rows,m],1:rows-1);% switches the rows of L in the lower matrix
        end
    end
    for i=rows+1:rw
        L(i,rows)=U(i,rows)/U(rows,rows);
        U(i,:)=U(i,:)-L(i,rows)*U(rows,:);
    end
end



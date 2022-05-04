function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%OUTPUTS:
%root- root real
%fx-value @ root
%ea-approx relative error
%iter-number of iterations
%INPUTS:
%xl-lower bound
%xu-upper bound
%es- approx error defaults to .0001
%maxit-max number of iterations (defaults to 200)
sc=1;
if nargin<3
    error('At least 3 arguments')
elseif nargin==3
        maxit=200;
        es=.000001;
elseif nargin==4
    maxit=200; 
end
iter=0;
ea=1;
if func(xl)*func(xu)>=0
    error('These inputs do not bracket the root')
end
while sc==1
root=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
if iter>1
    ea=abs((root-xl)/root)*100;
end
iter=iter+1;
xl=root;
if iter>maxit
    sc=0;
end
if isnan(ea)
    ea=0
end
if ea<es
    sc=0;
   
end
end
fx=func(root)

end

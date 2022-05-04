function [I] = Simpson(x,y)
%Numberical evaluation of integral by Simpsons 1/3 rule
%Inputs
% x-The vector equallly spaced independent variable
% y-the vector of function values with respect to x
%Outputs
 %I=the numberical integration calculated
n=numel(x)-1;
if numel(x)~=numel(y)
    error('Number of inputs must be equal')
end
eq=[linspace(x(1),x(numel(x)),numel(x))==x];
if sum(eq)~=sum(ones(1,numel(x)))
    error('intervals must be evenly spaced')
end
h=(x(numel(x))-x(1))/n;
if numel(x)==3
    I=(h/3)*(y(1)+4*y(2)+y(3));
    return
end
if rem(n,2)==1 %%odd number of points)
    oy=0;
    ey=0;
    warning('Trapezoidal Rule will be used for last interation')
for i=3:2:numel(x)-2
    oy(i)=y(i);
end 
for j=2:2:numel(x)-2
    ey(j)=y(j);
end
oddn=sum(oy);
evenn=sum(ey);
I=(h/3)*(y(1)+2*oddn+4*evenn+y(n))+(h/2)*(y(n)+y(n+1));
end
if rem(n,2)==0 %even number of intervals
    oy=0;
    ey=0;
for i=3:2:numel(x)-2
    oy(i)=y(i);
end 
for j=2:2:numel(x)-2
    ey(j)=y(j)
end
oddn=sum(oy);
evenn=sum(ey);
I=(h/3)*(y(1)+2*oddn+4*evenn+y(n+1))
end

end
function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Brinn Thomas 4/25/2022
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(x)~=length(y)
    error ('arrays must be the same size')
end
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
n=length(x);
q1=sortedY(floor((n+1)/4));
q3=sortedY(floor((3*n+3)/4));
iqr=q3-q1;
track=logical(ones(1,n));
for i=1:1:n
    if sortedY(i)<(q1-(1.5*iqr))|| sortedY(i)>(q3+(1.5*iqr))
        track(i)=0;
    end
end
fY=sortedY(track);
fX=sortedX(track);
Nn=length(fX);
sXY=0;
sumXsq=0;
sX=sum(fX);
sY=sum(fY);
avgY=sum(fY)/Nn;
avgX=sum(fX)/Nn;
for k=1:Nn
    sXY=sXY+fX(k)*fY(k);
    sumXsq=sumXsq+fX(k)^2;
end
slope=(Nn*sXY-sX*sY)/(Nn*sumXsq-sX^2);
intercept=(avgY-(slope*avgX))
Sr=0;
St=0;
for j=1:Nn
    Sr=Sr+((fY(j)-intercept-slope*(fX(j)))^2)
    St=St+(fY(j)-avgY)^2
end
 Rsquared=(St-Sr)/St
end

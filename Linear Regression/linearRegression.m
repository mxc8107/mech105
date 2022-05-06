function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Megan Chambless
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
%     5. Rsquared: R^2, a.k.a. coefficient of determination\
sx=size(x)
sy=size(y)
n=sx(2)
while (1)
    if sx(2)~=sy(2)
        error('not same size')
        break
    end
[sortedY, sortOrder] = sort(y)
sortedX = x(sortOrder) 
FX=sortedX
FY=sortedY
    qQ1=floor((n+1)/4)
    qQ3=floor((3*n+3)/4)
    Q3=FY(qQ3)
    Q1=FY(qQ1)
    IQR=Q3-Q1
    QQ3=(IQR*1.5)+Q3
    QQ1=Q1-(IQR*1.5)
    if QQ3<=FY(n) %filter - get rid of outliars Q3
    out=find(FY(1,:)>=QQ3)
    p=length(out)
    FX=FX(1,1:n-p)
    FY=FY(1,1:n-p)
    n=length(FX)
    end
    if QQ1>=FY(1) %filter - get rid of outliars Q1
        out=find(FY(1,:)<=QQ1)
     p=length(out)
    FX=FX(1,p+1:n)
    FY=FY(1,p+1:n)
    end
    n=length(FX)
    SXY=sum(FX.*FY)
    SX=sum(FX)
    SY=sum(FY)
    SXX=sum((FX).^2)
    SX2=SX.^2
    ybar=mean(FY)
    xbar=mean(FX)
    m=((n*SXY)-(SX*SY))/((n*SXX)-(SX2))
    b=ybar-(m*xbar)
    fx=m*FX+b
    sstot=(FY-ybar).^2
    ssres=(FY-fx).^2
    SStot=sum(sstot)
    SSres=sum(ssres)
    Rsquared=(SStot-SSres)./SStot
    break
end
fX=FX
fY=FY
slope=m
intercept=b
Rsquared=Rsquared
end

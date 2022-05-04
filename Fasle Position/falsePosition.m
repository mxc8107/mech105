function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
fxl=func(xl,varargin {:})
fxu=func(xu,varargin {:})
if nargin<3
    error ('not enough points') %needs to have 2 initial points plus the equation
end
if fxl*fxu>0 %you want the points to bracket the root 
    error ('doesn’t bracket - choose new points')
end
iter=0;
maxit=200;
es=.0001;
ea=100;
    while (1)
        root=xu-(fxu*(xl-xu))./(fxl-fxu);
        froot=func(root,varargin {:});
        iter=iter+1;
        oroot=root
        if froot==0; %when the y of the root equals 0 then you found your root
            root=root;
            ea=0
        else froot~=0
            if froot>0 %if the root is greater than 0 it is going to become the upper point
                ea=abs((xu-oroot)/xu)*100
                xu=root;
            else froot<0 %if the root is less than 0 it is going to become the lower point
                ea=abs((xl-oroot)/xl)*100
                xl=root;
            end
        end
        if iter>=maxit || ea<=es %if the error is high enough or if you try too many times to get the root the function will stop
            break
        end
    end
    fx=func(root,varargin {:})
    root=root
    iter=iter
    ea=ea
end


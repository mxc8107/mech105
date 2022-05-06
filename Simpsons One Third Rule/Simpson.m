function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
sx=size(x)
sy=size(y)
xma=max(x)
xmi=x(1)
n=find(x==max(x(1,:)))
yma=y(n)
ymi=y(1)
I=0
i=1
while (1)
    i=i+1
    h=(xma-xmi)./(sy(2)-1)
    if sy(2)~=sx(2)
    error('sizes do not match, try again')
    break
    end
    if (xma-xmi)./(sx(2)-1)~=x(2)-xmi
        error('x values unequally spaced')
        break
    end
    if sy(2)==2 
        I=h./2.*(ymi+yma)
         warning('applying trazpizod rule')
        break
    elseif sy(2)==3
        y(2)=4.*y(2)
        ysum=sum(y(:))
        I=h./3.*(ysum)
        break
    else sy(2)>3
        m=mod(i,2)
        if i==(sx(2)-1)
            if mod(sx(2),2) == 0
                warning('the trapezoidal rule has to be used on the last interval')
                ysum=sum(y(:))-yma
                I = (ysum*h/3) + ((y(sx(2)) + y(sx(2)-1))*h/2)
                break
            else mod(sx(2),2)==1
                ysum=sum(y(:))
                I=h./3.*(ysum)
                break
            end
        elseif m==1  %odd
            y(i)=2*y(i)
        else m==0 %even
            y(i)=4*y(i)
        end
    end
end
I=I
end


% Two important quantities when studying fermentation are the carbon dioxide
% evolution rate (g/h) and the oxygen uptake rate (g/h). These are calculated
% from expiremental analysis of the inlet and exit gases of the fermentor, and the
% flow rates, temperature, and pressure of these gases
% Time of Fermentation (hours)
time = [140 141 142 143 144 145 146 147 148 149];
% Carbon Dioxide Evolution Rate (g/hour)
CO2evo = [15.72 15.53 15.19 16.56 16.21 17.39 17.36 17.42 17.60 17.75];
% Oxygen Uptake Rate (g/hour)
OxUp = [15.59 16.16 15.35 15.13 14.20 14.23 14.29 12.74 14.74 13.68];

% Using your function in part 1, and the data table below, calculate the total
% amount of carbon dioxide produced and oxygen consumed during fermentation.
% Compare to the value that the MATLAB function trapz() computes. You would
% expect the solutions it be similar but not identical

% using the matlab solution
total_CO2_trap = trapz(time, CO2evo)
total_Ox_trap = trapz(time, OxUp)

% using the matlab solution
total_CO2_simp = Simpson(time, CO2evo)
total_Ox_simp = Simpson(time, OxUp)
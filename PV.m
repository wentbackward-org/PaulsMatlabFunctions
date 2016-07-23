function pv = PV(fv, I, n)
% FV calculates the period payments you need to make to achieve a
% a particular future value
% 
% fv = future value
% I = annual interest rate
% n = number of monthly periods
%
    r = I / 1200;
    pv = fv ./ (1 + r) .^ n;
end
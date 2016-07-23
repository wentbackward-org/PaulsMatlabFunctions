function fv = FV(pv, I, n)
% FV calculates the future value of a loan or investment
% pv = present value
% I = annual interest rate
% n = number of monthly periods
%
% For example, 100 invested at an annual rate of 10% for 12 months
% FV(100, 10, 12) ~= 110.4713
% or
% You borrow 1000 at 3.5% for 2 years (24 months)
% FV(1000, 3.5, 24) ~= 1072.3989, so you pay 72.3989 in interest
%
    r = I / 1200;
    fv = pv .* (1 + r) .^ n;
end
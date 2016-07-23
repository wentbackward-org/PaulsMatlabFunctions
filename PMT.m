function p = PMT(pv, I, n)
% PMT  Calculate the monthly payment for a fixed rate loan.
%  P = PMT(10000, 2.57, 36) returns the payment for a 10,000 loan with
%      an annualised interest rate of 2.57%, payed back over 36 months
% where
%  pv = present value or total loan amount 
%  I = the annual interest rate
%  n = the number of payment months
%
% pv, I and n can be vectors, e.g. n = (1:5)*12 will produce a vector
% of payments for betwen 1 and 5 years
%

 r = I / 1200;
 p = ( r .* pv ) ./ ( 1 - (1+r) .^ -n);
end
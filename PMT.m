
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
 p = (pv .* r) ./ (1 - exp( (-n) .* log(1+r) ));
 
end

%%The MIT License (MIT)
% 
% Copyright (c) 2016 Allied Talent Industrial Ltd (Kong Kong)
% 
% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documentation files (the
% "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to permit
% persons to whom the Software is furnished to do so, subject to the
% following conditions:
% 
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
% NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
% USE OR OTHER DEALINGS IN THE SOFTWARE.


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


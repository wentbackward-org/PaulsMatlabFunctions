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

function [schedule, payment] = PaymentSchedule(pv, I, n)
% PaymentSchedule - The amortisation schedule for a loan
% where
%  pv = present value or total loan amount 
%  I = the annual interest rate
%  n = the number of payment months
%
    r = 1 + I / 1200;
    periods = (1:n)';
    payment = PMT(pv,I,n);
    paid = periods*payment;
    % See here: https://en.wikipedia.org/wiki/Amortization_calculator
    balance = (pv * r .^ periods) - (payment * (((r .^ periods) - 1) ./ (r - 1)) );
    principal = pv - balance;
    interest = paid - principal;
    schedule = [periods paid principal interest balance];
    
end
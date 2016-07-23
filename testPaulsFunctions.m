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


%% Main function to generate tests
function tests = testPaulsFunctions
    tests = functiontests(localfunctions);
end

%% PMT Test Functions
function testPMT(testCase)
    payment = PMT(10000, 2.57, 60);
    verifyEqual(testCase, 177.7824, round(payment,4));
end
function testPMTnotional(testCase)
    % Test with multiple notionals
    pvs = [10000, 25000];
    I = 2.57;
    N = 60;
    
    results = [177.7824, 444.4561];

    payments = round(PMT(pvs, I, N),4);
    verifyEqual(testCase, results, payments);
end
function testPMTtenor(testCase)
    % test with multiple tenors
    pvs = 25000;
    I = 2.57;
    N = [12 24 36 48];
    
    results = [2112.4488 1069.7816 722.3023 548.6198];

    payments = round(PMT(pvs, I, N),4);
    verifyEqual(testCase, payments, results);
end
function testPMTcoupon(testCase)
    % Test with multiple coupons
    pvs = 25000;
    I = [1 1.5 2 2.5];
    N = 12;
    
    results = [2094.6353 2100.2992 2105.9717 2111.6528];

    payments = round(PMT(pvs, I, N),4);
    verifyEqual(testCase, payments, results);
end

%% FV Test Functions
function testFV(testCase)
    % Test with scalars
    pv = 1000;
    I = 12;
    N = 48;
    fv = round(FV(pv, I, N),4);
    result = 1612.2261;
    verifyEqual(testCase, fv, result);
end
function testFVnotional(testCase)
    pv = [1000 2000];
    I = 12;
    N = 48;
    fv = round(FV(pv, I, N),4);
    result = [1612.2261 3224.4522];
    verifyEqual(testCase, fv, result);
end
function testFVtenor(testCase)
    pv = 1000;
    I = 12;
    N = (1:5) * 12;
    fv = round(FV(pv, I, N),4);
    result = [1126.8250  1269.7346 1430.7688 1612.2261 1816.6967];
    verifyEqual(testCase, fv, result);
end
function testFVcoupon(testCase)
    pv = 1000;
    I = 1:0.5:3;
    N = 12;
    fv = round(FV(pv, I, N),4);
    result = [1010.0460 1015.1036 1020.1844 1025.2885 1030.4160];
    verifyEqual(testCase, fv, result);
end

%% PV Test Functions
function testPV(testCase)
    % Test with scalars
    fut = 1000;
    I = 12;
    N = 48;
    pv = round(PV(fut, I, N),4);
    result = 620.2604;
    verifyEqual(testCase, pv, result);
end
function testPVnotional(testCase)
    fut = [1000 2000];
    I = 12;
    N = 48;
    pv = round(PV(fut, I, N),4);
    result = [620.2604 1240.5208];
    verifyEqual(testCase, pv, result);
end
function testPVtenor(testCase)
    fut = 1000;
    I = 12;
    N = (1:5) * 12;
    pv = round(PV(fut, I, N),4);
    result = [887.4492 787.5661 698.9249 620.2604 550.4496];
    verifyEqual(testCase, pv, result);
end
function testPVcoupon(testCase)
    fut = 1000;
    I = 1:0.5:3;
    N = 12;
    pv = round(PV(fut, I, N),4);
    result = [990.0540 985.1212 980.2150 975.3353 970.4819];
    verifyEqual(testCase, pv, result);
end

%% FVpayment Test Functions
function testFVpayment(testCase)
    % Test with scalars
    pmt = 100;
    I = 3;
    N = 24;
    fv = round(FVpayment(pmt, I, N),4);
    result = 2470.2818;
    verifyEqual(testCase, fv, result);
end
function testFVpaymentnotional(testCase)
    pv = [100 200];
    I = 3;
    N = 48;
    fv = round(FVpayment(pv, I, N),4);
    result = [5093.1208 10186.2417];
    verifyEqual(testCase, fv, result);
end
function testFVpaymenttenor(testCase)
    pv = 100;
    I = 3;
    N = (1:5) * 12;
    fv = round(FVpayment(pv, I, N),4);
    result = [1216.6383 2470.2818 3762.0560 5093.1208 6464.6713];
    verifyEqual(testCase, fv, result);
end
function testFVpaymentcoupon(testCase)
    pv = 100;
    I = 1:0.5:3;
    N = 12;
    fv = round(FVpayment(pv, I, N),4);
    result = [1205.5153 1208.2845 1211.0613 1213.8459 1216.6383];
    verifyEqual(testCase, fv, result);
end

%% Test utilities
function test_columns_in(testCase)
    r = columns_in(2^32);
    verifyEqual(testCase, 10, r);
    
    r = columns_in(1);
    verifyEqual(testCase, 1, r);
end


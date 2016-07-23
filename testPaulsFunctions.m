%% Main function to generate tests
function tests = testPaulsFunctions
    tests = functiontests(localfunctions);
end

%% Test Functions
function testPMTscalar(testCase)
    payment = PMT(10000, 2.57, 60);
    verifyEqual(testCase, 177.7824, round(payment,4));
end

function testPMTvector(testCase)
    pvs = [10000, 25000];
    I = 2.57;
    N = 60;
    
    results = [177.7824, 444.4561];

    payments = round(PMT(pvs, I, N),4);
    verifyEqual(testCase, results, payments);
end

function testPMTdiffperiods(testCase)
    pvs = 25000;
    I = 2.57;
    N = [12 24 36 48];
    
    results = [2112.4488 1069.7816 722.3023 548.6198];

    payments = round(PMT(pvs, I, N),4);
    verifyEqual(testCase, payments, results);
end

function testPMTdiffrates(testCase)
    pvs = 25000;
    I = [1 1.5 2 2.5];
    N = 12;
    
    results = [2094.6353 2100.2992 2105.9717 2111.6528];

    payments = round(PMT(pvs, I, N),4);
    verifyEqual(testCase, payments, results);
end

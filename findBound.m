function [lbound, i] = findBound(fn, xstart, s)
% Find an upper bound on the value of lamda. Called by lineSearch.

% Initialize values
f = str2func(fn);
h = 0.1;
x1 = xstart;
f1 = f(x1);
x2 = x1 + h .* s;
f2 = f(x2);
i = 2;
maxEval = 10000;

% move along fn in direction of s until fn starts increasing
while f2 < f1
    x1 = x2;
    % accelerate bounding
    x2 = x2 + h .* i .* s;
    f1 = f2;
    f2 = f(x2);
    i = i + 1;
    if i > maxEval
        error('Max number of function evaluations exceeded')
    end
end
lbound = norm(x2 - xstart);
end

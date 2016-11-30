function [lamda, i] = lineSearch(fn, x0, s)
% Search the function fn along the direction s starting from
% x0. Lamda is the distance that minimizes fn along s, i is number of
% function evaluations.

% Initialize values
gr = (1 + sqrt(5)) / 2 - 1;
f = str2func(fn);
[lbound, i] = findBound(fn, x0, s);
la = 0;
lb = lbound;
l1 = la + gr * (lb - la);
l2 = lb - gr * (lb - la);
errx = 0.0001;
errf = 0.0001;
x1 = x0 + l1 .* s;
x2 = x0 + l2 .* s;
f1 = f(x1);
f2 = f(x2);
i = i + 2;
maxEval = 10000 + i;

% Search using golden section method
while norm(x1 - x2) > errx && abs(f1 - f2) > errf
    if f1 > f2
        lb = l1;
        l1 = l2;
        l2 = lb - gr * (lb - la);
    else % f1 <= f2
        la = l2;
        l2 = l1;
        l1 = la + gr * (lb - la);
    end
    x1 = x0 + l1 .* s;
    x2 = x0 + l2 .* s;
    f1 = f(x1);
    f2 = f(x2);
    i = i + 2;
    if i > maxEval
       error('Max number of function evaluations exceeded') 
    end
end
lamda = la;
end


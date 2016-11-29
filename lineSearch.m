function [lamda, fcurr] = lineSearch(fn, x0, s)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

gr = (1 + sqrt(5)) / 2 - 1;
f = str2func(fn);
lbound = findBound(fn, x0, s);
la = 0;
lb = lbound;
l1 = la + gr * (lb - la);
l2 = lb - gr * (lb - la);
i = 0;
maxItr = 10000;
errx = 0.0001;
errf = 0.0001;
x1 = x0 + l1 .* s;
x2 = x0 + l2 .* s;
f1 = f(x1);
f2 = f(x2);


while norm(x1 - x2) > errx && abs(f1 - f2) > errf
    if f1 > f2
        lb = l1;
        l1 = l2;
        l2 = lb - gr * (lb - la);
    else
        la = l2;
        l2 = l1;
        l1 = la + gr * (lb - la);
    end
    i = i + 1;
    if i > maxItr
       error('Max number of functional evaluations exceeded') 
    end
    x1 = x0 + l1 .* s;
    x2 = x0 + l2 .* s;
    f1 = f(x1);
    f2 = f(x2);
end
lamda = la;
fcurr = f1;
end


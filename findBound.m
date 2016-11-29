function lbound = findBound(fn, xstart, s)

f = str2func(fn);
h = 0.1;
x1 = xstart;
f1 = f(x1);
x2 = x1 + h .* s;
f2 = f(x2);
i = 1;
maxItr = 10000;

while f2 < f1
    x1 = x2;
    x2 = x2 + h .* i .* s;
    f1 = f(x1);
    f2 = f(x2);
    i = i + 1;
    if i > maxItr
        error('Max number of functional evaluations exceeded')
    end
end
lbound = norm(x2 - xstart);
end


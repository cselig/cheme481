function [xmin fmin iter] = Smin(fn,xstart,errx,errf)

N = length(xstart);
f = str2func(fn);
xcurr = xstart;
xprev = zeros(1, N);
fcurr = f(xstart);
fprev = 0;
i = 0;
maxItr = 10000;

while norm(xcurr - xprev) > errx && abs(fprev - fcurr) > errf
    % select direction to search
    grad = findGradient(fn, xstart, N);
    s = -1 .* grad;
    s = s ./ norm(s);
    [lamda, fcurr] = lineSearch(fn, xcurr, s);
    xprev = xcurr;
    xcurr = xcurr + lamda .* s;
    fprev = fcurr;
    fcurr = f(xcurr);
    i = i + 1;
    if i > maxItr
       error('Max number of functional evaluations exceeded') 
    end
end
xmin = xcurr;
fmin = fprev;
iter = i;

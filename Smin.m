function [xmin fmin iter] = Smin(fn,xstart,errx,errf)

N = length(xstart);
f = str2func(fn);
xcurr = xstart;
xprev = zeros(1, N);
fcurr = f(xstart);
fprev = 0;

% loop
while abs(xcurr - xprev) > errx && abs(fprev - fcurr) > errf
    fprev = fcurr;
    % select direction to search
    grad = findGradient(fn, xstart, N);
    s = -1 .* grad;
    s = s ./ norm(s);
    [lamda, fcurr] = lineSearch(fn, xcurr, s);
    xprev = xcurr;
    xcurr = xcurr + lamda .* s;
    % line search


xmin = 0;
fmin = 0;
iter = 0;
end

function [xmin, fmin, iter] = Smin(fn,xstart,errx,errf)

% Initialize values. N is dimension of problem space
N = length(xstart);
f = str2func(fn);
xcurr = xstart;
xprev = zeros(1, N);
fcurr = f(xstart);
fprev = 0;
iter = 0;
i = 0;
maxItr = 10000;
first = true;
repeat = true;

% Keep searching in direction determined by gradient until stopping 
% criteria met. Will always enter loop first time
while repeat || first
    first = false;
    fprev = fcurr;
    % select direction to search
    [s, gradItr] = findGradient(fn, xcurr, N);
    iter = iter + gradItr;
    [lamda, searchItr] = lineSearch(fn, xcurr, s);
    iter = iter + searchItr;
    xprev = xcurr;
    xcurr = xcurr + lamda .* s;
    fcurr = f(xcurr);
    i = i + 1;
    if i > maxItr
       error('Max number of function evaluations exceeded') 
    end
    % Check stopping criteria
    repeat = determineRepeat(xcurr, xprev, fprev, fcurr, errx, errf);
end
% Return results
xmin = xcurr;
fmin = fprev;
iter = iter + i;

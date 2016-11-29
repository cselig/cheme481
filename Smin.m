function [xmin fmin iter] = Smin(fn,xstart,errx,errf)

f = str2func(fn);
size(f)
% loop
    % select direction to search
    % s = - gradient
    % line search

x = 5;
y = 5;
    
xrange = [x-1:0.1:x+1];
yrange = [y-1:0.1:y+1];
end

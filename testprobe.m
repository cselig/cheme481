% Main Program for n-D Optimization Method
clear all

% Stopping Criteria.  When I run your program I will try various values
% To see how it performs
errx = 0.001;
errf = 0.001;

% Starting value.   Note how I create the vector.  Be sure your program
% works properly with the correct diminsionality.  This is for a two
% parameter problem but I will test it with higher diminsionality.
xstart(1) = -7;
xstart(2) = 7;

% "hw4e" is my "easy" test problem.
fn = 'hw3e';	% The function name

[xmin fmin iter] = Smin(fn,xstart,errx,errf)

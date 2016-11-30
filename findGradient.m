function [s, itr] = findGradient(fn, x0, N)
% determine gradient of f at x0

% Initialize values
f = str2func(fn);
grad = zeros(1, N);
h = 0.00001;
itr = 0;

% Determine gradient using finite forward difference
for i = 1:N
   f0 = f(x0);
   x1 = x0;
   x1(i) = x1(i) + h;
   f1 = f(x1);
   grad(i) = (f1 - f0) / h;
   itr = itr + 2;
end
% Convert gradient into direction along which to search
s = -1 .* grad;
s = s ./ norm(s);
end

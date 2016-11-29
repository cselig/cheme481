function grad = findGradient(fn, x0, N)
% determine gradient of f at x0

% Initialize values. N is dimension of problem space
f = str2func(fn);
grad = zeros(N, 1);
h = 0.00001;

% Determine gradient using finite forward difference
for i = 1:N
   f0 = f(x0);
   x1 = x0;
   x1(i) = x1(i) + h;
   f1 = f(x1);
   grad(i) = (f1 - f0) / h;
end

end


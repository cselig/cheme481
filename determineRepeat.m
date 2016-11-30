function repeat = determineRepeat(xcurr, xprev, fprev, fcurr, errx, errf)
% Determine whether to continue interating the loop in Smin. 
% Tests convergence for f and every element of x
xconverge = true;
fconverge = abs(fprev - fcurr) < errf;
for i = 1:length(xcurr)
   if abs(xcurr(i) - xprev(i)) > errx
       xconverge = false;
   end
end
repeat = not(fconverge) || not(xconverge);
end

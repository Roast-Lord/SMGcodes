%Aproximate the function f = e^(x), for a given "x" and a number of interations "t";
function [k] = taylor_exp(x,t)
  format long;
  i=0;
  k=0;
  while i~=t
    k += (x^(i))/(factorial(i));
    i++;
    end
end

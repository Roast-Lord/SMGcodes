function [y] = fpoly(A,x)
    ordem = numel(A);
    y = 0;
    j = 1;
    for i = 0:ordem-1
        y += (x^(i))*A(j);
        j++;

end
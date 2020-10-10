%This code aplies the gauss method for a coeficient matrix "ms", and a solution vector "ms".
%The code transforms the matrix "ms" in to a upper triangular matrix and applies the regressivesub of values.
function [s] = Gauss(mc,ms)
    [nl,nc] = size(mc);
    for i = 1:nl
        for j = (i+1):nl
            m = mc(j,i)/mc(i,i);
            for k=1:nc
                mc(j,k) = mc(j,k) - mc(i,k)*m; 
            end
            ms(j) = ms(j) - ms(i)*m;
        end
    end
    s = regressivesub(mc,ms)
end

%This code aplies the gauss method for a coeficient matrix "ms", and a solution vector "ms".
%The code transforms the matrix "ms" in to a upper triangular matrix and applies the regressivesub of values.
function [s] = gauss(mc,ms)
    [nl,nc] = size(mc);
    s = zeros(nl,1);
    tol = 10^(-3);
    for i = 1:nl
        for j = (i+1):nl
            pivo = mc(i,i);
            if(pivo < tol)
                [mc,ms] = brah(mc,ms,i);
                pivo = mc(i,i);
            end
            pivot = mc(j,i)/pivo;
            for k=1:nc
                mc(j,k) = mc(j,k) - mc(i,k)*pivot; 
            end
            ms(j) = ms(j) - ms(i)*pivot;
        end
    end
    s = regressivesub(mc,ms);
end

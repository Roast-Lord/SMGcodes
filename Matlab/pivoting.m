%Make a permutations in a given coeficient matrix A and a solution vector B.
%The condition is that none of the values of the principal diagonal can be zero.
%This code ony works for matrciez where i = j.
function [A2,B2] = pivoting(A,B)
    [nl,nc] = size(A);
    tol = 10^(-4);
    for i = 1:nl
        if(A(i,i) < tol)
            for (j = 1:nl)
                if(i+1<nl)
                    aux(1,j) = A(i,j); 
                    A(i,j) = A(1,1);
                    A(1,1) = aux(1,j);
                    %---
                    aux2 = B(i);
                    B(i) = B(1);
                    B(1) = aux2;
                else
                    aux(1,j) = A(i,j); 
                    A(i,j) = A((i+1),j);
                    A((i+1),j) = aux(1,j);
                    %---
                    aux2 = B(i);
                    B(i) = B(i+1);
                    B(i+1) = aux2;
                end
            end
        end
    end
    A2 = A;
    B2 = B;
end
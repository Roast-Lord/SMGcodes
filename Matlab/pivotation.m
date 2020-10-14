%Make a permutation in a given coeficient and solution vector A,B
function [A2,B2] = pivotation(A,B)
    [nl,nc] = size(A);
    tol = 10^(-4);
    for i = 1:nl
        if(A(i,i) <= tol)
            for (j = 1:nc)
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
        A2 = A;
        B2 = B;
    end
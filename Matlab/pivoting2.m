%This code ony works for matricez where i = j.
function [A2,B2]= pivoting2(A,B,i)
    [nl,nc] = size(A);
    tol = 10^(-4);
    for (k = 0:(nl-1))
        if((k+i) <= nl)
            if (A(k+i) > tol)
                for(j = 1:nc)
                    aux(1,j) = A(i,j);
                    A(i,j) = A(k+i,j);
                    A(k+i,j) = aux(1,j);
                end
                for(y = 1:nc-1)
                    aux2 = B(y);
                    B(y) = B(y+1);
                    B(y+1) = aux2;
                end
            end
        else
            for (x = 1:(k-1))
                if(A(x,i) > tol)
                    for(j = 1:nc)
                        aux(1,j) = A(i,j);
                        A(i,j) = A(x+i,j);
                        A(x+i,j) = aux(1,j);
                    end
                    for(y = 1:nc-1)
                        aux2 = B(y);
                        B(y) = B(y+1);
                        B(y+1) = aux2;
                    end
                end
            end
        end
    end
    A2  = A;
    B2 = B;
end

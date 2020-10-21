function [A2,B2] = pivotinggeneral(A,B)
k = 0;
    if (det(A) == 0)
        disp('Matriz singular, possui infinitas solucoes')
    else
        d = 0;
        [nl, nc] = size(A);
        tol = 10^(-3);

        for (i = 1:nl)

            if (A(i, i) < tol)

                for (k = 1:nl)

                    if (k+i <= nl)

                        if (abs(A(k+i,i)) > tol)

                            for (j = 1:nc)
                                d = 1;
                                aux(1, j) = A(i, j);
                                A(i,j) = A(k+i, j);
                                A(k+i, j) = aux(1,j);
                            end

                            aux2 = B(i);
                            B(i) = B(i+1);
                            B(i+1) = aux2;
                        end

                    end

                end

            end

        end

        if (d == 0)

            for (x = 1:k-1)

                if (abs(A(x,i)) > tol)

                    for (j = 1:nc)
                        aux(1,j) = A(i,j);
                        A(i,j) = A(x,j);
                        A(x,j) = aux(1,j);
                    end

                    aux2 = B(i);
                    B(i) = B(x);
                    B(x) = aux2;
                end

            end

        end

    end
    A2 = A;
    B2 = B;
end

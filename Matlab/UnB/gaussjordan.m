function [A,B] = gaussjordan(a,b)
    %gaussjordan - Aplica o método de gauss jordan dado uma matriz dos coeficientes 'a' e uma matriz dos valores indenpendentes 'b'.
    %
    % Syntax: [A,B] = gaussjordan(a,b), onde a,b,A,B são vetores quadrados.
    %
    % Code not yet finished
    a = [
    3   4   2
    7   8   4
    2   1   8];
    b = [ 
    7
    8
    9];

    [nl,nc] = size(a);
    tol = 10^(-4);
    %[a,b] = pivotinggeneral(a,b);
    for(i = 1:nl)
        pivo = a(i,i);
        for (c = i:nc)
            a(i,c) = a(i,c)/pivo;
            b(c) = b(c)/pivo;
        end
        for(j = i+1:nl)
            pivot = a(j,i);
            for(k = 1:nc)
                a(j,k) = a(j,k) - a(i,k)*pivot; 
            end
            b(j) = b(j) - b(i)*pivot;
            if( i > 1)
                if( j == nl)
                    for(y = 1:i-1)
                        pivot = a(i-1,i);
                        for( k = 1:nc)
                            a(y,k) = a(y,k) - a(y,k)*pivot;
                        end
                        b(y) = b(y) - b(y)*pivot;
                    end
                end
            end
        end
    end
    A = a;
    B = b;
end
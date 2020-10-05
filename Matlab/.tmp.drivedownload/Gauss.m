function [x] = Gauss(A,b)
    [NL,NC] = size(A);
    x = zeros(NL,1);

    for DIG = 1:NL
        PIVO = A(L,DIG)/A(DIG,DIG);
        for C =1:NC
            if(C<DIG)
                A(L,C) = 0;
            else
                A(L,C) = A(L,C) - A(DIG,C)*PIVO;
            end
        end
        b(L)=b(L)-b(DIG)*PIVO;
    end
end
X = SubstituicAoRegressivA(A,b)
end
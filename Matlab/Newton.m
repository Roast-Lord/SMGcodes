function [xz] = Newton(F, dF, x0)
    %F = inline('8 - (4.5)*(x-sin(x))'); %function
    %dF = inline('- (4.5)*(1-cos(x))'); % derivative
    if (x0 == 0)
        x0 = 10^(-16);

    end

    F = inline(F);
    dF = inline(dF);
    imax = 200;
    tol = 10^(-6);

    for (i = 1:imax)
        a = feval(F, x0);
        b = feval(dF, x0);
        xi = x0 - a / b;
        fprintf('x_%i = %i -(%1.6f/%1.6f) = %1.6f \n', i, x0, a, b, xi);

        if (abs((xi - x0) / x0) < tol)
            xz = xi;
            break
        else
            x0 = xi;
        end

    end

end

%fprintf('solucao xz= %11.6f',xz);
%fprintf(', obtida em %i iteracoes\n',i);

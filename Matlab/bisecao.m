function [XNS] = bisecao(f, a, b)
    f = inline(f);

    if (feval(f, a) * feval(f, b) > 0)
        fprintf('Nao existe raizes no intervalo:[%i,%i]\n', a, b);
    else
        imax = 200;
        tol = 10^(-6);

        for (i = 1:imax)
            XNS = (a + b) / 2;
            f_xns = feval(f, XNS);
            tol_i = abs((b - a) / 2);
            fafxns = f_xns * f(a);
            fprintf('i = %i\n  a = %1.6f\n  b = %1.6f\n  XNS = %1.6f\n  f(a)*f(XNS) = %1.6f\n  f(XNS) = %1.6f\n',i,a,b,XNS,fafxns,f_xns);

            if (tol_i < tol)
                break
            end

            if (fafxns < 0)
                b = XNS;
            else
                a = XNS;
            end

        end

    end

end

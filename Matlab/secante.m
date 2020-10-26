function [x] = secante(F,a,b)
    F = inline(F);
    imax = 200;
    tol = 10^(-5);
    for i = 1:imax
        x = b - F(b)*(a-b)/(F(a)-F(b));
        fprintf('b_%i = %1.6f\na_%i = %1.6f\nf(a_%i) = %1.6f\nf(b_%i) = %1.6f\nx_%i = %1.6f\n\n',i,b,i,a,i,F(a),i,F(b),i,x);
        if(abs((x-b)/b) < tol)
            break
        end
        a = b;
        b = x;
    end
end
function [x] = secante(F,a,b)
    F = inline(F);
    imax = 200;
    tol = 10^(-5);
    for i = 1:imax
        x = b - F(b)*(a-b)/(F(a)-F(b));
        fprintf('x_%i = %1.6f\nx_%i = %1.6f\nf(x_%i) = %1.6f\nf(x_%i) = %1.6f\nx_%i = %1.6f\n\n',i+1,b,i,a,i,F(a),i+1,F(b),i+2,x);
        if(abs((x-b)/b) < tol)
            break
        end
        a = b;
        b = x;
    end
end
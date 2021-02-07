function [a1,a0] = interpolacao1(x,y)
    n = numel(x);

    Sx = sum(x(1,:))
    Sy = sum(y(1,:))

    Sxy = sum(x(1,:).*y(1,:))

    Sxx = sum(x(1,:).^2)

    a1 = (n*Sxy - Sx*Sy)/(n*Sxx - (Sx)^2)
    a0 = (Sxx*Sy - Sxy*Sx)/(n*Sxx - (Sx)^2)
    
    fprintf('y = %.4fx+(%.4f)\n',a1,a0);
    Erro = sum( ( y(1,:) - (a1.*x(1,:) + a0 ) ).^2 )




    

end
    
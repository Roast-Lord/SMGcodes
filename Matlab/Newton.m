clear all;
close all;
home;
F = inline('8.0 - (4.5)*(x-sin(x))');
dF = inline('-4.5*(1-cos(x))');

x0 = 2.5;
imax = 100;
tol = 1e-10;

errorelmax = 1e-16;

for i= 1:imax
    xi = x0-F(x0)/dF(x0);
    errorel = abs((xi-x0/x0));

    if errorel<errorelmax
        xz = xi;
        break;
    else
        xz=xi;
    end
end

fprintf('solução xz= %11.6f',xz);
fprintf(', obtida em %i iterações\n',i);
function sol = sol_EDO (dydx, x0, xf, dx, y0)
    dydx = "y*x-x.^3";
    x0 =0;
    xf =1;
    dx = 0.6;
    y0 = 1;
    dydx = inline(dydx);
    %calcula o numero de passos a serem executados
    N = round((xf - x0) / dx) + 1;
    %inicia a variável do passo inicial, x_i, y_i
    x_i = x0;
    y_i = y0;
    %Armazena no vetor solução o resultado
    sol(1, 1) = x_i;
    sol(2, 1) = y_i;
    %Coeficiente de Runge-Kutta 4 ordem classico
    c1 = 1/6; % = c4
    c2 = 2/6; % = c3
    a2 = 1/2; % = a3 = b21 = b32 
    a4 = 1; % = b43
    b31 = 0; % = b41 = b42 
    %Inicia o loop de cálculo
    for i = 1:N
        x_ip1 = x_i + dx;
        k1 = feval(dydx, x_i, y_i);
        k2 = feval(dydx, x_i + a2 * dx, y_i + a2 * k1 * dx);
        k3 = feval(dydx, x_i + a2 * dx, y_i + b31 * k1 * dx + a2 * k2 * dx);
        k4 = feval(dydx, x_i + a4 * dx, y_i + b31 * k1 * dx + b31 * k2 * dx + a4 * k3 * dx);
        y_ip1 = y_i + (c1 * k1 + c2 * k2 + c2 * k3 + c1 * k4) * dx;
        %Armazena no vetor solução o resultado
        sol(1, i + 1) = x_ip1;
        sol(2, i + 1) = y_ip1;
        x_i = x_ip1;
        y_i = y_ip1;
    end

end

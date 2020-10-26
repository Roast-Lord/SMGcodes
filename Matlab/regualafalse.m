
%definir a função a ser zerada

F = inline('x^2 - exp(-x)');
%intervalo
a = 0;
b = 1;
%Num maximo de interaçoes
imax = 100;
%tolerancia na busca
tol = 1e-6;
%calcula o valor da função no intervalo
Fa = F(a);
Fb = F(b);
 %teste no intervalo

 if F(a)*F(b)>0
    disp('iter    a    b    (xNS)    F(xNS)        Tol')
 else
    disp('inter a b xNS F(xNs) tol')
    for i= i:imax
        xNS = (a+b)/2;
        tol_1 = (b-a)/2;
        F_xNS = F(xNS);
        
        fprintf('%3i    %11.6f %11.6f %11.6f %11.6f %11.6f\n', i, a, b, xNS, F_xNS,tol_1)
    
    if tol_1 <tol
        break
    end


    if Fa*F_xNS<0
    b = xNS;
    Fb = F(b);
    else
        a = xNS;
        Fa = F(a);
    end
    end 
end
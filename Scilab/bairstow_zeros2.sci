    function rts=bairstow_zeros2(ps,tol)
      function [u,v,b]=fatorar(a,n)
          erro=1
          u=0.1; // encontar fator=s^2+u*s+v
          v=0.1;
          b(1)=1.0;
          c(1)=1.0;
          while (erro > tol)
                b(2)=a(2)-u;
                c(2)=b(2)-u;
                for k=3:n
                    b(k)=a(k)-b(k-1)*u-b(k-2)*v;
                    c(k)=b(k)-c(k-1)*u-c(k-2)*v;
                end;
                //calcule as derivadas parciais em relação a u e v
                A= [ [c(n-1),c(n-2)] ; [c(n-2),c(n-3)] ]
                b1   = [ b(n) ; b(n-1)]
                dx=inv(A)*b1
                u = u + dx(1)
                v = v + dx(2)
                erro = norm(dx)
          end;
      endfunction    
    a=flipdim(coeff(ps),2)
    a=a/a(1); // forçar maior expoente com multiplicador 1
    n=length(a)
    tol = 1e-12;
    while n>3  // repita enquanto ordem do polinômio for maior que 2   
         [u,v,b]=fatorar(a,n)
          pol_out = poly([v,u,1],'s','coeff')
          [rts(n-1),rts(n-2)]=baskara(pol_out);  
          disp(rts(n-2:n-1))
          n=n-2;   // diminua em 2 a ordem do polinômio
          a=b;    
    end;
    //solução da última equação 
    if(n==3)   
        last_pol = poly([a(3),a(2),a(1)],'s','coeff')
        [rts(n-1),rts(n-2)]=baskara(last_pol);  // quadrática
        disp(rts(n-2:n-1))
    else  
         rts(n-1)=-a(2)
         disp(rts(n-1))
    end;
    [g,k]=gsort(real(rts),'g','i')
    rts = rts(k)
endfunction

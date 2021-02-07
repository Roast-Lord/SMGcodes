function y=applyIIR (Hz,x,xp,yp)
    //Hz funçao de transferência em z
    // x sinal de entrada
    // entradas passadas xp [x(-nzeros)... x(-2) x(-1)]
    // saidas passadas   yp [y(-npolos)... y(-2) y(-1)]
    // y2 sinal filtrado
    q=poly(0,'q');
    Hq=horner(Hz,1/q);
    a=coeff(Hq(3))
    num=Hq(2)/a(1);
    den=Hq(3)/a(1);
    Hq=num/den;
    b=coeff(Hq(2))
    a=coeff(Hq(3))    
    
    npolos=length(a)-1
    nzeros=length(b)-1
    N=length(x);
    y(1:N)=0;
    for n=1:N  
      for p=1:npolos
         index=n-p;
         if index<=0 then
             y(n)=y(n)-a(p+1)*yp(npolos+index);
         else
             y(n)=y(n)-a(p+1)*y(index);
         end
      end
      for p=0:nzeros
         index=n-p;
         if index<=0 then
             y(n)=y(n)+b(p+1)*xp(nzeros+index);
         else
             y(n)=y(n)+b(p+1)*x(index);
         end
      end
    end
endfunction

function y2=applyIIR2 (Hz,x,xp,yp)
    
    //Hz funçao de transferência em z
    // x sinal de entrada
    // entradas passadas xp [x(-nzeros)... x(-2) x(-1)]
    // saidas passadas   yp [y(-npolos)... y(-2) y(-1)]
    // y2 sinal filtrado
    
    q=poly(0,'q');
    simp_mode(%f)
    Hq=horner(Hz,1/q);
    simp_mode(%t)
    b=coeff(Hq(2))
    a=coeff(Hq(3))
    npolos=length(a)-1
    nzeros=length(b)-1
    N=length(x);
  
    for n=1:N
      y2(n)=0;  
      for p=1:npolos
         index=n-p;
         if index<=0 then
             y2(n)=y2(n)-a(p+1)*yp(npolos+index);
         else
             y2(n)=y2(n)-a(p+1)*y2(index);
         end
         
      end
      for p=0:nzeros
         index=n-p;
         if index<=0 then
             y2(n)=y2(n)+b(p+1)*xp(nzeros+index);
         else
             y2(n)=y2(n)+b(p+1)*x(n-p);
         end
         
      end
    end
 
endfunction

function y2=applyIIR3 (Hq,x,xp,yp)
    //Hq funçao de transferência em q
    // x sinal de entrada
    // entradas passadas xp [x(-nzeros)... x(-2) x(-1)]
    // saidas passadas   yp [y(-npolos)... y(-2) y(-1)]
    // y2 sinal filtrado
    q=poly(0,'q');
    b=coeff(Hq(2))
    a=coeff(Hq(3))
    npolos=length(a)-1
    nzeros=length(b)-1
    N=length(x);
    for n=1:N
      y2(n)=0;  
      for p=1:npolos
         index=n-p;
         if index<=0 then
             y2(n)=y2(n)-a(p+1)*yp(npolos+index);
         else
             y2(n)=y2(n)-a(p+1)*y2(index);
         end
      end
      for p=0:nzeros
         index=n-p;
         if index<=0 then
             y2(n)=y2(n)+b(p+1)*xp(nzeros+index);
         else
             y2(n)=y2(n)+b(p+1)*x(n-p);
         end
         
      end
    end
endfunction

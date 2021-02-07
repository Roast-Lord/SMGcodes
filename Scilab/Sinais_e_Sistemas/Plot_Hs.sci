function Plot_Hs(Hs,cor)
    
 N=10000
 b=coeff(Hs(2))
 a=coeff(Hs(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 logw = linspace(-6,6,N)

 s=%i*(10.^logw)

 num=zeros(1:N);
 den=zeros(1:N)+0.0001;;  
 for p=0:npolos
     den=den+a(p+1)*s.^p;
 end
 for p=0:nzeros
     num=num+b(p+1)*s.^p;
 end
 H=num./den
 
 plot(logw',20*log10(abs(H)+0.0001),cor);
endfunction

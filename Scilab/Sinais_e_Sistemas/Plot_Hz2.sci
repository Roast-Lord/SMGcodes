function Plot_Hs2(Hs,k)
 N=2048
 b=coeff(Hs(2))
 a=coeff(Hs(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 logw = linspace(-2,3,N)

 s=%i*(10.^logw)

 num=zeros(1:N);
 den=zeros(1:N);  
    for p=0:npolos
        den=den+a(p+1)*s.^p;
    end
    for p=0:nzeros
        num=num+b(p+1)*s.^p;
    end
H=num./den
 //plot(log10(f'+0.0001),log10(abs(H)+0.0001),'bk');
 cor =['bk', 'r', 'b', 'g', 'y']
 plot(logw',20*log10(abs(H)+0.0001),cor(k));
endfunction


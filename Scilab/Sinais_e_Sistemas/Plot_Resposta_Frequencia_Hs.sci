function Plot_Hs(Hs,k)
 N=2048
 b=coeff(Hs(2))
 a=coeff(Hs(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 fs = 1000 * mean(abs(roots(Hs(3))));
// f=linspace(0,2*fs,N);
 logw = linspace(-2,3,2048)
// w=2*%pi*f
  
// s=%i*w;
 s=%i*(10.^logw)
 for n=1:N
    num=0;
    den=0;
    for p=0:npolos
        den=den+a(p+1)*s(n)^p;
    end
    for p=0:nzeros
        num=num+b(p+1)*s(n)^p;
    end
    if(den<>0) H(n)= num/den;
    else H(n)=0
    end
 end
 
 //plot(log10(f'+0.0001),log10(abs(H)+0.0001),'bk');
 cor =['bk', 'r', 'b', 'g', 'y']
 plot(logw,20*log10(abs(H)+0.0001),cor(k));
endfunction

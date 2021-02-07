function [H,f]=calc_Hs(Hs,fs,N)
 //[H,f]=frmag(Hz,N)
 a=coeff(Hs(2))
 b=coeff(Hs(3))
 npolos=length(b)-1
 nzeros=length(a)-1
 f=linspace(0,fs/2,N);
 s=2*%i*%pi*f;
 for n=1:N
    num=0;
    den=0;
    for p=0:npolos
        den=den+b(p+1)*s(n)^p;
    end
    for p=0:nzeros
        num=num+a(p+1)*s(n)^p;
    end
    H(n)= num/den;
 end
endfunction

function [H,f]=Resposta_Frequencia_Hq(Hq,N)
 //[H,f]=frmag(Hz,N)
 b=coeff(Hq(2))
 a=coeff(Hq(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 f=linspace(0,0.5,N);
 q=exp(-2*%i*%pi*f);
 for n=1:N
    num=0;
    den=0;  
    for p=0:npolos
        den=den+a(p+1)*q(n)^p;
    end
    for p=0:nzeros
        num=num+b(p+1)*q(n)^p;
    end
    H(n)= num/den;
 end
endfunction

function [H,f]=Resposta_Frequencia_Hq2(Hq,N)
 //[H,f]=frmag(Hz,N)
 b=coeff(Hq(2))
 a=coeff(Hq(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 f=linspace(0,1.0,N);
 q=exp(-2*%i*%pi*f);
 for n=1:N
    num=0;
    den=0;  
    for p=0:npolos
        den=den+a(p+1)*q(n)^p;
    end
    for p=0:nzeros
        num=num+b(p+1)*q(n)^p;
    end
    H(n)= num/den;
 end
endfunction

function Resposta_Frequencia_Hq3(Hq,dB)
 w=linspace(-%pi,3*%pi,1024);
 qw=exp(-%i*w);
 H=horner(Hq,qw)
 // Plotar resultado
 subplot(211)
 if (dB) then
  plot(w,20*log10(abs(H)))
   title("|H(jw)|dB")
 else
    plot(w,abs(H))
   title("|H(jw)|")
 end
 subplot(212)
  plot(w,phasemag(H,'c'));
 title("Fase em Graus")
endfunction

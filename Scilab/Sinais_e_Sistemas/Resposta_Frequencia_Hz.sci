function [H,f]=Resposta_Frequencia_Hz(Hz,fs,N)
 b=coeff(Hz(2))
 a=coeff(Hz(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 f=linspace(0,2,N);
 w=2*%pi*f;
 
 z=exp(%i*w);
 num=zeros(1:N);
 den=zeros(1:N)+0.0001;;  
 for p=0:npolos
     den=den+a(p+1)*z.^p;
 end
 for p=0:nzeros
     num=num+b(p+1)*z.^p;
 end
 H= num./den;
 f=f*fs;
endfunction

function [H,f]=Resposta_Frequencia_Hz2(Hz,N)
 //[H,f]=frmag(Hz,N)
 b=coeff(Hz(2))
 a=coeff(Hz(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 f=linspace(0,1.0,N);
 z=exp(2*%i*%pi*f);
 
 num=zeros(1:N);
 den=zeros(1:N)+0.0001;;  
 for p=0:npolos
     den=den+a(p+1)*z.^p;
 end
 for p=0:nzeros
     num=num+b(p+1)*z.^p;
 end
 H=num./den
 
endfunction

function Resposta_Frequencia_Hz3(Hz,dB)
 //w=linspace(0,2*%pi,1024);
 w=linspace(-%pi,3*%pi,1024);
 H=horner(Hz,exp(%i*w))
 // Plotar Resultado
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


function Resposta_Frequencia_Hz4(Hz,fs,dB)
 //w=linspace(0,2*%pi,1024);
 f=linspace(-0.5,1.5,1024);
 w=2*%pi*f
 H=horner(Hz,exp(%i*w))
 // Plotar Resultado
 subplot(211)
 if (dB) then
   plot(2*%pi*f*fs,20*log10(abs(H)))
   title("|H(jw)|dB")
 else
   plot(2*%pi*f*fs,abs(H))
   title("|H(jw)|")
 end
 subplot(212)
 plot(2*%pi*f*fs,phasemag(H,'c'));
 title("Fase em Graus")
endfunction


function [H,f]=Resposta_Frequencia_Hs(Hs,fs,N)
 b=coeff(Hs(2))
 a=coeff(Hs(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 f=linspace(0,2*fs,N);
 w=2*%pi*f;
  
 s=%i*w;
 num=zeros(1:N);
 den=zeros(1:N)+0.0001;;  
 for p=0:npolos
     den=den+a(p+1)*s.^p;
 end
 for p=0:nzeros
     num=num+b(p+1)*s.^p;
 end
 H= num./den;
 
 
//f=linspace(0,2*fs,N);
//w=2*%pi*f;
//H=horner(Hs,%i*w) 
 
endfunction


function Hs=Resposta_Frequencia_Hs2(Hs,cor)

    function plot_polos(wc,Hs,cor)
       N=1024;    
       angle = linspace(0, 2*%pi, N);
       // raízes do denominador normalizadas por wc
       poles=roots(Hs(3))/wc
       // raízes do numerador normalizadas por wc
       zers=roots(Hs(2))/wc
       lim=1.2*max(abs(poles))
       plot2d(cos(angle),sin(angle)); //círculo unitário
       plot2d(real(poles),imag(poles),-2)
       plot2d(real(zers),imag(zers),-9)
       xsegs([-lim,0;lim,0],[0,-lim;0,lim]) //eixos
       xtitle('Posição dos polos e zeros no Círculo Unitário');
       a=gca();
       a.data_bounds=[-lim,-lim,0;lim,lim,0];
    endfunction

     b=coeff(Hs(2))
     a=coeff(Hs(3))
     npolos=length(a)-1
     nzeros=length(b)-1
     N=1000
     w=linspace(0,4,N);
     s=%i*w;
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
     subplot(221)
     plot(w,abs(H),cor)
     subplot(222)
     plot(log10(w+0.0001),20*log10(abs(H)+0.0001),cor)
     subplot(223)
     plot_polos(1,Hs,cor)
     subplot(224)
     title("raizes" + "    "+ string( roots(Hs(3))))
endfunction


function Resposta_Frequencia_Hs3(Hs,f1,f2,dB)
 logf=linspace(f1,f2,1024);
 w=2*%pi*10.^logf;
 H=horner(Hs,%i*w)
 //Plotar Resultado
 subplot(211)
 if (dB) then
     plot(logf,20*log10(abs(H)))
    title("|H(jw)|dB")
    subplot(212)
    plot(logf,phasemag(H,'c'));
    title("Fase em Graus")
 else
    plot(w,(abs(H)))
    title("|H(jw)|")
    subplot(212)
    plot(w,phasemag(H,'m'));
    title("Fase em Graus")
 end
endfunction

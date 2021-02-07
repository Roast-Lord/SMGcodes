function Hq=Trans_bilinear(f0,Q,fs)
    N=1024;
    Ts=1/fs;
    s=poly(0,'s');
    z=poly(0,'z');
    q=poly(0,'q');
    
    f0d=f0/fs;
    w0d=2*%pi*f0d;
    wa=2/Ts*tan(w0d/2)
    fa=wa/(2*%pi);
    
    a  = wa/(2*Q);
    b  = sqrt(wa^2-a^2);
   
    Hs=wa^2/(s^2+(2*a)*s+wa^2);
    [Hw fw]=Resposta_Frequencia_Hs(Hs,3*fa,1024);
   
    //Projeto com Transformação Bilinear de Hs
    z=poly(0,'z');
    Hz=horner(Hs,2/Ts*((z-1)/(z+1)));
    //Resposta em Frequencia do polinomio em z
    [Hf2,f2]=Resposta_Frequencia_Hz(Hz,N);
    plot(fw,abs(Hw),'bk');
    plot(fs*f2,abs(Hf2),'r');
    
    legend("Filtro Analógico","Filtro Digital fs="+string(fs));
   //Fatorar o polinômio em Z na forma q=z^-1
   q=poly(0,'q');
   Hq=horner(Hz,1/q);
   num=Hq(2);
   den=Hq(3);
   c=coeff(Hq(3));
   num=num/c(1);
   den=den/c(1);
   Hq=num/den;

endfunction


function [Hq, Hq2]=Trans_bilinear2(fs)

    N=4096;
    a=gca()
   // ws=10;
  //  fs=ws/(2*%pi);
    Ts=1/fs
    ws=2*%pi*fs
    
    s=poly(0,'s');
    z=poly(0,'z');
    q=poly(0,'q');
    
    Hs=(s+0.1)/(s^2+0.2*s+9.01)
    w0=sqrt(9.01)
    f0=w0/(2*%pi)
    w0d=2*%pi*(f0/fs);
    wa=2/Ts*tan(w0d/2)
    fa=wa/(2*%pi)
    Hs2=horner(Hs,s*w0/wa);

    [Hw fw]=Resposta_Frequencia_Hs(Hs,2*fs,N);
    plot(fw',20*log(abs(Hw)+1e-10),'bk');
    
    [Hw fw]=Resposta_Frequencia_Hs(Hs2,2*fs,N);
     plot(fw',20*log(abs(Hw)+1e-10),'b');
   
    //Projeto com Transformação Bilinear de Hs
    z=poly(0,'z');
    Hz=horner(Hs2,2/Ts*((z-1)/(z+1)));
    Hq=horner(Hz,1/q);
    num=Hq(2);
    den=Hq(3);
    c=coeff(Hq(3));
    num=num/c(1);
    den=den/c(1);
    Hq=num/den;
    //Resposta em Frequencia do polinomio em z
    
    [Hf2,f2]=Resposta_Frequencia_Hz(Hz,fs,N);
    plot(f2',20*log(abs(Hf2)+1e-10),'r');
    
    
    Hq2=(1-(exp(0.1*Ts)*cos(3*Ts))*q) / (1-(2*exp(0.1*Ts)*cos(3*Ts))*q+exp(0.2*Ts)*q^2) ;;
    Hz=horner(Hq2,1/z);
    [Hi2,fi2]=Resposta_Frequencia_Hz(Hz,fs,N);
    plot(fi2',20*log(abs(Ts*Hi2)+1e-10),'g');
    
    
    a.data_bounds=[0,-150,0;2*fs,40,0];
    legend("Filtro Analógico Original","Filtro Analógico warped", "Filtro Digital", "Inv Resp Impulso",string(fs));
   //Fatorar o polinômio em Z na forma q=z^-1


endfunction


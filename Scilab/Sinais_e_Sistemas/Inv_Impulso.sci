function Hq=Inv_Impulso(fs)
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

    [Hw fw]=Resposta_Frequencia_Hs(Hs,fs,1024);
    plot(fw',20*log(abs(Hw)+1e-10),'bk');
    
    
    Hq=(1-(exp(0.1*Ts)*cos(3*Ts))*q) / (1-(2*exp(0.1*Ts)*cos(3*Ts))*q+exp(0.2*Ts)*q^2) ;
    Hz=horner(Hq,1/z);
    [Hi2,fi2]=Resposta_Frequencia_Hz(Hz,fs,N);
    plot(fi2',20*log(abs(Ts*Hi2)+1e-10),'r');
    
    
    a.data_bounds=[0,-150,0;fs,40,0];
    legend("Filtro Analógico ", "Inv Resp Impulso  fs ="+string(fs));
   //Fatorar o polinômio em Z na forma q=z^-1

endfunction

function Hs=Inv_Impulso2 (f0,Q,fs)

    N=1024;
    T=1/fs;
    s=poly(0,'s');
    z=poly(0,'z');
    q=poly(0,'q');
  
  //  w0 = sqrt(17410.145)
  //  Q=w0/137.94536;
    w0 =2*%pi*f0;
    a  = w0/(2*Q);
    b  = sqrt(w0^2-a^2);
   
    Hs=w0^2/(s^2+(2*a)*s+w0^2);
    [Hw fw]=Resposta_Frequencia_Hs(Hs,3*f0,1024);   

    num=(w0^2/b)*exp(-a*T)*sin(b*T)*q
    den=1-(2*exp(-a*T)*cos(b*T))*q+exp(-(2*a)*T)*q^2;
    Hq=num/den;
    Hz=horner(Hq,1/z);
    [Hi,fi]=Resposta_Frequencia_Hz(Hz,N);
    
    
    plot(log10(fw'+0.0001),log10(abs(Hw)+0.0001),'bk');
  //  plot(fi'/T,abs(T*Hi),'r');
    
    legend("Filtro Analógico","Filtro Digital fs="+string(fs));

endfunction

function Inv_Impulso3()
    N=1024;
    s=poly(0,'s');
    z=poly(0,'z');
    q=poly(0,'q');
    Hs=(s+0.1)/((s+0.1)^2+9.01);
    [Hw fw]=Resposta_Frequencia_Hs(Hs,10,128);
    
    T1=0.1
    fs1=1/T1;
    num=1-(exp(0.1*T1)*cos(3*T1))*q;
    den=1-(2*exp(0.1*T1)*cos(3*T1))*q+exp(0.2*T1)*q^2;
    Hq=num/den;
    Hz=horner(Hq,1/z);
    [Hi1,fi1]=Resposta_Frequencia_Hz(Hz,fs1,N);
    
    T2=0.001
    fs2=1/T2;
    num=1-(exp(0.1*T2)*cos(3*T2))*q;
    den=1-(2*exp(0.1*T2)*cos(3*T2))*q+exp(0.2*T2)*q^2;
    Hq=num/den;
    Hz=horner(Hq,1/z);
    [Hi2,fi2]=Resposta_Frequencia_Hz(Hz,fs2,N);
    
    plot(fw',20*log(abs(Hw)),'bk');
    plot((fi1)',20*log(abs(T1*Hi1)+1e-10),'b');
    plot((fi2)',20*log(abs(T2*Hi2)+1e-10),'r');
    
    legend("Filtro Analógico","Filtro Digital T=0.1 (fc=10)","Filtro Digital T=0.5 (fc=2)");

endfunction


function Hz=IRI_exemplo1(T)
    a=1.4394879;
    wd=sqrt(98.628345);

        B=-1.43018;
    C=-28.3588;
    n1=B*z*(z-exp(-a*T)*cos(wd*T))+((C-a*B)/wd)*z*exp(-a*T)*sin(wd*T);
    d1=z^2-2*z*exp(-a*T)*cos(wd*T)+exp(-2*a*T);
    
    a=3.5605121;
    wd=sqrt(16.121032);
    B=1.43018;
    C=34.4257;
    n2=B*z*(z-exp(-a*T)*cos(wd*T))+((C-a*B)/wd)*z*exp(-a*T)*sin(wd*T);
    d2=z^2-2*z*exp(-a*T)*cos(wd*T)+exp(-2*a*T);
    
    z=poly(0,'z');
    q=poly(0,'q');
    Hz=n1/d1+n2/d2;
endfunction

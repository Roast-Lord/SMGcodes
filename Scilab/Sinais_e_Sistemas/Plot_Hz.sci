function  Plot_Hz(Hz,T,cor)
 N=2048
 b=coeff(Hz(2))
 a=coeff(Hz(3))
 npolos=length(a)-1
 nzeros=length(b)-1
 w=linspace(0,2*%pi,N);
 
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
 
 fs=1/T;
 wf=log10(w*fs+0.0001);
 //f=f*fs;
 plot(wf',20*log10(abs(H)+0.0001),cor);
 
endfunction

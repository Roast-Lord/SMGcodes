function [Hz, Hq]=Single_Pole_IIR(tipo, fc)
  //clf;
  N=1024;
  qc=exp(-2*%pi*fc);
  if tipo==0  then  // Passa Baixas
     b0 = 1-qc;
     b1 = 0;
     a1 = -qc;
  else           // Passa Altas
     b0= (1+qc)/2;
     b1=-(1+qc)/2
     a1= -qc;
  end;

  f=linspace(0,0.5,N);
  z_w=exp(-2*%i*%pi*f); // q=z^-1
  for n=1:N
     H(n)= (b0+b1*z_w(n))/(1+a1*z_w(n));
  end

  plot(f,abs(H),'r')
  a=gca()
  a.data_bounds=[0,0,0;0.5,1,0]

  den=poly([1,   a1],'q','c')
  num=poly([b0,  b1],'q','c')       
  Hq=num./den;
 
  z=poly(0,'z');
  Hz=horner(Hq,1/z);
  a=coeff(Hz(3));
  num=Hz(2)/a(1);
  den=Hz(3)/a(1);
  Hz=num/den;
  [Hf2,f2]=Resposta_Frequencia_Hz(Hz,N);
  plot(f2,abs(Hf2),'b');
   
endfunction

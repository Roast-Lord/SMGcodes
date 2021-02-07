function Two_Pole_IIR(tipo, fc, BW)
  //clf;
  x=cos(2*%pi*fc);
  R=1-3*BW;
  K=(1-2*R*x+R^2)/(2-2*x);

  //polinômio em q (atrasos) 
  if tipo==0  then  // Passa Banda
    b0 = 1-K;
    b1 = 2*(K-R)*x;
    b2= R^2-K;
    a1 = -2*R*x;
    a2 = R^2
    den=poly([ 1, a1, a2],'q','c')
    num=poly([b0, b1, b2],'q','c')
  else         // Rejeita
    b0 = K;
    b1 = -2*K*x;
    b2=  K;
    a1 = -2*R*x;
    a2 = R^2
    den=poly([1,  a1, a2],'q','c')
    num=poly([b0, b1, b2],'q','c')
  end;
    
  Hq=num./den;
  
   //Fatorar o polinômio em Z na forma q=z^-1
  z=poly(0,'z');
  Hz=horner(Hq,1/z);
  a=coeff(Hz(3));
  num=Hz(2)/a(1);
  den=Hz(3)/a(1);
  Hz=num/den;
  
  N=1024;
  [Hf3,f3]=Resposta_Frequencia_Hz(Hz,N);
  plot(f3,abs(Hf3),'r'); 

endfunction

function Hq=IIR_FGA(ordem, fc)

 N=1024;
 // IIR RETORNA POLINÔMIO EM Z
 Hz=iir(ordem,'lp','butt',[fc 0],[0 0]);
 q=poly(0,'q');
 Hq=horner(Hz,1/q)
 
 [H,f]=calc_Hw(Hz,N)
 subplot(221)
 plot(f,abs(H),'g')
 
 [phi, db_A] = phasemag(H+1e-20,'m');
 subplot(223);
 plot(f,db_A);
 a=gca()
 a.data_bounds=[0,-100,0;0.5,5,0];

 subplot(224);
 plot(f,phi);

endfunction

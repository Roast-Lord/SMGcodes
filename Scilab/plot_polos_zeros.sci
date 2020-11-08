function plot_polos_zeros(wc,Hs)
   N=1024;    
   angle = linspace(0, 2*%pi, N);
   // raízes do denominador normalizadas por wc
   poles=roots(Hs(3))/wc
   // raízes do numerador normalizadas por wc
   zers=roots(Hs(2))/wc
   lim=1.0+max(abs(poles));
   plot2d(cos(angle),sin(angle)); //círculo unitário
   xtitle('Posição dos polos e zeros');
   r=int(max(abs(poles)));
   plot2d(r*cos(angle),r*sin(angle)); //círculo raio r
   plot2d(real(poles),imag(poles),-2)
   plot2d(real(zers),imag(zers),-9)
   xsegs([-lim,0;lim,0],[0,-lim;0,lim]) //eixos
   a=gca();
   a.data_bounds=[-lim,-lim,0;lim,lim,0];
endfunction


function [poles,zers] = plot_polos_zeros2(Hs)
   N=2024;    
   angle = linspace(0, 2*%pi, N);
   // raízes do denominador normalizadas por wc
   poles=roots(Hs(3))
   // raízes do numerador normalizadas por wc
   zers=roots(Hs(2))
   plot2d(cos(angle),sin(angle)); //círculo unitário
   xtitle('Posição dos polos e zeros');
   plot2d(real(poles),imag(poles),-20)
   plot2d(real(zers),imag(zers),-15)
   xgrid()
endfunction

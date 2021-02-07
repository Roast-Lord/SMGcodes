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


function plot_polos_zeros2(Hs)
   N=1024;    
   angle = linspace(0, 2*%pi, N);
   // raízes do denominador normalizadas por wc
   poles=roots(Hs(3))
   // raízes do numerador normalizadas por wc
   zers=roots(Hs(2))
   plot2d(cos(angle),sin(angle)); //círculo unitário
   xtitle('Posição dos polos e zeros');
   plot2d(real(poles),imag(poles),-2)
   plot2d(real(zers),imag(zers),-9)
   xgrid()
endfunction

function convolucao_discreta(x,xi,h,hi)
    nx = length(x)
    nh = length(h)
    i_ini = xi - nh +1
    i_fin = xi + nx + nh - 2
    ncols = i_fin-i_ini+1
    nlins = nx + nh -1;
    
    indice=[i_ini:i_fin];
    x_ext=zeros(1:ncols)
    for coluna=1:nx
        x_ext(coluna+nh-1)=x(coluna)
    end
    h_r = flipdim(h, 2)
    h_des=zeros(nlins,ncols)
    for linha=1:nlins
        for i = 1:nh
            h_des(linha,i+linha-1)=h_r(i)
        end
       y(linha)=sum(x_ext.*h_des(linha,:))
    end
    for linha=1:nlins
       h_des(linha,ncols+1)=y(linha)
       h_des(linha,ncols+2)=xi+linha-1
    end
    disp(indice)
    disp(x_ext)
    disp(h_des)
endfunction

function recorrencia1(x)
    nx = 2 + length(x) + 3 - 1;
    xi=-2
    index=[xi:xi+nx-1]
    x=[0,0,x,0,0]
    for (i=3:length(x))
            y(i)=3*x(i)+2*x(i-1)+x(i-2)
    end
    disp([index' y])
    bar(index,y)
endfunction



function recorrencia2(x)
    xi=-2
    x=[0,0,x,zeros(1:20)]
    index=[1:length(x)]
    index = index + xi -1 
    y(1)=0
    y(2)=0
    for (i=3:length(x))
            y(i)=5*x(i)+10*x(i-2)-3/4*y(i-1)
    end
    disp([index' y])
    bar(index,y)
endfunction

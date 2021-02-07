function X = fft_2(x)
    N = length(x);
    if N == 1
        X = x;
    else
        N2 = N/2;
        X_par = fft_2(x(1:2:N-1));
        X_impar = fft_2(x(2:2:N));
        W = exp(-2 * %pi * %i / N) .^ (0:N2-1);
        X_impar = W .* X_impar;
        X = [ X_par + X_impar , X_par - X_impar ];
    end
endfunction

function x = ifft_2(X)
    N = length(X);
    x=1/N*fft_2(conj(X));
endfunction

function X = fft_3(x)
    N = length(x);
    if N == 4
        X(1,1)=(x(1)+x(3))+   (x(2)+x(4))
        X(1,2)=(x(1)-x(3))-%i*(x(2)-x(4))
        X(1,3)=(x(1)+x(3))-   (x(2)+x(4))
        X(1,4)=(x(1)-x(3))+%i*(x(2)-x(4))
    else
        N2 = N/2;
        X_par   = fft_3(x(1:2:N-1));
        X_impar = fft_3(x(2:2:N));
        W = exp(-2 * %pi * %i / N) .^ (0:N2-1);
        X_impar = W.* X_impar;
        X = [ X_par + X_impar , X_par - X_impar ];
    end
endfunction

function F = fft_4(f)
    F=f
    N = length(f);   
    n_estagios = log2(N)  
    n_blocos=1;   
    n_pontos_por_bloco=N;	
    W = exp(-%i*2*%pi/N)^(0:N-1)
    for P=0:(n_estagios-1)
      n_butterflies=n_pontos_por_bloco/2;
      indice_par=0;   
      for b=0:(n_blocos-1)
        indice_impar=indice_par+n_butterflies; 
        for n=0:(n_butterflies-1)
          par   = f(indice_par+n+1)+f(indice_impar+n+1);
          impar = (f(indice_par+n+1)-f(indice_impar+n+1))* W(n);
          f(indice_par+n+1)=par;
          f(indice_impar+n+1)=impar;
       
        end
        indice_par=indice_par+n_pontos_por_bloco; 
       end
      n_blocos = n_blocos * 2; 
      n_pontos_por_bloco=n_pontos_por_bloco/2; 
    end;
endfunction

function X = fft_5(x)
    N = length(x);
    WN =  exp(-2*%pi/N)
    W = WN^(0:N-1)
endfunction

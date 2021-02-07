function  y=CircConv(x,h)
  Nx = length(x);
  Nh = length(h);
  N  = max(Nx,Nh);
  x  = [x,zeros(1,N-Nx)];
  h  = [h,zeros(1,N-Nh)];
  y  = zeros(1,N);
  for i =0:N-1
     for j = 0:N-1
        k = pmodulo((i-j),N);
        y(i+1) = y(i+1) + x(j+1)*h(k+1);
     end
  end
endfunction;

function  y=CircConv2(x,h)
    Nx = length(x);
    Nh = length(h);
    N  = max(Nx,Nh);
    x  = [x,zeros(1,N-Nx)];
    h  = [h,zeros(1,N-Nh)];
    y=ifft(fft(x).*fft(h))
endfunction;

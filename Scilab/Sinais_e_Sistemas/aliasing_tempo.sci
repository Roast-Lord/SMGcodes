function aliasing_tempo(f1,f2)
    clf;
    T=2.5
    t=[0:0.001:T];
    fs=64;
    N=T*fs;
    n=[0:N-1];
    ts=n*(1/fs);
    m=[-N/2:N/2-1];
    ms=m*fs/N;
    x=sin(2*%pi*f1*t)+0.5*sin(2*%pi*f2*t+3*%pi/4);
    xn=sin(2*%pi*f1*ts)+0.5*sin(2*%pi*f2*ts+3*%pi/4);
    Xn=fft(xn);
    subplot(121)
    plot(t,x)
    plot2d3(ts,xn);
    s=sprintf("x(n)  f1=%.1f kHz  f2=%.1f kHz",f1,f2)
    title(s)
    xlabel("t ms")
    subplot(122)
    plot2d3(ms,fftshift(abs(Xn)));
    title("|X(m)|")
    xlabel("f kHz")
endfunction


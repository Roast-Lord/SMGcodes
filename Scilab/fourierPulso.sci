function F=fourierPulso(a,T)
    clf();
    N = 1024;
    f=[zeros(0:(2*T-a/2)*N/4/T)  ones(1:a*N/4/T) zeros(0:(2*T-a/2)*N/4/T)];
    t=linspace(-2*T,2*T,length(f))
    subplot(2,1,1)
    plot(t-T,f);
    plot(t,f);
    plot(t+T,f);
    wnd=gca();
    wnd.data_bounds=[-1.5*T,0,0;1.5*T,1.5,0];
    title("f(t) - Periodica")
    legend("pulso largura a, período T")
   
    wo = 2*%pi/T
    n=round(50/(a*wo)) 
    i=[1:n]
    F=a/T*sin(i*wo*a/2)./(i*wo*a/2);
    F=clean(F');
    subplot(2,1,2)
    bar([0:length(F)-1],F)
    title("F(n) - Discreto")
    wnd=gca();
    wnd.auto_ticks=["off","off","off"];
    wnd.auto_ticks=["on","on","on"]; 
endfunction

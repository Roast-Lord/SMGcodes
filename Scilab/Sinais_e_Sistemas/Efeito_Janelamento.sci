function Efeito_Janelamento(f,fs,T,janela)
    // f - frequencia do seno em kHz
    // fs - Frequencia de amostragem em kHz
    // T  - Duração do sinal em ms
    // janela - tipo de janelamento 
     N=T*fs;
     Ts=1/fs;
     clf;
     subplot(421)
     a1=gca();
     t=[-2*T:T/500:3**T];
     x=sin(2*%pi*f*t);
     plot(t,x,);
     s=sprintf("x(t)=sin(2*pi*%.2f*t)\n%.2f kHz",f,f)
     title(s);
     a1.data_bounds=[-T,min(x)-0.2;2*T,max(x)+0.2]
         
     subplot(423);
     a1=gca();
     t=0:T/200:T;
     N2=length(t);
     x=sin(2*%pi*f*t);
     w=windows_dsp2(N2,janela);
     xw=x.*w;
  
     plot(t,w);
     a1.data_bounds=[-T,-1.0;2*T,max(w)+0.2]
     s=sprintf("w(t) - Janela no intervalo [0,T]\nT=%.2fms",T);
     title(s);
     plot([-T,0,0],[0,0,w(1)])
     plot([T,T,2*T],[w(N2),0,0])
     
     subplot(425);
     a1=gca();
     plot(t,xw);
     a1.data_bounds=[-T,min(xw)-0.2;2*T,max(xw)+0.2]
     s=sprintf("xw(t) - x(t) janelado no intervalo [0, %.2fms]",T);
     title(s);
     plot([-T,0,0],[0,0,xw(1)])
     plot([T,T,2*T],[xw(N2),0,0])
     
     subplot(427);
     a1=gca();
     ts=0:Ts:T-Ts;
     xs=sin(2*%pi*f*ts);
     ws=windows_dsp2(N,janela);
     s=sprintf("xw(n) - xw(t) amostrado com fs=%.2fkHz\n%d amostras",fs,N);
     title(s)
     plot2d3(ts,xs.*ws);
     a1.data_bounds=[-T,min(xw)-0.2;2*T,max(xw)+0.2]
    
    subplot(422);
    a1=gca();
    tc=-1000*T:Ts:1000*T;
    xc=sin(2*%pi*f*tc);
    fc=[-1000*N:1000*N]'/2000/N*fs;
    X=fft(xc);
    plot(fc,fftshift(abs(X))); 
    s=sprintf("X(jw)=delta(-%.2fkHz)+delta(+%.2fkHz)",f,f);
    title(s);
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(X))*1.2] 

    subplot(424);
    a1=gca();
    w=windows_dsp2(N,janela);
    w_padded(1:100*N)=complex(0,0);
    w_padded(1:N)=w(1:N)';
    W=fft(w_padded);
    ms=[-100*N/2:100*N/2-1]'/100/N*fs
    plot(ms,fftshift(abs(W)));
    title("W(jw)");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(W))*1.2]
    
    subplot(426);
    a1=gca();
    ts=0:Ts:T-Ts;
    xs=sin(2*%pi*f*ts);
    xw=xs.*w;
    xw_padded(1:100*N)=complex(0,0);
    xw_padded(1:N)=xw(1:N)';
    XW_padded=fft(xw_padded);
    plot(ms,fftshift(abs(XW_padded)));
    title("XW(jw)");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(W))*1.2]
    
    subplot(428);
    a1=gca();
    XW=fft(xw);
    m=[-N/2:N/2-1]'/N*fs
    plot2d3(m,fftshift(abs(XW)));
    title("XW(m) = DFT( xw(n) ) ");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(XW))*1.2]      
endfunction

function Efeito_Janelamento2(f1,f2,fs,T,janela)
    // f - frequencia do seno em kHz
    // fs - Frequencia de amostragem em kHz
    // T  - Duração do sinal em ms
    // janela - tipo de janelamento 
    
    [y,Fs,bits]=wavread("SCI/modules/sound/demos/chimes.wav");
    
     N=T*fs;
     Ts=1/fs;
     clf;
     subplot(421)
     a1=gca();
  //   t=[-2*T:T/500:3**T];
     t=[-2*T:T/500:0-T/500];
     x1=sin(2*%pi*f1*t  );
     t=[0:T/500:T-T/500];
     x2=sin(2*%pi*f1*t + %pi*(f2-f1)/T*t.^2 );
     t=[T:T/500:3*T];
     x3=sin(2*%pi*f2*t);
     t=[-2*T:T/500:3*T];
     x=[x1,x2,x3]
     plot(t,x);
     s=sprintf("chirp de f1=%.2f kHz a  f2=%.2fkHz",f1,f2)
     title(s);
     a1.data_bounds=[-T,min(x)-0.2;2*T,max(x)+0.2]
         
     subplot(423);
     a1=gca();
     t=0:T/200:T;
     N2=length(t);
     x=sin(2*%pi*f1*t + 2*%pi*(f2-f1)/T*t.^2 );
     w=windows_dsp2(N2,janela);
     xw=x.*w;
     plot(t,w);
     a1.data_bounds=[-T,-1.0;2*T,max(w)+0.2]
     s=sprintf("w(t) - Janela no intervalo [0,T]\nT=%.2fms",T);
     title(s);
     plot([-T,0,0],[0,0,w(1)])
     plot([T,T,2*T],[w(N2),0,0])
     
     subplot(425);
     a1=gca();
     plot(t,xw);
     a1.data_bounds=[-T,min(xw)-0.2;2*T,max(xw)+0.2]
     s=sprintf("xw(t) - x(t) janelado no intervalo [0, %.2fms]",T);
     title(s);
     plot([-T,0,0],[0,0,xw(1)])
     plot([T,T,2*T],[xw(N2),0,0])
     
     subplot(427);
     a1=gca();
     ts=0:Ts:T-Ts;
     xs=sin(2*%pi*f1*ts + 2*%pi*(f2-f1)/T*ts.^2 );
     ws=windows_dsp2(N,janela);
     s=sprintf("xw(n) - xw(t) amostrado com fs=%.2fkHz\n%d amostras",fs,N);
     title(s)
     plot2d3(ts,xs.*ws);
     a1.data_bounds=[-T,min(xw)-0.2;2*T,max(xw)+0.2]
    
    subplot(422);
    a1=gca();
 //   tc=-1000*T:Ts:1000*T;
 //   xc=sin(2*%pi*f1*tc + 2*%pi*(f2-f1)/T*tc.^2 );

     ts=0:Ts:T-Ts;
     x=sin(2*%pi*f1*ts + %pi*(f2-f1)/T*ts.^2 );
     x_padded(1:100*N)=complex(0,0);
     x_padded(1:N)=x(1:N)';
     X=fft(x_padded);
     ms=[-100*N/2:100*N/2-1]'/100/N*fs
    plot(ms,fftshift(abs(X))); 
    s=sprintf("X(jw) - chirp de %.2fkHz a %.2fkHz",f1,f2);
    title(s);
   // a1.data_bounds=[-fs/2,0;fs/2,max(abs(X))*1.2] 

    subplot(424);
    a1=gca();
    w=windows_dsp2(N,janela);
    w_padded(1:100*N)=complex(0,0);
    w_padded(1:N)=w(1:N)';
    W=fft(w_padded);
    ms=[-100*N/2:100*N/2-1]'/100/N*fs
    plot(ms,fftshift(abs(W)));
    title("W(jw)");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(W))*1.2]
    
    subplot(426);
    a1=gca();
    ts=0:Ts:T-Ts;
    xs=sin(2*%pi*f1*ts + 2*%pi*(f2-f1)/T*ts.^2 );
    xw=xs.*w;
    xw_padded(1:100*N)=complex(0,0);
    xw_padded(1:N)=xw(1:N)';
    XW_padded=fft(xw_padded);
    plot(ms,fftshift(abs(XW_padded)));
    title("XW(jw)");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(XW_padded))*1.2]
    
    subplot(428);
    a1=gca();
    XW=fft(xw);
    m=[-N/2:N/2-1]'/N*fs
    plot2d3(m,fftshift(abs(XW)));
    title("XW(m) = DFT( xw(n) ) ");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(XW))*1.2]      
endfunction

function Efeito_Janelamento3(t1,t2,janela)
    // t1 - início da análise em ms
    // t2 - final da análise em ms
    // janela - tipo de janelamento 
     loadmatfile('bat.mat')
     fs=230.4;
     x=bat';
     N=length(x)
     Ts=1/fs
     T=N*Ts;
     Td=t2-t1
     no = int(t1/Ts)+1;
     Nd = int(Td/Ts);

     clf;
     subplot(321)
     a1=gca();
     t=[0:Ts:T-Ts];
     plot(t,x);
     a1.data_bounds=[-0.2,min(x)-0.2;T+0.2,max(x)+0.2]
 
     subplot(323);
     a1=gca();
     w=zeros(1:N)
     w1=windows_dsp2(Nd,janela);
     w(no:no+Nd-1)=w1(1:Nd);
     t=[0:Ts:T-Ts]
     plot(t,w);
     a1.data_bounds=[-0.2,min(w)-0.2;T,max(w)+0.2]
     s=sprintf("w(t) - Janela no intervalo [0,T]\nT=%.2fms",T);
     title(s);
     plot([-0.2,t1,t1],[0,0,w(1)])
     plot([t2,t2,T+0.2],[w(Nd),0,0])
   
     subplot(325);
     a1=gca();
     xw = x.*w;
     plot(t,xw);
     a1.data_bounds=[-0.2,min(x)-0.2;T,max(x)+0.2]
     s=sprintf("xw(t) - x(t) janelado no intervalo [0, %.2fms]",T);
     title(s);
     plot([-0.2,0,0],[0,0,xw(1)])
     plot([T,T,T+0.2],[x(N),0,0]) 

     subplot(322);
     a1=gca();
     X=fft(x);
     ms=[-N/2:N/2-1]'/N*fs
     plot(ms,fftshift(abs(X))); 
     s=sprintf("X(jw)");
     title(s);
     a1.data_bounds=[0,0;fs/2,max(abs(X))] 

     subplot(324);
     a1=gca();
     N2=32;
     w=windows_dsp2(N2,janela);
     w_padded(1:10*N2)=complex(0,0);
     w_padded(1:N2)=w(1:N2)';
     W=fft(w_padded);
     ms=[-10*N2/2:10*N2/2-1]'/10/N2*fs
     plot(ms,fftshift(abs(W)));
     title("W(jw)");
     a1.data_bounds=[-fs/4,0;fs/4,max(abs(W))*1.2] 
   
     subplot(326);
     a1=gca();
     ms=[-N/2:N/2-1]'/N*fs
     XW=fft(xw);
     plot(ms,fftshift(abs(XW)));
     title("XW(jw)");
     a1.data_bounds=[0,0;fs/2,max(abs(X)/2)]
endfunction

function Efeito_Janelamento4(f,f1,fs,T,janela)
    // f - frequencia do seno em kHz
    // fs - Frequencia de amostragem em kHz
    // T  - Duração do sinal em ms
    // janela - tipo de janelamento 
     N=T*fs;
     Ts=1/fs;
     clf;
     subplot(421)
     a1=gca();
     t=[-2*T:T/500:3**T];
     x=sin(2*%pi*f*t)+2*sin(2*%pi*f1*t+3*%pi/4);
     plot(t,x,);
     s=sprintf("x(t)=sin(2*pi*%.2f*t)\n%.2f kHz",f,f)
     title(s);
     a1.data_bounds=[-T,min(x)-0.2;2*T,max(x)+0.2]
         
     subplot(423);
     a1=gca();
     t=0:T/200:T;
     N2=length(t);
     x=sin(2*%pi*f*t)+2*sin(2*%pi*f1*t+3*%pi/4);;
     w=windows_dsp2(N2,janela);
     xw=x.*w;
     plot(t,w);
     a1.data_bounds=[-T,-1.0;2*T,max(w)+0.2]
     s=sprintf("w(t) - Janela no intervalo [0,T]\nT=%.2fms",T);
     title(s);
     plot([-T,0,0],[0,0,w(1)])
     plot([T,T,2*T],[w(N2),0,0])
     
     subplot(425);
     a1=gca();
     plot(t,xw);
     a1.data_bounds=[-T,min(xw)-0.2;2*T,max(xw)+0.2]
     s=sprintf("xw(t) - x(t) janelado no intervalo [0, %.2fms]",T);
     title(s);
     plot([-T,0,0],[0,0,xw(1)])
     plot([T,T,2*T],[xw(N2),0,0])
     
     subplot(427);
     a1=gca();
     ts=0:Ts:T-Ts;
     xs=sin(2*%pi*f*ts)+2*sin(2*%pi*f1*ts+3*%pi/4);;
     ws=windows_dsp2(N,janela);
     s=sprintf("xw(n) - xw(t) amostrado com fs=%.2fkHz\n%d amostras",fs,N);
     title(s)
     plot2d3(ts,xs.*ws);
     a1.data_bounds=[-T,min(xw)-0.2;2*T,max(xw)+0.2]
    
    subplot(422);
    a1=gca();
    tc=-1000*T:Ts:1000*T;
    xc=sin(2*%pi*f*tc)+sin(2*%pi*f1*tc+3*%pi/4);;
    fc=[-1000*N:1000*N]'/2000/N*fs;
    X=fft(xc);
    plot(fc,fftshift(abs(X))); 
    s=sprintf("X(jw)=delta(-%.2fkHz)+delta(+%.2fkHz)",f,f);
    title(s);
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(X))*1.2] 

    subplot(424);
    a1=gca();
    w=windows_dsp2(N,janela);
    w_padded(1:100*N)=complex(0,0);
    w_padded(1:N)=w(1:N)';
    W=fft(w_padded);
    ms=[-100*N/2:100*N/2-1]'/100/N*fs
    plot(ms,fftshift(abs(W)));
    title("W(jw)");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(W))*1.2]
    
    subplot(426);
    a1=gca();
    ts=0:Ts:T-Ts;
    xs=sin(2*%pi*f*ts)+2*sin(2*%pi*f1*ts+3*%pi/4);;
    xw=xs.*w;
    xw_padded(1:100*N)=complex(0,0);
    xw_padded(1:N)=xw(1:N)';
    XW_padded=fft(xw_padded);
    plot(ms,fftshift(abs(XW_padded)));
    title("XW(jw)");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(W))*1.2]
    
    subplot(428);
    a1=gca();
    XW=fft(xw);
    m=[-N/2:N/2-1]'/N*fs
    plot2d3(m,fftshift(abs(XW)));
    title("XW(m) = DFT( xw(n) ) ");
    a1.data_bounds=[-fs/2,0;fs/2,max(abs(XW))*1.2]      
endfunction


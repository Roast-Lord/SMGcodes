function yt=leito_trend()
     A=read("leito_rio.txt",10017,2);
     y=A(:,2)';
     Ts=0.755567;
     fs=1/Ts;
     N=length(y)
     t=[0:Ts:length(y)*Ts-Ts];
  yt=detrend(y,"l",[0,300,4238,4421,6394,6400,7450,10017]);
// yt=detrend(y,"l",[0,4800,10017]);
      yt=detrend(y)
      plot(t,y)
      plot(t,yt,'r')
  end
  
function yt=leito_trend2()
     A=read("leito_rio.txt",10017,2);
     y=A(:,2)';
     Ts=0.755567;
     fs=1/Ts;
     N=length(y)
     yt=zeros(1:N)
     for (i=501:N-500)
         yt(i)=y(i)-mean(y(i-500:i+500))
     end
     t=[0:Ts:length(y)*Ts-Ts];
      plot(t,y)
      plot(t,yt,'r')
  end
  



function ytf=leito_rio()
     A=read("leito_rio.txt",10017,2);
     y=A(:,2)';
     Ts=0.755567;
     fs=1/Ts;
     N=length(y)
     t=[0:Ts:length(y)*Ts-Ts];
  //   yt=detrend(y,"l",[0,415,4238,4421,6394,6400,7450,10017]);
      yt=detrend(y)
  
     T=N*Ts;
     gcf().color_map = jetcolormap(64);
     
     ms=[0:N-1]'/N*fs
     h=windows_dsp2(N,6);
     YT = fft(y.*h)
     hpf=sinc_filter_hp2(N,2,(0.001)/fs);
     HPF=fft(hpf)
     YTF = YT .* HPF;
     yt = fftshift(ifft(YTF))
     
     
     
     ms=[0:N-1]'/N*fs
   //  YT = fft(yt)
     hpf=sinc_filter_hp2(N,2,(0.1)/fs);
     HPF=fft(hpf)
     YTF = YT .* HPF;
     ytf = fftshift(ifft(YTF))
     
     h=windows_dsp2(3001,5);
     TF=tfrstft(ytf,[1:N],N,h);
     
     subplot(311)
     plot(t,yt)
     plot(t,ytf,'r')
     subplot(312) 
     plot(ms(1:N/2),abs(YT(1:N/2)))
     subplot(313)
     x=(500:20:N-20)*Ts;
     f=(1:5:N/2)/N*fs;
     grayplot(f,x,(abs(TF(1:5:N/2,500:20:N-20))));
endfunction

function Janelamento_rio(ytf,t1,t2,janela)
     N=length(ytf)
     x=ytf
     Ts=0.755567;
     fs=1/Ts;
     T=N*Ts;
     Td=t2-t1
     no = int(t1/Ts)+1;
     Nd = int(Td/Ts);

  //   clf;
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
     s=sprintf("w(t) - Janela no intervalo [0,T]\nT=%.2fm",T);
     title(s);
     plot([-0.2,t1,t1],[0,0,w(1)])
     plot([t2,t2,T+0.2],[w(Nd),0,0])
   
     subplot(325);
     a1=gca();
     xw = x.*w;
     plot(t,xw);
     a1.data_bounds=[-0.2,min(x)-0.2;T,max(x)+0.2]
     s=sprintf("xw(t) - x(t) janelado no intervalo [%.2fm, %.2fm]",t1,t2);
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
     a1.data_bounds=[0,0;1/40,max(abs(X))] 

     subplot(324);
     a1=gca();
     N2=32;
     w=windows_dsp2(N2,janela);
     w_padded(1:10*N2)=complex(0,0);
     w_padded(1:N2)=w(1:N2)';
     W=fft(w_padded);
     ms=[-10*N2/2:10*N2/2-1]'/10/N2*fs
 //    plot(ms,fftshift(abs(W)));
  //   title("W(jw)");
  //   a1.data_bounds=[-fs/8,0;fs/8,max(abs(W))*1.2] 
   
     subplot(326);
     a1=gca();
     ms=[-N/2:N/2-1]'/N*fs
     XW=fft(xw);
     plot(ms,fftshift(abs(XW)));
     title("XW(jw)");
     a1.data_bounds=[0,0;1/40,max(abs(X)/2)]
endfunction

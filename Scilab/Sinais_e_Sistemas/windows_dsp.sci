function windows_dsp_plot()
    N=1024
    n=[1:N]; 
    rect    =ones(1:N);
    bart    =1-abs((n-(N-1)/2)/((N-1)/2));
    hann    =0.5-0.5*cos(2*%pi*n/(N-1));
    hamm    =0.54-0.46*cos(2*%pi*n/(N-1));
    blackman=0.42-0.5*cos(2*%pi*n/(N-1))+0.08*cos(4*%pi*n/(N-1));
    flat    =(1-1.93*cos(2*%pi*n/(N-1))+1.29*cos(4*%pi*n/(N-1))...
    -0.388*cos(6*%pi*n/(N-1))+0.028*cos(8*%pi*n/(N-1)))/4;
    rect(N:10*N-1)=complex(0,0);
    bart(N:10*N-1)=complex(0,0);
    hann(N:10*N-1)=complex(0,0);
    hamm(N:10*N-1)=complex(0,0);
    blackman(N:10*N-1)=complex(0,0);
    flat(N:10*N-1)=complex(0,0);
    clf
    subplot(211)
    plot(rect(1:N-1),'b--')
    plot(bart(1:N-1),'b')
    plot(hann(1:N-1),'r')
    plot(hamm(1:N-1),'g')
    plot(blackman(1:N-1),'m')
    plot(flat(1:N-1),'bk')
    xgrid()
    legend(["Retangular";"Bartlet";"Hanning";"Hamming";"Blackman";"Flat Top"]);
    subplot(212)
    RECT=20*log(abs(fft(rect))+1e-12);
    BART=20*log(abs(fft(bart))+1e-12);
    HANN=20*log(abs(fft(hann))+1e-12);
    HAMM=20*log(abs(fft(hamm))+1e-12);
    BLACK=20*log(abs(fft(blackman))+1e-12);
    FLAT=20*log(abs(fft(flat))+1e-12);
    plot(RECT(1:N/10),'b--')
    plot(BART(1:N/10),'b')
    plot(HANN(1:N/10),'r')
    plot(HAMM(1:N/10),'g')
    plot(BLACK(1:N/10),'m') 
    plot(FLAT(1:N/10),'bk') 
    xgrid()
    legend(["Retangular";"Bartlet";"Hanning";"Hamming";"Blackman";"Flat Top"]);
endfunction

function y=windows_dsp2(N,janela)
    n=1:N
    select janela
    case 1 then //retangular
        y=ones(1:N);
    case 2 then  //bartlett
        y=1-abs(((n-1)-(N-1)/2)/((N-1)/2));
    case 3 then //hanning
        y=0.5-0.5*cos(2*%pi*(n-1)/(N-1));
    case 4 then //hamming
        y=0.54-0.46*cos(2*%pi*(n-1)/(N-1));
    case 5 then //blackman
        y=0.42-0.50*cos(2*%pi*(n-1)/(N-1))+0.08*cos(4*%pi*(n-1)/(N-1));
    case 6 then //flattop
        y=1-1.93*cos(2*%pi*(n-1)/(N-1))+1.29*cos(4*%pi*(n-1)/(N-1))...
        -0.388*cos(6*%pi*(n-1)/(N-1))+0.028*cos(8*%pi*(n-1)/(N-1));
    case 7 then //gausssiana
        media=(N-1)/2;
        y=exp(-0.5*(((n-1)-media)/(0.35*media))^2);
    else  //retangular
        y=ones(1:N);
    end
endfunction


function windows_dsp
  
    N=1024
    n=1:N
    bart=1-abs((n-(N-1)/2)/((N-1)/2));
    hann=0.5-0.5*cos(2*%pi*n/(N-1));
    hamm=0.54-0.46*cos(2*%pi*n/(N-1));
    flat=(1-1.93*cos(2*%pi*n/(N-1))+1.29*cos(4*%pi*n/(N-1))...
    -0.388*cos(6*%pi*n/(N-1))+0.028*cos(8*%pi*n/(N-1)))/4;
    
    bart(N:10*N-1)=complex(0,0);
    hann(N:10*N-1)=complex(0,0);
    hamm(N:10*N-1)=complex(0,0);
    flat(N:10*N-1)=complex(0,0);
    clf
    subplot(211)
    plot(bart(1:N-1),'b')
    plot(hann(1:N-1),'r')
    plot(hamm(1:N-1),'g')
    plot(flat(1:N-1),'bk')
    legend(["Bartlet";"Hanning";"Hamming";"Flat Top"]);
    xgrid()
    subplot(212)
    BART=20*log(abs(fft(bart)));
    HANN=20*log(abs(fft(hann)));
    HAMM=20*log(abs(fft(hamm)));
    FLAT=20*log(abs(fft(flat)));
    plot(BART(1:N/8),'b')
    plot(HANN(1:N/8),'r')
    plot(HAMM(1:N/8),'g') 
    plot(FLAT(1:N/8),'bk') 
    xgrid()
    legend(["Bartlet";"Hanning";"Hamming";"Flat Top"]);
endfunction

function  chirp(fs)
    TS=1/fs;
    t=[0:TS:10];
    w=-fs/2:fs/(length(t)):fs/2-fs/(length(t));
    y= sin(%pi*t^2) .* (0.5-0.5*cos(2*%pi*t/10));
 //   y = sin(%pi*t^2);
    plot(w,abs(fftshift(fft(y))))
    
endfunction

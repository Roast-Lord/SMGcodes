function bodeplot1(num,den,a,b)
    Hs = syslin('c',num/den);
    bode(Hs,a,b)    
    
endfunction

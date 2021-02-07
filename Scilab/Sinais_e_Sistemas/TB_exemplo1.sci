function Hz=TB_exemplo1(T)
   simp_mode(%f)
    num=2250000*T^3*(1+3*z+3*z^2+z^3)
    den1=2250000*T^3-105000*T^2+1600*T-8;
    den2=(3*2250000*T^3-105000*T^2-1600*T-3*8)*z
    den3=(3*2250000*T^3+105000*T^2-1600*T-3*8)*z^2;
    den4=(2250000*T^3+105000*T^2+1600*T+8)*z^3;
    z=poly(0,'z');
    Hz=num/(den1+den2+den3+den4)
endfunction

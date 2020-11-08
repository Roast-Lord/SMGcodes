function smg_plot_zeros1(H,a,b)
    w = a:0.1:b;
    plot_polos_zeros2(H)
    s = %i*w;
    H;
    p2 = scf(2);
    plot(w,abs(H))
    
endfunction

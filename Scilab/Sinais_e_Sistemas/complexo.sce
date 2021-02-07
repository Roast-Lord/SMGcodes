function [mod,fase]=polar2(z)
    mod = abs(z)
    fase = atan(imag(z),real(z))
    
endfunction


function [mod,fase]=polard(z)
    mod = abs(z)
    fase  = atand(imag(z),real(z))
endfunction

//Retangular para Polar
function [mod,fase]=polard(z) //fase em graus
    mod   = abs(z)
    fase  = atand(imag(z),real(z))
endfunction

function [mod,fase]=polar2(z) //fase em radianos
     mod   = abs(z)
     fase  = atan(imag(z),real(z))
endfunction


// Polar para Retangular
function z = retangular(mod,fase)  // fase em radianos
    z = mod.*exp(%i*fase)
endfunction


function z = retangulard(mod,fase)  // fase em graus
    z = mod.*exp(%i*fase*%pi/180)
endfunction

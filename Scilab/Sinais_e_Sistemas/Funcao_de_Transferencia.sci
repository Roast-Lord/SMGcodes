function H=Funcao_de_Transferencia(a,b)
 
 npolos=length(a)-1
 nzeros=length(b)-1
 q=poly(0,'q')
 num=0;
 den=1;
 for p=1:npolos
    den=den+a(p+1)*q^p;
 end
 for p=0:nzeros
    num=num+b(p+1)*q^p;
 end
    H=num/den;
endfunction

 function F=dft_fga(f)
    N=length(f)
    for m=0:N-1 
        F(m+1)=0;
        for n=0:N-1
            F(m+1)=F(m+1)+f(n+1)*exp(-%i*2*%pi*n*m/N);
        end
    end
    F=clean(F)
endfunction


 function F=dft_fga2(f)
    N=length(f)
    m=0:N-1;
    n=0:N-1;
    W=exp(-%i*2*%pi*n'*m/N);
    F=f*W;
    F=clean(F)
endfunction

function X=dft_fga3(x)
    N=length(x)
    for m=0:N-1 
        X(m+1)=0;
        for n=0:N-1
            X(m+1)=X(m+1)+x(n+1)*(cos(2*%pi*n*m/N)-%i*sin(2*%pi*n*m/N));
        end
    end
endfunction

function f=idft_fga(F)
    N=length(F)
    for n=0:N-1 
        f(n+1)=0;
        for m=0:N-1
            f(n+1)=f(n+1)+F(m+1)*exp(%i*2*%pi*n*m/N);
        end
        f(n+1)=f(n+1)/N
    end
    f = clean(f);
endfunction

 function f=idft_fga2(F)
    N=length(F)
    m=0:N-1;
    n=0:N-1;
    W=exp(%i*2*%pi*n'*m/N);
    f=F*W/N;
    f=clean(f)
endfunction

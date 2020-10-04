function [p2,ordem]=bairstow_pol2(f,tol)
    // utilizada no programa de frações parciais
    function [d,r1,r2]=baskara(u,v);
        // Solução de x^2 + ux + v = 0 
          d=u^2-4*v;
          r1=(-u+sqrt(d))/2
          r2=(-u-sqrt(d))/2
    endfunction
  
    cf=flipdim(coeff(f),2)
    cf=cf/cf(1);
    a=cf(2:length(cf))  // maior expoente com multiplicador 1
    new_pol=poly(flipdim([1,a],2),'s','coeff')
    n=length(a)
    p=[ones(1:n)',zeros(1:n)']
    n_pol=1
    p(n_pol,1)=f
    p(n_pol,2)=0;
    n_pol=n_pol+1
    it=1;
    while n>2
      u=1; v=1; st=1;
      while st>tol
        b(1)=a(1)-u;
        b(2)=a(2)-b(1)*u-v;
        for k=3:n
          b(k)=a(k)-b(k-1)*u-b(k-2)*v;
        end;
        c(1)=b(1)-u;
        c(2)=b(2)-c(1)*u-v;
        for k=3:n-1
          c(k)=b(k)-c(k-1)*u-c(k-2)*v;
        end;
        c1=c(n-1);
        b1=b(n);
        cb=c(n-1)*b(n-1);
        c2=c(n-2)*c(n-2);
        bc=b(n-1)*c(n-2);
        if n>3
            c1=c1*c(n-3); 
            b1=b1*c(n-3);
         end;
        dn=c1-c2;
        du=(b1-bc)/dn;
        dv=(cb-c(n-2)*b(n))/dn;
        u=u+du; v=v+dv;
        st=norm([du dv]);
        it=it+1;
      end;
      [d,rts(n),rts(n-1)]=baskara(u,v);
      if (d<0) then
          p(n_pol,1)=real((s-rts(n))*(s-rts(n-1)))
          p(n_pol,2)=-2;
          n_pol=n_pol+1
      else
          p(n_pol,1)=real((s-rts(n)))
          p(n_pol,2)=1;
          n_pol=n_pol+1
          p(n_pol,1)=real((s-rts(n-1)))
          p(n_pol,2)=1;
          n_pol=n_pol+1
      end
      n=n-2;
      a(1:n)=b(1:n);
    end;
    

    // última equação 
    u=a(1); v=a(2);
    if(n==1)  //liner
        rts(n)=-a(1)
        p(n_pol,1)=real((s-rts(n)))
        p(n_pol,2)=1;
    else  // quadrática
        [d,rts(n),rts(n-1)]=baskara(u,v);
        if (d<0) then
             p(n_pol,1)=real((s-rts(n))*(s-rts(n-1)))
             p(n_pol,2)=-2;
        else
             p(n_pol,1)=real((s-rts(n)))
             p(n_pol,2)=1;
             n_pol=n_pol+1
             p(n_pol,1)=real((s-rts(n-1)))
             p(n_pol,2)=1;
        end
    end;
  

    for(i=2:n_pol)
        if (p(i,2)==-2)
            r=roots(p(i,1))
            if( atan( abs(imag(r(1))) / abs(real(r(1)))) < 1e-5 ) then
                p(i,1)=(s-sign(real(r(1)))*abs(r(1)))
                p(i,2)=1
                n_pol=n_pol+1
                p(n_pol,1)=(s-sign(real(r(1)))*abs(r(1)))
                p(n_pol,2)=1
            end
        end
    end
          
    for(i=2:n_pol)
        for(j=i+1:n_pol)
             if ( p(i,2)<>-2 & p(j,2)<>-2) then
                 r1=roots(p(i,1));
                 r2=roots(p(j,1));
                 if( abs(r1(1)-r2(1))<1e-4) then
                    r = (real(r1(1))+real(r2(1)))/2
                    p(min(i,j),1)=(s-r);
                    p(min(i,j),2)=p(i,2)+p(j,2)
                    p(max(i,j),1)=1;
                    p(max(i,j),2)=0
                 end  
             end
        end
    end
    
    k=1
    for(i=2:n_pol)
        if (p(i,2)<>0) then
            p2(k)=p(i,1)
            ordem(k)=p(i,2)
            k=k+1
        end
    end
    
endfunction



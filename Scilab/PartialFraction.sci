 function M=PartialFraction(H)
     num=H(2);
     den=H(3);
     s=poly(0,'s');
     [p,ordem]=bairstow_pol2(den,1e-10)
     p=real(p)
     ordem=coeff(ordem)
     N=length(p)
     k=1
     for(i=1:N)
         denA=1
         for(j=1:N) // denominador para o cálculo dos resíduos
             if(i<>j) then
                 if(ordem(j)>0) then
                     denA=denA*p(j)^ordem(j)
                  else
                     denA=denA*p(j)
                  end
             end
         end
         if (ordem(i)==1) then  //polo simples
              HA = num/denA
              r=roots(p(i))
              r=round(r*1e5)/1e5
              A=horner(HA,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=1
              k=k+1
              printf("%f*exp(%f*t)+\n",A,r)
          elseif    (ordem(i)==2) //polo duplo
              HA = num/denA
              r=roots(p(i))
              r=round(r*1e5)/1e5
              A=horner(HA,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=2
              k=k+1
              printf("%f*t*exp(%f*t)+\n",A,r)
              HAd=derivat(HA)
              A=horner(HAd,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=1
              k=k+1
              printf("%f*exp(%f*t)\n+",A,r)
          elseif    (ordem(i)==3) // polo triplo
              HA = num/denA
              r=roots(p(i))
              r=round(r*1e5)/1e5
              A=horner(HA,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=3
              k=k+1
              HAd=derivat(HA)
              A=horner(HAd,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=2
              k=k+1
              HAdd=derivat(HAd)
              A=1/2*horner(HAdd,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=1
              k=k+1
          elseif    (ordem(i)==-2) // polos complexos conjugados
              r=roots(p(i))
              r=round(r*1e5)/1e5
              denB=denA*(s-r(2))
              HA = num/denB
              A=horner(HA,r(1))
              R(k)=A
              D(k)=(s-r(1))
              E(k)=-1
              k=k+1
              denB=denA*(s-r(1))
                HA = num/denB
              A=horner(HA,r(2))
              R(k)=A
              D(k)=(s-r(2))
              E(k)=-1
              k=k+1
              RC = R(k-1)/D(k-1)+R(k-2)/D(k-2)
              R(k)= RC(2)
              D(k)= RC(3)
              E(k)=-10
              k=k+1
          end
     end
  M=[real(R),imag(R),real(D),imag(D),E]       
  endfunction

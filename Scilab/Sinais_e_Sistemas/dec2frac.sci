function x_frac=dec2frac(x, erro)
  iri(1)=floor(x)
  resto(1)=x-iri(1)
  num(1)=iri(1)
  den(1)=1
  x_frac=[num(1),den(1)]
  s=sprintf("%d/%d \t e=%0.e",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2))
  )
  disp(s)
  if resto(1)<>0 then
    iri(2)=floor(1.0/resto(1))
    resto(2)=1.0/resto(1)-iri(2)
    num(2)=iri(2)*num(1)+1
    den(2)=iri(2)*den(1)
    x_frac=[num(2),den(2)]
    s=sprintf("%d/%d \t e=%0.e",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
    disp(s)
    if resto(2)<>0 then
      for n=3:25
         iri(n)=floor(1.0/resto(n-1))
         resto(n)=1.0/resto(n-1)-iri(n)
         num(n)=iri(n)*num(n-1)+num(n-2)
         den(n)=iri(n)*den(n-1)+den(n-2)
         x_frac=[num(n),den(n)]
         s=sprintf("%d/%d \t e=%0.e",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
         disp(s) 
         if (resto(n)==0)|(abs(x-num(n)/den(n)) < erro)
             break;
         end
      end
    end
  end
endfunction

function x_frac=dec2frac2(x, erro)
  a(1)=floor(x)
  resto(1)=x-a(1)
  num(1)=a(1)
  den(1)=1
  x_frac=[num(1),den(1)]
  s=sprintf("%d/%d \t e=%0.e",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
  disp(s)
  if resto(1)<>0 then
    a(2)=floor(1.0/resto(1))
    resto(2)=1.0/resto(1)-a(2)
    num(2)=a(2)*num(1)+1
    den(2)=a(2)*den(1)
    x_frac=[num(2),den(2)]
    s=sprintf("%d/%d \t e=%0.e",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
    disp(s)
    if resto(2)<>0 then
      for n=3:17
         a(n)=floor(1.0/resto(n-1))
         resto(n)=1.0/resto(n-1)-a(n)
         num(n)=a(n)*num(n-1)+num(n-2)
         den(n)=a(n)*den(n-1)+den(n-2)
         x_frac=[num(n),den(n)]
         s=sprintf("%d/%d \t e=%0.e",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
         disp(s) 
         if (resto(n)==0)|(abs(x-num(n)/den(n)) < erro)
             break;
         end
      end
    end
  end
endfunction


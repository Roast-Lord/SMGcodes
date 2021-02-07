function Y=cleancomplex(X)
   e=1D-14 
   n=length(X)
   Y=X;
   for i=1:n
     if(abs(X(i))<e)
       Y(i)=0
     else 
         if(abs(real(X(i)))<e)
             Y(i) =  %i*imag(X(i))
         else 
             if (abs(imag(X(i)))<e)
                Y(i) = real(X(i))
             end
          end
      end
   end
endfunction

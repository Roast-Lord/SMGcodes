function y=LinearConv(x,h)
   N=length(x)
   M=length(h)
   y=zeros(1:N)
   for j = M+1:N 
        for i = 1:M
          y(j) = y(j) + x(j-i) * h(i)
        end 
   end   
endfunction

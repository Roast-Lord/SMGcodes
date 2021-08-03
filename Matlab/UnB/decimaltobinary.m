% This code is not yet finished.
function [n] = decimaltobinary(x)
format long;    
y=x;
u=x;
k = int64(floor(x));
n = [];

    while k>=1
        z=k;
        k = k/2;
        if int64(k)*2 == z
            n = [n 0];
            
        else
            n = [n 1];
            k = k-0.5;
        end
    
    end
    format long;
    n = flip(n);
    c=[];
    y =int64(floor(y));
    disp(y)
    disp(u)
    m = u - y;
    disp(m)
end
function [x] = calcpi(n)
    format long;
    x=0;
    for(k = 1:n)
        x += ((-1)^(k-1))*(4/(2*k-1));
    end
    relative_error = (abs(x-pi)/pi)*100;
    fprintf('O erro relativo e de: %1.2f%% \n', relative_error);
end

function x = reamostragem(y,n)

    [amostras, channels] = size(y);
    x = [];
    
    for(i = 1:channels)
        x(:,i) = y(1:n:amostras,i);
    end
end
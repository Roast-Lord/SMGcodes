function x = reamostragem2(y, n)
    
    [amostras, channels] = size(y);
    x = zeros(amostras, channels);

    for (k = 1:channels)
        for (i = 1:n:amostras)
            for (j = 0:n - 1)
                if (i + j > amostras)
                    break;
                end
                x(i, k) += (1 / n) * y(i + j, k);
            end
        end
    end
end

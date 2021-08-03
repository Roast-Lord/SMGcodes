function [s] = lagrangepoly(x, y, x0)
    x = [1, 2.5, 2, 3, 4, 5];
    y = [1, 7, 5, 8, 2, 1];
    x0 = 3.5;
    i = 1;
    s = 0;
    p = 1;
    n = length(x);

    for j = 1:n

        if (i == j)
            i++;
            p *= ((x0 - x(1, i)) / (x(1, j) - x(1, i)));
        else
            p *= ((x0 - x(1, i)) / (x(1, j) - x(1, i)));
        end

        s += y(1, j) * p
        i++;
    end

end

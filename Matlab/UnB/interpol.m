%This code applies a linear interpolation
function k = interpol(x1,y1,x2,y2,n,c)
    if (strcmp(c,'x') == 1)
        k = x1 + (x2-x1)*((n-y1)/(y2-y1));
    else
        if (strcmp(c,'y') == 1)
            k = y1 + (y2-y1)*((n-x1)/(x2-x1));
        else
            disp("Wrong input, 6th value has to be a char 'y' or 'x' \n")
        end
    end
end

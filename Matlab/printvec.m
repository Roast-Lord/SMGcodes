function [b] = printvec(a)
    [linha,coluna] = size(a);
    for (i = 1:linha)
        for(j = 1:coluna)
            fprintf('%d  ',a(i,j));
        end
        fprintf('\n');
    end
end
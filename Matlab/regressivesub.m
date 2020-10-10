%This is the regressivesub used in the gauss method.
function s = regressivesub(mc,ms)
    [nl,nc] = size(mc);
    s = zeros(nl,1);
    for i = nl:-1:1
        aux = 0 ;
        for j = 1:nc
            aux += mc(i,j)*s(j);
        end
        s(i) = (ms(i)-aux)/mc(i,i);
    end
end
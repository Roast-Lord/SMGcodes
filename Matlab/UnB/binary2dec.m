function [n] = binary2dec(i,j) % receive the integer part i, and the fractionary part j , outputting the decimal number "n".
    %Check if the function receives more than 1 value, in case [j]=0.
    format long;
    if nargin<2
        j=0;
    end
    i = num2str(i)
    j = num2str(j)
    
k = 1;
    [inteiro] = ones(1,numel(i));
    [fracio] = ones(1,numel(j));

    while k ~= numel(i)
        if inteiro(1,k) == str2num(i(1,k))
            
            
        else
            inteiro(1,k) = 0;
            k++;
        end
        end

        while k ~= numel(j)
        
            if fracio(1,k) == str2num(j(1,k))
                fracio(1,k) = 1;
                k++;
            else
                fracio(1,k) = 0;
                k++;
            end
            end

disp(fracio)
disp(inteiro)
    % conta a quantidade de elementos da parte fracionária.
    Elementos_da_matriz_frac = numel(fracio);
    % conta a quantidade de elementos da parte inteira.
    Elementos_da_matriz_inteiros = numel(inteiro); 
    % cria uma matriz de números 2, para a base da parte fracionária
    [matriz_de_bases1] = ones(1,Elementos_da_matriz_frac)*2; 
     % cria uma matriz com de números 2, para a base da parte inteira.
    [matriz_de_bases2] = ones(1,Elementos_da_matriz_inteiros)*2;
     % cria uma matriz com o expoentes da parte fracionária.
    [Matriz_de_Expoentes1] = [1:Elementos_da_matriz_frac]*(-1); 
    %cria uma matriz com o expoentes da parte inteira.
    [Matriz_de_Expoentes2] = [0:Elementos_da_matriz_inteiros-1]; 
    
    
    %Aplica a definição de conversão de binário para decimal.
    [Parte_inteira] = (([matriz_de_bases2]).^([Matriz_de_Expoentes2])).*(flip(inteiro)); %flip, espelha a matriz i.

    [Parte_fracionaria] = (([matriz_de_bases1]).^([Matriz_de_Expoentes1])).*([fracio]);

    n = sum(Parte_inteira)+sum(Parte_fracionaria); %sum, soma todos os valores de uma matriz.
     
end 
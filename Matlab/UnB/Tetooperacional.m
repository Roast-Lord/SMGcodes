S = 16.16; %área da asa
CD0 = 0.0317; %CD_0
W = 6109.54;
W0 = 8355.8223; %peso liq do avião: peso aviao + galoes + passageiro + bagagem
W1 = 7286.338; % peso liq do aviao sem o combustivel: peso aviao + passageiro + bagagem
e = 0.747; % coeficiente de oswald
b = 10.97; % envergadura da asa
RA = (b^2)/S; 
n = 0.8; % fator eficiencia da helice
PM = 111855; % potencia do motor

PA_0 = n*PM;

W = W0;

%EQUAÇÃO DO LD MÁXIMO DE ACORDO COM O LIVRO.
LD_MAX = sqrt((pi*e*RA)/(4*CD0)); %razão CL/CD MÁXIMA.


%Início do cálculo do teto operacional R/C = 100 ft/min.
k1 = 15;
k2 = 40;
for i = k1*1000:1000:1000*k2
    RC_MAX2 = ((PA_0)/W) - 0.8776*sqrt((W/S)/((Densityair(i))*CD0))*(1/(LD_MAX^(3/2)));
    fprintf('h = %i m, (R/C)_max = %1.4f m/s\n',i,RC_MAX2);
end
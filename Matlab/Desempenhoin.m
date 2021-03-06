S = 173.94479; %área da asa
CD0 = 0.0317; %CD_0
W = 1373.479235;
W0 = 1878.46; %peso liq do avião: peso aviao + galoes + passageiro + bagagem
W1 = 1638.0339505; % peso liq do aviao sem o combustivel: peso aviao + passageiro + bagagem
e = 0.747; % coeficiente de oswald
b = 35.990814; % envergadura da asa
RA = (b^2)/S; 
n = 0.8; % fator eficiencia da helice
PM = 150; % potencia do motor

c = 0.444794831*(1/550)*(1/3600); % (ft^(-1))consumo especifico de combustivel

%ALTERAR O VALOR DA DENSIDADE PARA ALTITUDES DIFERENTES
rho = 0.0023769; %densidade 3000m 0.001764324392  --0.0023769

PA = n*PM*550*(rho/0.0023769); % potencia máxima do motor aplicado correção de altura
PA_0 = n*PM*550;

%ALTERAR O VALOR DA VELOCIDADE PARA OBTENÇAO DE DADOS PARA DADA VELOCIDADE
V = 50*(3.2808398950131); %velocidade do aviao

%Inicio do calculo dos coeficientes
CL = (W0/(0.5*rho*V^2*S));
CD = CD0 + ((CL^2)/(pi*e*RA));

LD = CL/CD;



R = (n/c)*(CL/CD)*(log(W0/W1)); %alcance do avião

E = (n/c)*(CL^(3/2)/CD)*sqrt(2*rho*S)*(W1^(-1/2) - W0^(-1/2)); %AUTONOMIA
%potencia requerida
PR = sqrt(2)*sqrt((0.5)^3*rho^2*S^2*V^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*V^4) + CD0)^2);

%potencia disponivel máxima
PA_max = (1/n)*(sqrt(2)*sqrt((0.5)^3*rho^2*S^2*V^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*V^4) + CD0)^2));



%Razão de subida
RC = (PA - sqrt(2)*sqrt((0.5)^3*rho^2*S^2*V^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*V^4) + CD0)^2))/(W0);

%EQUAÇÃO DO LD MÁXIMO DE ACORDO COM O LIVRO.
LD_MAX = sqrt((pi*e*RA)/(4*CD0)); %razão CL/CD MÁXIMA.

%razão máxima de subida
RC_MAX = ((PA_0)/W0) - 0.8776*sqrt((W0/S)/(rho*CD0))*(1/(LD_MAX^(3/2)));

%-------------
%TALVEZ ESSA FUNÇÃO NÃO ESTEJA CORRETA, CHECAR MATERIAL TEÓRICO
CL_TETAMIN = sqrt(CD0*pi*e*RA); % C_L em função apenas da AERODINÂMICA.
%--------------


TETA_MIN = atan(1/LD_MAX); %angulo de planeio mínimo

V_PLANEIO = sqrt((2*(cos(TETA_MIN))*W0/(rho*CL_TETAMIN*S))); %Velocidade do planeio

TETO_ABSOLUTO = -19867*log(((W0/PA_0))*sqrt((2*W0)/(S*0.0023769)*((0.7436*(CD0^(1/4)))/((e*RA)^(3/4)))));
TETO_ABSOLUTO2 = -19867*log(W0/PA_0)*(sqrt((2*W0)/S*0.0023769))*((0.7436*CD0^(1/4))/((e*RA)^(3/4)))


% Início de um método numérico para encontrar a velocidade máxima
imax = 700;
%Existe um ruído na função PR devido a velocidades muito pequenas(decolagem) então devemos começar por i = 72 ft/s
for (i = 72:0.001:imax)

    PR2 = sqrt(2)*sqrt((0.5)^3*rho^2*S^2*i^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*i^4) + CD0)^2);

    if( abs(PR2/PA) >= 1)
        VMAX = i;
        break
    end
end

fprintf('DADOS PARA V = %1.4f ft/s,  E DENSIDADE RHO = %1.6f slug/ft^3 \n\n',V,rho);
fprintf('Potencia requerida (P_R) = %1.4f hp\n',PR);
fprintf('Maxima potencia requerida (P_A,MAX) = %1.4f hp\n',PA_max);
fprintf('Velocidade Maxima (V_max) = %1.4f ft/s\n',VMAX);
fprintf('Razao de Subida (R/C) = %1.4f ft/s\n', RC);
fprintf('Razao Maxima de Subida (R/C_max) %1.4f ft/s\n',RC_MAX);
fprintf('Angulo de Planeio Minimo (theta_min) = %1.6fgraus\n',TETA_MIN);
fprintf('Velocidade do Planeio (V_plane) = %1.4f ft/s\n',V_PLANEIO);
fprintf('Teto Absoluto (H) = %1.4f ft\n',TETO_ABSOLUTO);
fprintf('Autonomia (E) = %1.4f h\n',E/3600);
fprintf('Alcance (R) = %1.4f ft\n',R);
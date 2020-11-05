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

W = W0;

rho = 0.0023769;
h = 6.5;
CLMAX = 1.7;
%V = 50*(3.2808398950131);
g = 32.174;
T = 993;
mi =  0.4;
mi2 = 0.02;
CLMAX2 = 1.4;

%Distancia aproximada de pouso

VT = 1.3*sqrt((2*W)/(rho*S*CLMAX));
V = 0.7*VT;
D = 0.5*rho*(V^2)*S*CD0;
SL = (1.69*W^2)/(g*rho*S*CLMAX*(D + mi*W));

%-----------------------------------------
fprintf('\n');

%Distancia proxima de decolagem
%aqui ele usa um mi diferente, um V=57.862
bh = ((16*h)/b)^2;
phi = bh/(1 + bh);
VLO = 1.2*sqrt((2*W)/(rho*S*CLMAX2));
L = 0.5*rho*(V^2)*S*CLMAX2;
D2 = 0.5*rho*(V^2)*S*(CD0 + ((phi*(CLMAX2^2))/(pi*e*RA)));
SLO = (1.44*(W^2))/(g*rho*S*CLMAX2*(T-(D2 + mi2*(W-L))));

%VT = 1.3*sqrt((2*W)/(rho*S*CLMAX))

%k = (CD0 + (((CLMAX^2)*phi)/(pi*e*RA)))
%L = 0.5*rho*(V^2)*S*CLMAX
%D = 0.5*rho*(V^2)*S*CD0
%SLO = (1.44*(W^2))/(g*rho*S*CLMAX*(T-(D + mi*(W-L))))
fprintf('Dados para a distancia aproximada de decolagem:\n\n');
fprintf(' phi = %1.6f rad\n V_LO(velocidade de decolagem) = %1.4f ft/s\n L = %1.4f lb\n D = %1.4f lb\n S_LO(Distancia de decolagem) = %1.4f lb\n',phi,VLO,L,D2,SLO);
fprintf('\n');
fprintf('Dados para a distancia aproximada de pouso:\n\n');
fprintf(' VT = %1.4f ft/s\n D = %1.4f lb\n S_L(distancia de pouso) = %1.4f ft\n\n',VT,D,SL);


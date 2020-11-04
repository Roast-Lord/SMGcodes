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


rho = 0.0023769;
h = 6.5;
CLMAX = 1.4;
%V = 50*(3.2808398950131);
g = 32.174;
T = 3604;
mi =  0.02;


bh = ((16*h)/b)^2;
%Distancia proxima de decolagem
phi = bh/(1 + bh)
VLO = 1.2*sqrt((2*W)/(rho*S*CLMAX))
V = VLO;
L = 0.5*rho*(V^2)*S*CLMAX
D = 0.5*rho*(V^2)*S*(CD0 + (((CLMAX^2)*phi)/(pi*e*RA)))
SLO = (1.44*(W^2))/(g*rho*S*CLMAX*(T-(D + mi*(W-L))))

%Distancia aproximada de pouso

VT = 1.3*sqrt((2*W)/(rho*S*CLMAX))
D2 = 0.5*rho*(V^2)*S*CD0
SL = (1.69*W^2)/(g*rho*CLMAX*(D + mi*W))


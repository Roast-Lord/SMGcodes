S = 16.16; %área da asa
CD0 = 0.0317; 
W0 = 8355.8223; %peso liq do avião: peso aviao + galoes + passageiro + bagagem
W1 = 7286.338; % peso liq do aviao sem o combustivel: peso aviao + passageiro + bagagem
e = 0.747; % coeficiente de oswal
b = 10.97; % envergadura
RA = (b^2)/S; 
n = 0.8; % fator eficiencia da helice
PM = 111855; % potencia do motor
PA = n*PM; % potencia máxima do motor
c = 7.5749e-7;%consumo especifico de combustivel

rho = 1.225; %0.90926 1.225, densidade do ar.

V = 50; %velocidade do aviao

%Inicio do calculo dos coeficientes
CL = (W0/(0.5*rho*V^2*S))
CD = CD0 + ((CL^2)/(pi*e*RA))

VMAX = %velocidade máxima.

R = (n/c)*(CL/CD)*(log(W0/W1)) %alcance do avião
%desempenho do avião
E = (n/c)*(CL^(3/2)/CD)*sqrt(2*rho*S)*(W1^(-1/2) - W0^(-1/2))

%potencia requerida
PR = sqrt(2)*sqrt((0.5)^3*rho^2*S^2*V^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*V^4) + CD0)^2)

%potencia disponivel máxima
PA_max = (1/n)*(sqrt(2)*sqrt((0.5)^3*rho^2*S^2*V^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*V^4) + CD0)^2))



%Razão de subida
RC = (n*PM - sqrt(2)*sqrt((0.5)^3*rho^2*S^2*V^6*((W0^2)/(e*pi*(0.5)^2*RA*rho^2*S^2*V^4) + CD0)^2))/(W0)

  

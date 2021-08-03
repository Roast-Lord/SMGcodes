gama = 1.4;
mach = 0.7;
p = 2.0018*10^(4);
%p = 5.4048*10^(4);
rho_s = 1.225;%valor ao nível do mar padrão de rho
as = 340.29;%valor da velocidade do som ao nivel do mar
ps = 101325; %pressão atmosférica em pascal.



p0 = p*( ( ( (mach^2)*(gama -1))/(2) +1 )^( (gama)/(gama-1) ) ) 

mach = sqrt( (2/(gama-1))*( (p0/p)^( (gama-1)/(gama) ) -1) );

Vcal2 =  ( (2*(as^2))/(gama-1) )*( ( (p0-p)/(ps) + 1 )^( (gama-1)/(gama) ) -1 )
Vcal = sqrt(Vcal2)

Ve = sqrt( (2*(p0 -p))/(rho_s) )
import math

#Dados da aeronave.
S = 16.16 
CD0 = 0.0317 
W = 6109.54
W0 = 8355.8223 
W1 = 7286.338 
e = 0.747 
b = 10.97 
RA = (b**2)/S 
n = 0.8 
PM = 111855 
PA_0 = n*PM
W = W0
LD_MAX = math.sqrt(((math.pi)*e*RA)/(4*CD0)) 


def Densityair(h): #Função que calcula a densidade do ar dada uma altura "h".
    
    p0 = 101.325e3
    L = 0.0065
    R = 8.31447
    M = 0.0289644
    g = 9.80665
    T0 = 288.15
    T = T0 - L*h

    p = p0*((1 - ((L*h)/(T0)))**((g*M)/(R*L)))

    rho = (p*M)/(R*T)
    
    return rho

#Início do loop de print para os valores no intervalo de [ 18000 m , 24000 m ].
for height in range(18000,24000+1000,1000):
    RC_MAX = ((PA_0)/W) - 0.8776*math.sqrt((W/S)/((Densityair(height))*CD0))*(1/(LD_MAX**(3/2)))
    
    print("h = ",height,"(R/C)_max = {:.4f}".format(RC_MAX))
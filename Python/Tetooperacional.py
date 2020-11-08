import math
from SMG_py_functions import densityair

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

#Início do loop de print para os valores no intervalo de [ 18000 m , 24000 m ].
for height in range(18000,24000+1000,1000):
    RC_MAX = ((PA_0)/W) - 0.8776*math.sqrt((W/S)/((densityair(height))*CD0))*(1/(LD_MAX**(3/2)))
    
    print("h = ",height,"(R/C)_max = {:.1f}".format(RC_MAX))
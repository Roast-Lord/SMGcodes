import math
rho = 1.225
S = 16.16
CD0 = 0.0317
W = 6109.54
e = 0.747
b = 10.97
RA = (b**2)/S

n = 0.8

V = 80;

PA = (1/n)*((math.sqrt(2))*math.sqrt(((0.5)**3)*(rho**2)*(S**2)*(V**6)*((W**2)/(e*(math.pi)*((0.5)**2)*RA*(rho**2)*(S**2)*(V**4)) + CD0)**2))


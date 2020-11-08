import numpy as np
import math
import sympy as sp
from SMG_PythonTeX_functions import printm
from fractions import Fraction
from decimal import Decimal

x = sp.symbols('x')
y = sp.symbols('y')
z = sp.symbols('z')
k1,k2,k3,k4,k5,k6,k7,k8,k9 = sp.symbols('k_1 k_2 k_3 k_4 k_5 k_6 k_7 k_8 k_9')
myMatrix = np.array([[x],[y],[z]]) 

myMatrix2 = np.array([[k1,k2,k3],[k4,k5,k6],[k7,k8,k9]])

J = myMatrix2*myMatrix

matrix = np.array([[3.1415,15,0.5],[76,0.75,40],[0.1,12,0.4]])

printm(matrix,t = '')




            



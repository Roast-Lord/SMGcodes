# Ideias de Funções:
# Função que imprime matrizes(i.e. matrizes identidade, matrizes dos coeficientes e matrizes das variáveis todas formatadas em LaTeX).
# Função que imprime tabelas de valores de uma função, lista e etc.
# Função modular que plota gráfico no Tikz.
import numpy as np
import sympy as sp
import math
from fractions import Fraction

def newterm(j,size):
    if (j < size[1]-1):
        print(end=r"& ")

def printm(M, k='rat', T='b'):
    size = M.shape
    matrix_style = '{' + T + 'matrix' + '}'
    print(end=r"\begin")
    print(matrix_style)
    for i in range(0, size[0]):
        for j in range(0, size[1]):
            if (k == 'rat'):
                print(Fraction(M[i, j]).limit_denominator(), end=" ")
                newterm(j,size)
            else:
                if((float(M[i,j]) - int(M[i,j])) > 0):
                    print(float("{:.{casas}f}".format(M[i, j], casas=k)), end=" ")
                    newterm(j,size)
                else:
                    print(int(M[i,j]),end=" ")
                    newterm(j,size)
        print(r"\\")

    print(end=r"\end")
    print(matrix_style)
# -----------------------------------------------------

# Ideias de Funções:
# Função que imprime matrizes(i.e. matrizes identidade, matrizes dos coeficientes e matrizes das variáveis todas formatadas em LateX).
# Função que imprime tabelas de valores de uma função, lista e etc.
# Função modular que plota gráfico no tikz.
import numpy as np
import sympy as sp
import math
from fractions import Fraction


def newterm(j,size):
    #This is an auxiliar function that chooses whether or not to print '&' after a new term of the matrix.
    if (j < size[1]-1):
        print(end=r"& ")
#---------------------------------------------------------------------------------------------------------

def printm(m, k='4', t='b'):
    #This function only needs 1 argument 'm' which is the matrix that is going to be printed.
    #The opcional arguments 'k' and 't' are respectively: the decimal precision of the numbers printed in the matrix and the style of the LaTeX matrix.
    #The number of decimal precision is a positive integer number {0,1,2,3...}. If k is set as k = 'rat', the function will print decimal numbers in an approximate rational form (e.g. 0.5 -> 1/2 ).
    #The style 't' can be: '' for plain matrix, 'b' for square brackets matrix, 'B' for curly brackets matrix, 'v' for pipes matrix, 'V' for double pipes matrix and 'small' for small matrix.
    #By default if 'k' and 't' are not speciefied, the matrix 'm' is going to be printed with 4 decimal precision and square brackets matrix style.
    size = m.shape
    matrix_style = '{' + t + 'matrix' + '}'
    
    print(end=r"\begin")
    print(matrix_style)
    for i in range(0, size[0]):
        for j in range(0, size[1]):
            if (k == 'rat'):
                print(Fraction(m[i, j]).limit_denominator(), end=" ")
                newterm(j,size)
            else:
                if((float(m[i,j]) - int(m[i,j])) > 0):
                    print(float("{:.{precision}f}".format(m[i, j], precision=k)), end=" ")
                    newterm(j,size)
                else:
                    print(int(m[i,j]),end=" ")
                    newterm(j,size)
        print(r"\\")

    print(end=r"\end")
    print(matrix_style)
# -----------------------------------------------------


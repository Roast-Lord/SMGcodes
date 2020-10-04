pa = 80000
pb = 200000

float(pa)
float(pb)

ano = 0
float (ano)
populacao_a = 80000
populacao_b = 200000
float(populacao_a)
float(populacao_b)
while (populacao_a <= populacao_b ):
    populacao_a = pa*((1.03)**ano)
    populacao_b = pb*((1.015)**ano)
    ano = ano+0.01

print("a populacao A levara aproximadamente",ano, "anos para ter a mesma populacao que B")
def densityair(h): #Função que calcula a densidade do ar dada uma altura "h".
    
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
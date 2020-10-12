cont200=0
cont100=0
cont50=0
cont20=0
cont10=0
cont5=0
cont2=0
cont1=0
cont05=0
cont025=0
cont010=0
cont005=0
cont001=0

valor=float(input("Informe uma quantia"))

if(valor>=200):
    while(valor>=200):
        valor= valor-200
        cont200= cont200+1
     
if(valor>=100):
    while(valor>=100):
        valor = valor-100
        cont100= cont100+1
        
       
if(valor>=50):
    while(valor>=50):
        valor = valor-50
        cont50= cont50+1
        
        
if(valor>=20):
    while(valor>=20):
        valor = valor-20
        cont20= cont20+1
        
         
if(valor>=10):
    while(valor>=10):
        valor = valor-10
        cont10= cont10+1
        
       
if(valor>=5):
    while(valor>=5):
        valor = valor-5
        cont5= cont5+1
        
         
if(valor>=2):
    while(valor>=2):
        valor = valor-2
        cont2= cont2+1
        
    
if(valor>=1.00):
    while(valor>=1.00):
        valor = valor-1.00
        cont1= cont1+1
        
       
if(valor>=0.50):
    while(valor>=0.50):
        valor = valor-0.50
        cont05= cont05+1
        
       
if(valor>=0.25):
    while(valor>=0.25):
        valor = valor-0.25
        cont025= cont025+1
        
        
if(valor>=0.10):
    while(valor>=0.10):
        valor = valor-0.10
        cont010= cont010+1
        
       
if(valor>=0.05):
    while(valor>=0.05):
        valor = valor-0.05
        cont005= cont005+1
        
      
if(valor>=0.01):
    while(valor>=0):
        valor = valor-0.01
        cont001= cont001+1
        
print(cont200, "nota(s) de R$ 200,00")
print(cont100, "nota(s) de R$ 100,00")
print(cont50, "nota(s) de R$ 50,00")
print(cont20, "nota(s) de R$ 20,00")
print(cont10, "nota(s) de R$ 10,00")
print(cont5, "nota(s) de R$ 5,00")
print(cont2, "nota(s) de R$ 2,00")
print(cont1, "moeda(s) de R$ 1,00")
print(cont05, "moeda(s) de R$ 0,50")
print(cont025, "moeda(s) de R$ 0,25")
print(cont010, "moeda(s) de R$ 0,10")
print(cont005, "moeda(s) de R$ 0,05")
print(cont001, "moeda(s) de R$ 0,01")  
       
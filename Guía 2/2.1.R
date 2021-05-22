# Objetivo: Establecer las cantidades de metales A, B, C y D que debe tener la
# aleación para que cumpla con los parámetros requeridos al menor costo posible

# Xi: proporción del metal i en la aleación (cm3 de i/ cm3 totales)
# DENi: Densidad del metal i

# Funcional: Z ($/Kg) = Xa * 2 + Xb * 2.5 + Xc * 1.5 + Xd * 2 -> MIN
# Sujeto a:   Xa    + Xb      + Xc      + Xd      =  1
#  RDEN     Xa*6500 + Xb*5800 + Xc*6200 + Xd*5900 >= 5950
#  RDEN     Xa*6500 + Xb*5800 + Xc*6200 + Xd*5900 <= 6050
#  RCAR     Xa*0.2  + Xb*0.35 + Xc*0.15 + Xd*0.11 >= 0.1
#  RCAR     Xa*0.2  + Xb*0.35 + Xc*0.15 + Xd*0.11 <= 0.3
#  RFOS     Xa*0.05 + Xb*0.015 +Xc*0.065 +Xd*0.1 >= 0.045    
#  RFOS     Xa*0.05 + Xb*0.015 +Xc*0.065 +Xd*0.1 <= 0.055    

#Utilizo la librería lpSolve
library(lpSolve)

#Armo un vector con los coeficientes del funcional
funcional <- c(2, 2.5, 1.5, 2)

#Armo una matriz con las restricciones


A <- matrix(c(  1,     1,    1,     1,
             6500,  5800,  6200, 5900,
             6500,  5800,  6200, 5900,
              0.2,  0.35,  0.15, 0.11,
              0.2,  0.35,  0.15, 0.11,
             0.05, 0.015, 0.065, 0.1,
             0.05, 0.015, 0.065, 0.1), ncol=4, byrow = T)

#Defino el vector soluciones de la matriz de restricciones
b <- c(1, 5950, 6050, 0.1, 0.3, 0.045, 0.055)
dir <- c('=', '>=', '<=', '>=', '<=', '>=', '<=')
# Solucion
solucion <- lp('min', funcional, A, dir, b)
Z <- solucion$objval
Xa<- solucion$solution [1]
Xb<- solucion$solution [2]
Xc<- solucion$solution [3]
Xd<- solucion$solution [4]

#Imprimo resultados
paste0('costo del Kg de aleación =', Z)
paste0('proporción de A=', Xa)
paste0('proporción de B=', Xb)
paste0('proporción de C=', Xc)
paste0('proporción de D=', Xd)
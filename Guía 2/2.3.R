# Defino Variables

# Pi: cantidad de píldoras i (i=1,2,3,4,5,6,7)
# Vj: cantidad de vitamina j (j=1,2,3)
# Vji: cantidad de vitamina j en pildora i

# funcional: MIN -> Z= P1*c1+P2*c2+P3*c3+P4*c4+P5*c5+P6*c6+P7*c7
# sujeto a:
# REQ_V1      5*P1 + 2*P3 + 3*P5 + P6 + 2*P7 = 100
# REQ_V2      3*P1 + P2 + 5*P3 + 2*P5 + 6*P7 = 80
# REQMIN_V3   P1 + 3*P3 + P4 + 2*P5 + 6*P7  >= 120
# REQMAX_V3   P1 + 3*P3 + P4 + 2*P5 + 6*P7  <= 160


# Ingreso los costos
c1 <- 4
c2 <- 1
c3 <- 5
c4 <- 0.6
c5 <- 3.5
c6 <- 0.7
c7 <- 4

#Utilizo la librería lpSolve
library(lpSolve)

#Armo un vector con los coeficientes del funcional
Z <- c(c1,c2,c3,c4,c5,c6,c7)

#Armo una matriz con las restricciones

A <- matrix(c(5,0,2,0,3,1,2,
              3,1,5,0,2,0,1,
              1,0,3,1,2,0,6,
              1,0,3,1,2,0,6), ncol = 7, byrow = T)

#Defino el vector soluciones de la matriz de restricciones
RHS <- c(100,80,120,160)

#Defino las restricciones
RESTR <- c('=','=','>=','<=')

#Solucion
solucion <- lp('min', Z, A, RESTR, RHS)

#Imprimo resultados
Z <- solucion$objval
P1 <- solucion$solution[1]
P2 <- solucion$solution[2]
P3 <- solucion$solution[3]
P4 <- solucion$solution[4]
P5 <- solucion$solution[5]
P6 <- solucion$solution[6]
P7 <- solucion$solution[7]
paste0("El costo total es =", Z)
paste0("La cantidad de pildoras 1 es =", P1)
paste0("La cantidad de pildoras 2 es =", P2)
paste0("La cantidad de pildoras 3 es =", P3)
paste0("La cantidad de pildoras 4 es =", P4)
paste0("La cantidad de pildoras 5 es =", P5)
paste0("La cantidad de pildoras 6 es =", P6)
paste0("La cantidad de pildoras 7 es =", P7)

#Defino variables
# Xij: cantidad de pulovers i en máquina j.

#Utilizo la librería lpSolve
library(lpSolve)

#Armo un vector con los coeficientes del funcional
Z <- c(1000,1500,1500,1800)

#Armo una matriz con las restricciones

A <- matrix(c(5,6,0,0,
              0,0,4,4,
              1.6,0,0,1.2,
              0,1.8,1.8,0,
              0,1,1,0), ncol = 4, byrow = T)

#Defino el vector soluciones de la matriz de restricciones
RHS <- c(80,80,20,36,10)

#Defino las restricciones
RESTR <- c('<=','<=','<=','<=','>=')

#Solucion
solucion <- lp('max', Z, A, RESTR, RHS)

#Imprimo resultados
Z <- solucion$objval
A <- solucion$solution[1]
B <- solucion$solution[2]+solucion$solution[3]
C <- solucion$solution[4]
paste0("El beneficio total es =", Z)
paste0("La cantidad a producir de puloveres A es =", A)
paste0("La cantidad a producir de puloveres B es =", B)
paste0("La cantidad a producir de puloveres C es =", C)


#Vector solucion
print(solucion$solution)
print(solucion$objval)
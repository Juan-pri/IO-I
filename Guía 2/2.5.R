#Utilizo la librería lpSolve
library(lpSolve)

#Armo un vector con los coeficientes del funcional
Z <- c(500,600,1200,1000,800,750,1800,800)

#Armo una matriz con las restricciones

A <- matrix(c(0.05,0.05,0.05,0.05,0,0,0,0,
              0.1,0.12,0.14,0.18,0,0,0,0,
              0.2,0.25,0.3,0.25,0,0,0,0,
              0.08,0.1,0.06,0.1,0,0,0,0,
              1/45,1/30,1/30,1/30,3/80,1/16,0.05,0.05,
              1,0,0,0,1,0,0,0,
              0,1,0,0,0,1,0,0,
              0,0,1,0,0,0,1,0,
              0,0,0,1,0,0,0,1), ncol = 8, byrow = T)

#Defino el vector soluciones de la matriz de restricciones
RHS <- c(1200,3600,5000,3000,3000,4000,3000,8000,5000)

#Defino las restricciones
RESTR <- c('<=','<=','<=','<=','<=','=','=','=','=')

#Solucion
solucion <- lp('min', Z, A, RESTR, RHS)

#Imprimo resultados
Z <- solucion$objval
A <- solucion$solution[1]
B <- solucion$solution[2]
C <- solucion$solution[3]
D <- solucion$solution[4]
AC <- solucion$solution[5]
BC <- solucion$solution[6]
CC <- solucion$solution[7]
DC <- solucion$solution[8]
paste0("El costo total es =", Z)
paste0("La cantidad a producir de tableros A es =", A)
paste0("La cantidad a producir de tableros B es =", B)
paste0("La cantidad a producir de tableros C es =", C)
paste0("La cantidad a producir de tableros D es =", D)
paste0("La cantidad a comprarr de tableros A es =", AC)
paste0("La cantidad a comprarr de tableros B es =", BC)
paste0("La cantidad a comprarr de tableros C es =", CC)
paste0("La cantidad a comprarr de tableros D es =", DC)

#Vector solucion
print(solucion$solution)
print(solucion$objval)
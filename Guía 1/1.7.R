# Xa: cantidad de automóviles a producir
# Xc: cantidad de camiones a producir

# Estampado: 40000 camiones/25000 automóviles = 1.6 camiones/automóviles
# Montaje de motores: 16667 camiones/33333 automóviles= 0.5 camiones/automóviles

# funcional: 15000*Xa + 12500*Xc -> MAX
# sujeto a:  1.6*Xa + Xc <= 40000
#            0.5*Xa + Xc <= 16667
#               Xa       <= 22500
#                     Xc <= 15000
#               -Xa      <= -12000
#                    -Xc <= -8000
#               Xa       <= 18000

library(lpSolve)

coef <- c(15000, 12500)
A <- matrix(c(1.6, 0.5, 1, 0, -1, 0, 1, 1,1,0,1,0,-1,0), ncol=2)
b <- c(40000, 16667, 22500, 15000, -12000, -8000, 18000)
dir <- rep('<=', 7)
# Solucion
solucion <- lp('max', coef, A, dir, b)
solucion$objval
solucion$solution


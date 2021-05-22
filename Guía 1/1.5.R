# Xa: cantidad a producir de A
# Xb: cantidad a producir de B

#funcional: 12*Xa + 8*Xb -> MAX
#sujeto a:  Xa + 0.4*Xb <= 200
#           0.5*Xa      <= 200
#           -Xa         <= -50
#           4*Xa - Xb   <= 0
# Xa, Xb > 0

library(lpSolve)

coef <- c(12, 8)
A <- matrix(c(1, 0.5, -1, 4, 0.4, 0, 0, -1), ncol=2)
b <- c(200, 200, -50, 0)
dir <- rep('<=', 4)
# Solucion
solucion <- lp('max', coef, A, dir, b, all.int = T)
solucion$objval
solucion$solution

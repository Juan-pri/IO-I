# Xa: Gr de Alux
# Xd: Gr de Dulax
# Alux: 1 g tiene -> 2 Lumenes y 3 Luxes
# Dulax: 1 g tiene 4 Lumenes

#funcional: 0.450*Xa + 0.120*Xd -> MIN
#sujeto a:  2*Xa + 4*Xd >= 300
#           3*Xa >= 150
# Xa, Xd > 0

library(lpSolve)

coef <- c(0.450, 0.120)
A <- matrix(c(2, 3, 4, 0), ncol=2)
b <- c(300, 150)
dir <- rep('>=', 2)
# Solucion
solucion <- lp('min', coef, A, dir, b)
solucion$objval
solucion$solution

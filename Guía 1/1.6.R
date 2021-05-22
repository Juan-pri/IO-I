# Xm : Kg de alimento M
# Xn : Kg de alimento N
#funcional: 10*Xm + 4*Xn -> MIN
#sujeto a:  0.1*Xm          >= 0.4
#                    0.1*Xn >= 0.6
#           0.1*Xm + 0.2*Xn >= 2
#           0.2*Xm + 0.1*Xn >= 1.7
# Xm, Xn > 0

library(lpSolve)

coef <- c(10, 4)
A <- matrix(c(0.1, 0, 0.1, 0.2, 0, 0.1, 0.2, 0.1), ncol=2)
b <- c(0.4, 0.6, 2, 1.7)
dir <- rep('>=', 4)
# Solucion
solucion <- lp('min', coef, A, dir, b)
solucion$objval
solucion$solution
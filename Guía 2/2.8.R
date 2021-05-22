# Defino Variables:

# Ci: manteles comprados el día i.
# LCi: manteles con lavado común el día i.
# LRi: manteles con lavado rápido el día i.

# FUNCIONAL: MIN -> Z=250*C1+250*C2+250*C3+250*C4+250*C5+250*C6+250*7+100*LC1+100*LC2+100*LC3+100*LC4+150*LR1+150*LR2+150*LR3+150*LR4

# Restricciones

# DIA1     C1         = 5

# DIA2     C2         = 6

# DIA3  C3+LR1        = 7
#         LR1        <= 5

# DIA4  C4+LR2+LC1    = 8       # DIA6  C6+LC3+LR4  = 9
#       LC1+LR1      <= 5               LC3+LR3    <= 7
#         LR2        <= 6                 LR4      <= 8

# DIA5  C5+LC2+LR3    = 7       # DIA7  C7+LC4+LR5  = 10
#       LC2+LR2      <= 6               LC4+LR4    <= 8
#         LR3        <= 7                 LR5      <= 7

#Utilizo la librería lpSolve
library(lpSolve)

#funcional
Z <- c(250,250,250,250,250,250,250,100,100,100,100,150,150,150,150,150)

#Armo una matriz con las restricciones

A <- read.csv("Matriz ej 2.8.csv")

#Defino el vector soluciones de la matriz de restricciones

signs <- c('=','=','=','<=','=','<=','<=','=','<=','<=','=','<=','<=','=','<=','<=')
RHS <- c(5,6,7,5,8,5,6,7,6,7,9,7,8,10,8,7)

# Solucion
solucion <- lp('min', Z, A, signs, RHS)

solucion
solucion$solution
# Defino Variables:

# Xij: toneladas de carga i en compartimiento j.
# i=1,2,3,4.  j=D,C,T

# FUNCIONAL: MAX -> Z=320*(X1D+X1C+X1T) + 400*(X2D+X2C+X2T) + 360*(X3D+X3C+X3T) + 290*(X4D+X4C+X4T)

# Restricciones de capacidad _C_ = (P)Peso/(V)Volumen (C)compartimento ubicación (D(delantero),C(central),T(trasero))
# PCD  X1D+X2D+X3D+X4D                 <= 12
# VCD  500*X1D+700*X2D+600*X3D+400*X4D <= 7000

# PCC  X1C+X2C+X3C+X4C                 <= 18
# VCC  500*X1C+700*X2C+600*X3C+400*X4C <= 9000

# PCT  X1T+X2T+X3T+X4T                 <= 10
# VCT  500*X1T+700*X2T+600*X3T+400*X4T <= 5000

# Restricciones de disponibilidad, cargas 1,2,3,4
# BAL_C1  X1D+X1C+X1T   <= 20
# BAL_C3  X2D+X2C+X2T   <= 16
# BAL_C3  X3D+X3C+X3T   <= 25
# BAL_C4  X4D+X4C+X4T   <= 13

# Restricciones de equilibrio del avión, EQ_CX (X=C(central),D(delantero),T(trasero))
# EQ_CD   0.7*X1D-0.3*X1C-0.3X1T+0.7*X2D-0.3*X2C-0.3*X2T+0.7*X3D-0.3*X3C-0.3*X3T+0.7*X4D-0.3*X4C-0.3*X4T = 0
# EQ_CC  -0.45*X1D+0.55*X1C-0.45*X1T-0.45*X2D+0.55*X2C-0.45*X2T-0.45*X3D+0.55*X3C-0.45*X3T-0.45*X4D+0.55*X4C-0.45*X4T = 0
# EQ_CT  -0.25*X1D-0.25*X1C+0.75*X1T-0.25*X2D-0.25*X2C+0.75*X2T-0.25*X3D-0.25*X3C+0.75*X3T-0.25*X4D-0.25*X4C+0.75*X4T = 0

#Utilizo la librería lpSolve
library(lpSolve)

#funcional
Z <- c(320,320,320,400,400,400,360,360,360,290,290,290)

#Armo una matriz con las restricciones

A <- read.csv("Matriz Ej 2.9.csv")

#Defino el vector soluciones de la matriz de restricciones

signs <- c('<=','<=','<=','<=','<=','<=','<=','<=','<=','<=','=','=','=')
RHS <- c(12,7000,18,9000,10,5000,20,16,25,13,0,0,0)

# Solucion
solucion <- lp('max', Z, A, signs, RHS)

solucion
solucion$solution
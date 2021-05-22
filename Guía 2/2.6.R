# Defino variables:

# Fi: tn producidas por la fábrica i.
# Aj: tn entregadas al almacen j.
# Xij: tn enviadas de la fábrica i al almacen j.

#RESTRICCIONES

#Balance fábricas                                       Capacidad fábricas
#BAL_F1   F1-X1a-X1b-X1c-X1d    = 0                     CAP_F1      F1    <= 140
#BAL_F2   F2-X2a-X2b-X2c-X2d    = 0                     CAP_F2      F2    <= 260
#BAL_F3   F3-X3a-X3b-X3c-X3d    = 0                     CAP_F3      F3    <= 360
#BAL_F4   F4-X4a-X4b-X4c-X4d    = 0                     CAP_F4      F4    <= 220

#Balance almacenes                 
#BAL_Aa   X1a+X2a+X3a+X4a    = 180
#BAL_Ab   X1b+X2b+X3b+X4b    = 280
#BAL_Ac   X1c+X2c+X3c+X4c    = 150
#BAL_Ad   X1d+X2d+X3d+X4d    = 200

#funcional
# 60*F1+72*F2+48*F3+60*F4+
# 28*X1a+40*X1b+36*X1c+38*X1d
# 18*X2a+28*X2b+24*X2c+30*X2d
# 42*X3a+54*X3b+52*X3c+54*X3d
# 36*X4a+48*X4b+40*X4c+46*X4d

#RESOLUCION

#Utilizo la librería lpSolve
library(lpSolve)

#Armo un vector con los coeficientes del funcional
funcional <- c(60,72,48,60,28,40,36,38,18,28,24,30,42,54,52,54,36,48,40,46)

#Armo una matriz con las restricciones

A <- matrix(c(1,0,0,0,-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,
              0,1,0,0,0,0,0,0,-1,-1,-1,-1,0,0,0,0,0,0,0,0,
              0,0,1,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,0,0,0,0,
              0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,
              1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
              0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
              0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
              0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
              0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
              0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,
              0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
              0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), ncol=20, byrow = T)

#Defino el vector soluciones de la matriz de restricciones
RHS <- c(0,0,0,0,140,260,360,220,180,280,150,200)
dir <- c('=','=','=','=','<=','<=','<=','<=','=','=','=','=')
# Solucion
solucion <- lp('min', funcional, A, dir, RHS)
solucion
solucion$solution

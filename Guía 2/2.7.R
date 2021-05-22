# Defino Variables:

# A1: litros de A con método 1.
# A2: litros de A con método 2.
# B: litros de B.

# Restricciones

# DISPONIBILIDAD

# DISP_C1     A1*1/270 + A2*1/270 + B*1/450       <= 16
# DISP_C2     A1*299/54720 + A2*1/427.5           <= 12
# DISP_C3       B*1/408 + A2*1/262.5              <= 12
# DISP_C4     A1*1/212.5 + A2*1/212.5 + B*1/320   <= 16

#REQUERIMIENTOS

# REQMIN_A   A1 + A2    >= 600  
# REQMAX_A   A1 + A2    <= 1750
# REQ_B     B           <= 1500
# LIM_DESP  A1 + A2 + B <= 2500


#Utilizo la librería lpSolve
library(lpSolve)

#funcional
Z <- c(-15.58, -18.23, 99.71)

#Armo una matriz con las restricciones

A <- matrix(c(1/270,1/270,1/450,
              0,1/427.5, 299/54720,
              0,1/262.5, 1/408,
              1/212.5, 1/212.5, 1/320,
              1, 1, 0,
              1, 1, 0, 
              0, 1, 0, 
              1, 1, 1), ncol = 3, byrow = T)

#Defino el vector soluciones de la matriz de restricciones

signs <- c('<=','<=','<=','<=','<=','<=','>=','<=')
RHS <- c(16,12,12,16,1750,1500,600,2500)

# Solucion
solucion <- lp('max', Z, A, signs, RHS)

solucion
solucion$solution
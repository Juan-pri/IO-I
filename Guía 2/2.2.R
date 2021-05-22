# Defino variables:

# E: litros de whisky Escocés producido.
# K: litros de whisky Kilt producido.
# t: litros de whisky Tartan producido.
# Xij: litros del licor i en el whisky j.
# i=A,B,C y j=E,K,T



# funcional: MAX -> Z = pe*E + pk*K + pt*t - pa*Xae - pa*Xak - pa*Xat - pb*Xbe - pb*Xbk - pb*Xbt - pc*Xce - pc*Xck - pc*Xct
# sujeto a:
# BALANCE E    E - Xae - Xbe - Xce      = 0
# BALANCE K    K - Xak - Xbk - Xck      = 0
# BALANCE t    t - Xat - Xbt - Xct      = 0
# AE_MIN          Xae - 0.6*E          >= 0
# CE_MAX          Xce - 0.2*E          <= 0
# AK_MIN          Xak - 0.15*K         >= 0
# CK_MAX          Xck - 0.6*K          <= 0
# CT_MAX          Xct - 0.5*t          <= 0
# DISP A          Xae + Xak + Xat      <= 2000
# DISP B          Xbe + Xbk + Xbt      <= 2500
# DISP C          Xce + Xck + Xct      <= 1200

#Ingreso datos del ejercicio
pa <- 7
pb <- 5
pc <- 4
pe <- 6.8
pk <- 5.7
pt <- 4.5

#Utilizo la librería lpSolve
library(lpSolve)

#Armo un vector con los coeficientes del funcional
funcional <- c(pe, pk, pt, -pa, -pa, -pa, -pb, -pb, -pb, -pc, -pc, -pc)

#Armo una matriz con las restricciones

#                 E ,  K,    T,Xae,Xak,Xat,Xbe,Xbk,Xbt,Xce,Xck,Xct
A <- matrix(c(    1,    0,   0, -1,  0,  0, -1,  0,  0, -1, 0, 0,
                  0,    1,   0,  0, -1,  0,  0, -1,  0,  0,-1, 0,
                  0,    0,   1,  0,  0, -1,  0,  0, -1,  0, 0,-1,
               -0.6,    0,   0,  1,  0,  0,  0,  0,  0,  0, 0, 0,
               -0.2,    0,   0,  0,  0,  0,  0,  0,  0,  1, 0, 0,
                  0,-0.15,   0,  0,  1,  0,  0,  0,  0,  0, 0, 0, 
                  0, -0.6,   0,  0,  0,  0,  0,  0,  0,  0, 1, 0,
                  0,    0,-0.5,  0,  0,  0,  0,  0,  0,  0, 0, 1,
                  0,    0,   0,  1,  1,  1,  0,  0,  0,  0, 0, 0,
                  0,    0,   0,  0,  0,  0,  1,  1,  1,  0, 0, 0,
                  0,    0,   0,  0,  0,  0,  0,  0,  0,  1, 1, 1), ncol=12, byrow = T)

#Defino el vector soluciones de la matriz de restricciones
RHS <- c(0,0,0,0,0,0,0,0,2000,2500,1200)
dir <- c('=', '=', '=', '>=', '<=', '>=', '<=', '<=', '<=', '<=', '<=')
# Solucion
solucion <- lp('max', objective.in = funcional, const.mat = A, const.dir = dir, const.rhs = RHS)
Z<- solucion$objval
E<- solucion$solution [1]
K<- solucion$solution [2]
t<- solucion$solution [3]
Xae<- solucion$solution [4]
Xak<- solucion$solution [5]
Xat<- solucion$solution [6]
Xbe<- solucion$solution [7]
Xbk<- solucion$solution [8]
Xbt<- solucion$solution [9]
Xce<- solucion$solution [10]
Xck<- solucion$solution [11]
Xct<- solucion$solution [12]

# Imprimo resultados
paste0('beneficio máximo =', Z)
paste0('cantidad de whisky Escocés =', E)
paste0('cantidad de whisky Kilt =', K)
paste0('cantidad de whisky Tartan =', t)
paste0('cantidad de licor A requerido =', Xae+Xak+Xat)
paste0('cantidad de licor B requerido =', Xbe+Xbk+Xbt)
paste0('cantidad de licor C requerido =', Xce+Xck+Xct)
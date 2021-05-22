#Defino las variables del problema
#Xij:  pieza fabricada en i (con i = 1, 2, 3, 4) enviada al depósito j (con j = A, B, C, D) [u]
#Defino el funcional o función objetivo que estoy buscando minimizar
#[MIN] Z= 60.X1 + 72.X2 + 48.X3 + 70.X4 + 28.X1A  + 40.X1B + 36.X1C + 38.X1D + 18.X2A  + 28.X2B + 24.X2C + 30.X4D + 42.X3A  + 54.X3B + 52.X3C + 54.X4D + 36.X4A  + 48.X4B + 40.X3C + 46.X4D
z<-c(60,72,48,70,28,40,36,38,18,28,24,30,42,54,52,54,36,48,40,46)
#Sujeto a:
#Restricciones de balance
#-X1 +.X1A  + X1B + X1C + X1D = 0 
#-X2 +.X2A  + X2B + X2C + X3D = 0 
#-X3 +.X3A  + X3B + X3C + X3D = 0 
#-X4 +.X4A  + X4B + X4C + X4D = 0 
#Restricciones de disponibilidad
#X1A  + X1B + X1C + X1D ≤ 140
#X2B  + X2B + X2C + X2D ≤  260 
#X3A  + X3B + X3C + X4C ≤  360 
#X4A  + X4B + X4C + X4D ≤  220 
#Restricciones de requerimientos
#X1A  + X2A + X3A + X4A = 180
#X1B  + X2B + X3B + X4B = 280 
#X1C  + X2C + X3C + X4C =  150 
#X1D  + X2D + X3D + X4D = 200
#Armo la matriz de coeficientes tecnológicos A
A<-read_csv("~/Documents/FIUBA/IO/Tabla2.6.csv")
#Defino el vector de términos independientes
b<-c(0,0,0,0,140,260,360,220,180,280,150,200)
dir<-c("=","=","=","=","<=","<=","<=","<=","=","=","=","=")
library(linprog)
library(lpSolve)
lp("min",z,A,dir,b)
lp("min",z,A,dir,b)$solution

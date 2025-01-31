library(lpSolve)

# Cargo la matriz de costos (Fabricaci�n + Transporte) 
cost.mat <- matrix(nrow=4,ncol=4)
cost.mat[1,] <- c(88,100,96,98)
cost.mat[2,] <- c(90,100,96,102)
cost.mat[3,] <- c(90,102,100,102)
cost.mat[4,] <- c(96,108,100,106)

cost.mat

# Problema de minimizaci�n
direction = "min"

# Cargo las capacidades de las f�bricas
row.signs <- rep("<=",4)
row.rhs <- c(140,260,360,220)

# Cargo las demandas a satisfacer
col.signs <- rep(">=",4)
col.rhs <- c(180,280,150,200)

# Soluci�n
solution <- lp.transport(cost.mat = cost.mat,
                         direction = direction,
                         row.signs = row.signs,
                         row.rhs = row.rhs,
                         col.signs = col.signs,
                         col.rhs = col.rhs)

solution

solution$solution

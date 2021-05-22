#### VECTORES
# intro a estructuras de datos

dbl_vec <- c(1, 2.5, 4.5)
dbl_vec
dbl_vec[1]

vect <- 100:110
vect[c(1,3)]
vect[7:10]

1:10 # 


int_vec <- c(1L, 6L, 10L)
log_vec <- c(TRUE, FALSE, T, F)
chr_vec <- c("esto", "es", "un", "texto")

# Coerción
vec1 <- c(1, 2, 3.7, "a")
vec1
vec2 <- c(1, 2, 3.7, FALSE, TRUE)
vec2

# Funciones utiles para vectores
str(chr_vec)
length(chr_vec)
table(c("a", "a", "a", "a", "b", "b", "c", "e", "c"))

# Modificacion de vectores
vec2
vec2[2] <- 999
vec2
vec2[4] <- "s"
vec2
vec3 <- c(-1, vec2, c(2,3))
vec3

# Generación de secuencias
1:10
c(1:10, 20:30)
rep(1:4, 2)
rep(1:4, each = 2)       # not the same.
rep(1:4, times = c(2,1,2,1))
rep(1:4, each = 2, len = 4)    # first 4 only.
rep(1:4, each = 2, len = 10)   # 8 integers plus two recycled 1's.
rep(1:4, each = 2, times = 3)  # length 24, 3 complete replications




#### MATRICES
 
a <- matrix(1:6, ncol = 3, nrow = 2)
a
b <- array(1:12, c(2, 3, 2))
b

# Funciones útiles
str(a)
length(a)
nrow(a)
ncol(a)
dim(a)
t(a)                # Transpuesta
c <- a %*% t(a)     # Producto
c
solve(c)   # Inversa
rownames(a)
colnames(a)
rownames(a) <- c("A", "B")
colnames(a) <- c("a", "b", "c")
a

# Modificación de la dimensión del array
c <- 1:6
dim(c) <- c(3, 2)
c

dim(c) <- c(2, 3)
c



#### FACTORES

x <- c("a", "b", "b", "a")
x
str(x)
x1 <- factor(x)
x1
str(x1)

x[2] <- "c"
x
x1[2] <- "c"
x1

sex_char <- c("m", "m", "m")
sex_factor <- factor(sex_char, levels = c("m", "f"))

table(sex_char)
table(sex_factor)




#### Data.frames

df <- data.frame(x = 1:3, y = c("a", "b", "c"))
df
str(df)

df <- data.frame(
  x = 1:3,
  y = c("a", "b", "c"),
  stringsAsFactors = FALSE)
str(df)

# Funciones útiles data.frames
head(df) 
tail(df)
dim(df)
nrow(df)
ncol(df)
names(df)
cbind(df, data.frame(z = 3:1))
rbind(df, data.frame(x = 10, y = "z"))

#### Listas

x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
str(x)
y <- c(list(1, 2), c("3", "4"))
str(y)

# Funciones útiles data.frames
length(x)

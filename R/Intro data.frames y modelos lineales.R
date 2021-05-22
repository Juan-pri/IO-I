library(readxl)
catalogos <- 
  read_excel("D:/acad/Cursos Dictados/CDD/R/Catalogos.xlsx")
View(catalogos)

str(catalogos)
head(catalogos)
tail(catalogos)

# Subsetting con índices
catalogos[1, ]
catalogos[1:2, ]
catalogos[, 1]
catalogos[, 1:2]
catalogos[1:2, 1:2]


# Subsetting con nombre de variables
names(catalogos)

catalogos[, "edad"]
catalogos["edad"]
catalogos[["edad"]]
catalogos$vive_barrio
catalogos[c("edad", "sexo")]

as.matrix(catalogos[c("Edad", "Sexo")])


# Subsetting con vector lógico
catalogos[1:347, ]
catalogos[rep(TRUE, 347), ]
catalogos[c(TRUE, TRUE), ]
catalogos$sexo == "Mujer"
catalogos[catalogos$sexo == "Mujer", 
          c("propietario", "casado")]
catalogos_Mujeres <- catalogos[catalogos$sexo == "Mujer",]
c(T, T) & c(T, F)
c(T, T) | c(T, F)
catalogos[catalogos$sexo == "Mujer" |
            catalogos$propietario == "No", ]


m <- lm(formula = monto ~ salario + cat_24m, 
        data = catalogos)
m
summary(m)
plot(m)
coefficients(m)
str(m$coefficients)
m$qr$qr
m[["qr"]][["qr"]]
model.matrix(m)

m1 <- lm(formula = log(monto) ~ salario + cat_24m, 
         data = catalogos)
plot(m1)
residuos <- m1$residuals
summary(residuos)
hist(residuos)

hist(catalogos$monto)
hist(log(catalogos$monto))

m2 <- lm(formula = log(monto) ~ salario + cat_24m +
           sexo, 
         data = catalogos)
mm <- model.matrix(m2)


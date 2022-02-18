# Importando o arquivo do exercÃ­cio 3
if(!("xlsx") %in% installed.packages()) install.packages("xlsx", type = "source") 
library(xlsx)
exercicio3 = read.xlsx("./dados/exercicio3.xlsx",encoding =  "UTF-8", sheetName = "Sheet1")
head(exercicio3)

# calculando a mediana
ex3.mediana = median(exercicio3$Familias)
print(paste("Mediana do numero de filhos:", ex3.mediana))

# calculando a moda

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

ex3.moda <- getmode(exercicio3$Familias)
print(paste("Moda do numero de filhos:", ex3.moda))

#grafico

plot(exercicio3$Numero.de.filhos, exercicio3$Familias)
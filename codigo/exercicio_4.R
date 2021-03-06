# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)

# Importando o arquivo do exercício 4
exercicio4 <- read_excel("./dados/exercicio4.xls")

sort (exercicio4$Salários)
range(exercicio4$Salários)
AT <- ceiling((max(exercicio4$Salários)- min(exercicio4$Salários)))
AT

k <- nclass.Sturges(exercicio4$Salários)
length(exercicio4$Salários)

k <- ceiling((sqrt(length(exercicio4$Salários))))
k

h <- ceiling(AT/k)
h

infclass <- min(exercicio4$Salários)
supclass <- infclass+(k*h)

brk <-seq(infclass,supclass,h)
tabelaDF_salarios<-table(cut(exercicio4$Salários,breaks = brk, right = FALSE))
tabelaDF_salarios

tabelaDFR_salarios <- prop.table(tabelaDF_salarios)
tabelaDFR_salarios

hist(exercicio4$Salários, main="Salarios do Hospital")
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(tabelaDF_salarios),2))

hist(exercicio4$Salários, main="Salarios do Hospital")
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(tabelaDFR_salarios),0.05))

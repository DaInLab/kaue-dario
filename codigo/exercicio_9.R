# Instalando biblioteca readxl para importar para o R arquivos com extensÃ£o .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)


exercicio9 = read_excel("./dados/exercicio9.xls", col_types = c("numeric"))
exercicio9 <- as.matrix(exercicio9)

# Criando divisoes de classes de 4 a 24 a cada 2
classes <- seq(4, 24, by=2)

dis_freq <- transform(table(cut(exercicio9, classes)))
colnames(dis_freq) = c("Faixa de Salarios", "Frequencia")
print(dis_freq)

# Histograma
hist(exercicio9, breaks=classes, main="Histograma de Salarios de Funcionarios", xlab="Salarios Minimos", col="blue")
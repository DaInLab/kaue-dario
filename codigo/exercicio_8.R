# Instalando biblioteca readxl para importar para o R arquivos com extensÃ£o .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)


exercicio8 = read_excel("./dados/exercicio8.xls", col_types = c("numeric"))
exercicio8 <- as.matrix(exercicio8)

# Criando divisoes de classes de 1.5 a 2m a cada 10cm
classes <- seq(1.5, 2, by=0.1)

distrib_frequencia <- transform(table(cut(exercicio8, classes)))
colnames(dis_freq) = c("Faixa de Altura", "Frequencia")
print(dis_freq)

# Histograma
hist(exercicio8, breaks=classes, main="Histograma de Alturas de Pacientes", xlab="Altura (m)", col="blue")

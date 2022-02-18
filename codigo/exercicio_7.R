# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)

exercicio7 <- read_excel("./dados/exercicio7.xls")

barplot(exercicio7$Atendimento,
        main = "Número de atendimentos por área",
        xlab = "Área",
        ylab = "Número de Atendimentos",
        names.arg = exercicio7$Áreas)
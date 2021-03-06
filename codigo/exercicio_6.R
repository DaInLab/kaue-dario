# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")
if (!("qcc") %in% installed.packages()) install.packages("qcc")

# Carregando a biblioteca
library(readxl)

exercicio6 <- read_excel("./dados/exercicio6.xls")

library(qcc)

Par_Causas_Pri <- (exercicio6$`Nº pessoas`)
names(Par_Causas_Pri) <- exercicio6$Qualidade

G_Par_Causas_Pri <- pareto.chart(Par_Causas_Pri, main='Qualidade do atendimento',ylab = "Número de pessoas")
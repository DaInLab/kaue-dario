# Instalando biblioteca readxl para importar para o R arquivos com extensÃ£o .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)

# Importando o arquivo do exercicio 2
exercicio2 <- read_excel("./dados/exercicio2.xls",skip = 1, col_names = "Casas", col_types = c("numeric"))

# Tabelas de Frequencia
exercicio2.fabs<-table(exercicio2$Casas) #Frequencia absoluta
exercicio2.fabs

exercicio2.fr<-100*prop.table(exercicio2.fabs) #Frequencia relativa
exercicio2.fr

exercicio2.facum<-cumsum(exercicio2.fr) #Frequencia acumulada
exercicio2.facum

#Adiciona linhas de total
exercicio2.fabs<-c(exercicio2.fabs,sum(exercicio2.fabs)) #ex2.fabs recebe os valores de ex2.fabs e um valor adicional da soma
exercicio2.fe<-c(exercicio2.fr,sum(exercicio2.fr)) #ex2.fr recebe os valores de ex2.fr e um valor adicional da soma
exercicio2.facum<-c(exercicio2.facum,NA) #ex2.facum recebe os valores de ex2.facum e um valor adicional em branco
names(exercicio2.fabs)[40]<-"Total" #adiciona coluna total

tabela<-cbind (exercicio2.fabs,exercicio2.fr,exercicio2.facum) #Combina todos os elementos criados em uma tabela
tabela

# calculando a media
exercicio2.media <- mean(exercicio2$Casas)
print(paste("MÃ©dia dos numeros das Casas:", exercicio2.media))

# calculando a mediana
exercicio2.mediana = median(exercicio2$Casas)
print(paste("MÃ©diana dos numeros das Casas:", exercicio2.mediana))

# calculando a moda usando funcao

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

exercicio2.moda <- getmode(exercicio2$Casas)
print(paste("Moda dos numeros das Casas:", exercicio2.moda))


#calculando a amplitude
range(exercicio2$Casas)
exercicio2.amplitude<-diff( range(exercicio2$Casas) )
print(paste("Amplitude dos numeros das Casas:", exercicio2.amplitude))

#variancia
exercicio2.variancia<-var(exercicio2$Casas)
print(paste("Variancia dos numeros das Casas:", exercicio2.variancia))

#desvio padrão
exercicio2.desvio<-sd(exercicio2$Casas)
print(paste("Desvio padrao dos numeros das Casas:", exercicio2.desvio))

#graficos
boxplot(exercicio2$Casas)
abline(a = exercicio2.media, b = 0L, h = NULL, v = T)
abline(a = exercicio2.mediana, b = 0L, h = NULL, v = T)
abline(a = exercicio2.moda, b = 0L, h = NULL, v = T)
abline(a = exercicio2.amplitude, b = 0L, h = NULL, v = T)
abline(a = exercicio2.variancia, b = 0L, h = NULL, v = T)
abline(a = exercicio2.desvio, b = 0L, h = NULL, v = T)
library(ggplot2)
library(ggpubr)
library(dplyr)

theme_set(theme_pubr())
setwd("C:/Users/hecto/Documents/UVG 2020/Minería de Datos/Proyecto repo/Proyecto-Mineria")
datos<-read.csv("importacionesVehiculosSAT.csv", stringsAsFactors = FALSE)
datos<-datos[,-c(2,3,4,11,17)]
datos<-na.omit(datos)
#Pais de Proveniencia
df <- datos %>%
  group_by(Pais.de.Proveniencia) %>%
  summarise(count = n())
df <- df[order(-df$count),]
df[1:10,]
ggplot(df[1:10,], aes(x = Pais.de.Proveniencia, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.3) + theme_pubclean()

#Modelo de Vehiculo
df <- datos %>%
  group_by(Modelo.del.Vehiculo) %>%
  summarise(count = n())
df
ggplot(df, aes(x = Modelo.del.Vehiculo, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = ""), vjust = -0.5) + theme_pubclean()
hist(datos$Modelo.del.Vehiculo)

#Marca
df <- datos %>%
  group_by(Marca) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = Marca, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()


#Linea
df <- datos %>%
  group_by(Linea) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = Linea, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()


#Centimetros.Cubicos
df <- datos %>%
  group_by(Centimetros.Cubicos) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = Centimetros.Cubicos, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Distintivo
df <- datos %>%
  group_by(Distintivo) %>%
  summarise(count = n())
df <- df[order(-df$count),]
df
ggplot(df, aes(x = Distintivo, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Tipo de Vehiculo
df <- datos %>%
  group_by(Tipo.de.Vehiculo) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = Tipo.de.Vehiculo, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Tipo de Combustible

#Valor CIF
df <- datos %>%
  group_by(Valor.CIF) %>%
  summarise(count = n())
df
hist(datos$Valor.CIF)


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
ggplot(df[1:10,], aes(x = reorder(Pais.de.Proveniencia,count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.3) + theme_pubclean()

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
ggplot(df[1:10,], aes(x = reorder(Marca,count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()


#Linea
df <- datos %>%
  group_by(Linea) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = reorder(Linea,count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()


#Centimetros.Cubicos
df <- datos %>%
  group_by(Centimetros.Cubicos) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = reorder(Centimetros.Cubicos,count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Distintivo
df <- datos %>%
  group_by(Distintivo) %>%
  summarise(count = n())
df <- df[order(-df$count),]
df
ggplot(df, aes(x = reorder(Distintivo,count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Tipo de Vehiculo
df <- datos %>%
  group_by(Tipo.de.Vehiculo) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = reorder(Tipo.de.Vehiculo,count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Tipo de Combustible
df <- datos %>%
  group_by(Tipo.Combustible) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df, aes(x = reorder(Tipo.Combustible, count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Asientos
df <- datos %>%
  group_by(Asientos) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = reorder(Asientos, count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Puertas
df <- datos %>%
  group_by(Puertas) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df, aes(x = reorder(Puertas, count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Tonelaje
df <- datos %>%
  group_by(Tonelaje) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df[1:10,], aes(x = reorder(Tonelaje, count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()

#Valor.CIF
df <- datos %>%
  group_by(Valor.CIF) %>%
  summarise(count = n())
df <- df[order(-df$count),]
hist(df$Valor.CIF)

#Anio
df <- datos %>%
  group_by(Anio) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df, aes(x = reorder(Anio, count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()


#Mes
df <- datos %>%
  group_by(Mes) %>%
  summarise(count = n())
df <- df[order(-df$count),]
ggplot(df, aes(x = reorder(Mes, count), y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = count), vjust = -0.5) + theme_pubclean()


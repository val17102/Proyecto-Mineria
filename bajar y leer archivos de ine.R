library(foreign)
library(ggplot2)
library(ggpubr)
library("stringr")
library(dplyr) #Para usar select
setwd(" ~/Documents/Mineria/Proyecto-Mineria")
links <- 
"
~/Documents/Mineria/Proyecto-Mineria/datos2/2011.sav
~/Documents/Mineria/Proyecto-Mineria/datos2/2012.sav
~/Documents/Mineria/Proyecto-Mineria/datos2/2013.sav
~/Documents/Mineria/Proyecto-Mineria/datos2/2014.sav
~/Documents/Mineria/Proyecto-Mineria/datos2/2015.sav
~/Documents/Mineria/Proyecto-Mineria/datos2/2016.sav
~/Documents/Mineria/Proyecto-Mineria/datos2/2017.sav
"
dataset = read.spss("~/Documents/Mineria/Proyecto-Mineria/datos2/2018.sav", to.data.frame=TRUE)
for (i in 1:length(names(dataset))){
  names(dataset)[i] <- tolower(names(dataset)[i])
}
print(names(dataset))
dataset <- select(dataset,depocu,mupocu,sexo,diaocu,añoreg,mesocu,edadif,ecidif,escodif, dredif,mredif,caudef)

links<-str_trim(unlist(strsplit(links,"[[:cntrl:]]")))
links<-links[links!=""]
for (link in links){
  temp_dataset = read.spss(link, to.data.frame=TRUE)
  for (i in 1:length(names(temp_dataset))){
    names(temp_dataset)[i] <- tolower(names(temp_dataset)[i])
  }
  #print(names(temp_dataset))
  temp_dataset <- select(temp_dataset,depocu,mupocu,sexo,diaocu,añoreg,mesocu,edadif,ecidif,escodif, dredif,mredif,caudef)
  
  dataset <- rbind(dataset, temp_dataset)
  rm(temp_dataset)
}
View(dataset)
#write.csv(dataset, file="mortalidadIne.csv",row.names = F)
#save(dataset, file="mortalidadIne.RData")
## Remover acentos
dataset<-na.omit(dataset)
#print(nrow(dataset))
#for (i in 1:nrow(dataset)){
#  tempVariable <- dataset[9,]
  #print(tempVariable)
#  tempVariable$depocu <-iconv(tempVariable$depocu, to="ASCII//TRANSLIT")
  #print(tempVariable)
#  dataset[9,] <- tempVariable
#  print(i)
#}
#View(dataset)
#write.csv(dataset, file="mortalidadIne.csv",row.names = F)
#save(dataset, file="mortalidadIne.RData")
#Departamento de ocurrencia
df <- dataset%>%
  group_by(depocu) %>%
  summarise(count = n())
#Eliminar acentos en los dept

#for (i in 1:nrow(df)){
#  tempVariable <- df[i,]
#  tempVariable$depocu <-iconv(tempVariable$depocu, to="ASCII//TRANSLIT")
#  #tempVariable$n <- i
#  df[i,] <- tempVariable
#}



df2 <- df%>%
  group_by(count) %>%
  summarise(count = n())
df2 <- df2[order(df2$count, decreasing=TRUE), ]
df2$n <- 1

View(df)
ggplot(df, aes(x = depocu, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = ""), vjust = -0.5) 


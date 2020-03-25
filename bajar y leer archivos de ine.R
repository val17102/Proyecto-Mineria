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
  print(names(temp_dataset))
  temp_dataset <- select(temp_dataset,depocu,mupocu,sexo,diaocu,añoreg,mesocu,edadif,ecidif,escodif, dredif,mredif,caudef)
  
  dataset <- rbind(dataset, temp_dataset)
  rm(temp_dataset)
}
View(dataset)
#write.csv(dataset, file="mortalidadIne.csv",row.names = F)
#save(dataset, file="mortalidadIne.RData")
## Remover acentos
for (i in 1:nrow(dataset)){
  tempVariable <- dataset[i]
  tempVariable <-iconv(tempVariable, to="ASCII//TRANSLIT")
  tempVariable <-gsub("`|\\'", "", iconv(tempVariable, to="ASCII//TRANSLIT"))
  print(tempVariable)
}
#Departamento de ocurrencia
df <- dataset%>%
  group_by(depocu) %>%
  summarise(count = n())
df <- df[order(df$count, decreasing=TRUE), ]
for (i in 1:nrow(df)){
  print(i)
}
View(df)
ggplot(df, aes(x = depocu, y = count)) + geom_bar(fill = "blue", stat = "identity") + geom_text(aes(label = ""), vjust = -0.5) 


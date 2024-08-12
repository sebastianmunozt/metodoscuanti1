#Práctica general####
#1) Crear un objeto desde base_covid_sample.RDS 
#(recordar tener en cuenta la extensión del archivo)
#pongale a la base nueva: base_covid_practica
base_covid_practica <- readRDS("Fuentes/base_covid_sample.RDS")
#2) Crear otro objeto en donde selecciono 3 columnas de interés 
#según sus nombres
library(tidyverse)
base_covid_practica_1 <- base_covid_practica %>% 
  select(sexo, edad, fallecido)

#3) Crear otro objeto en donde selecciono 3 columnas de interés 
#según su posición.
names(base_covid_practica)
base_covid_practica_2 <- base_covid_practica %>% 
  select(2, 3, 15)

#4) Guarde como objeto, una base filtrada sólo de las provincia de Córdoba y Santa Fe, mayores de 65
names(base_covid_practica)
unique(base_covid_practica$residencia_provincia_nombre)
base_covid_practica_3 <- base_covid_practica %>% 
  filter(residencia_provincia_nombre %in% c("Córdoba","Santa Fe")) %>% 
  filter (edad >=65)


#5) Observe si la base generada está bien realizada
table(base_covid_practica_3$residencia_provincia_nombre)
table(base_covid_practica_3$edad)

#6) Guarde la base en formato excel
library(openxlsx)
dir.create(path = "resultados") #genera una carpeta desde mi proyecto
write.xlsx(x = base_covid_practica_3,file = "resultados/base_covid_adultosmayores_cba_sf.xlsx")
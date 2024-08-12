#---------------------- 3.CLASE 3: Abrir y guardar Bases  ---------------

# Parte I : Repaso de importación
# 1. Abrir archivo RDS -------------------------------------------------------
base.covid <- readRDS (file = ".../donde_está_según_mi_proyecto")

#ejemplo
tweets_vacunas <- readRDS (file = "Fuentes/Bases adicionales/vacuna.tweets.RDS")

#RDS: base de datos de R, no requiere instalar un paquete adicional. 

# 2. Abrir archivo CSV ----------------------------------------------------
#read.csv()
#está en tidyverse
library (tidyverse) 

#read.csv()####
c19 <- read_csv(file ="Fuentes/Bases adicionales/Covid19VacunasAgrupadas.csv")

#forma de operar:
# a) estoy situado en mi proyecto, 
# b) apreto comillas ""
# c) para buscar el archivo que quiero, puedo retroceder (../) hacia carpetas anteriores o buscar
# d) realizar la búsqueda con tecla tab, evita equivocaciones en la escritura. 

remove(list = ls()) #para que sirve?

#práctica: busque la que dice copia
c19 <- read_csv(file ="______")

#read.xlsx(): xlsx ####
# abrir archivo, en pestaña 1 y que empiece en fila 4 (hay información no relevante antes)
#la función startRow = ; indica desde que fila empezar
base.adquisiciones1 <- read.xlsx(xlsxFile = "Fuentes/Bases adicionales/Adquisiciones y vuelos covid.xlsx", 
                                 sheet = 1, startRow = 4) 


# Parte II: Exploración Inicial de base ---------------------------------------------
# 1. glimpse()#### 
#nos muestra en formato más amigable un listado de las variables de la base: 
#indicando la clase de variable en cuestión
#muestra los primeros valores de cada una de ellas

#estructura
glimpse(base)

#ejemplo
glimpse(base.adquisiciones1)


# 2. names () y unique()#### 
#primero observo las columnas/variables
names(base.adquisiciones1)

#luego veo variables las categorías únicas de variables en específico
#estructrura
#unique(base$variable)

#por ejemplo quiero ver las categorías de ESTADO.DE.PROCESO 
unique(base.adquisiciones1$ESTADO.DE.PROCESO)

#Práctica### 
#pueden ver las categorías de otra variable?


# 3. table()#### 
#hacer tabulados univariados o bivariados.
#estructura
table(base$variable)

#ejemplo
table(base.adquisiciones1$ESTADO.DE.PROCESO)

#prop.table (table (base)): permite calcular proprciones de la tabla
prop.table(table(base.adquisiciones1$ESTADO.DE.PROCES))
prop.table(table(base.adquisiciones1$ESTADO.DE.PROCES))*100

#Práctica 
#A partir de la siguiente base:
base_práctica <- readRDS("Fuentes/base_covid_sample.RDS")

#1) Apliquen la función  glimpse (nombre_base_datos). 


#1.1) al observar la base de esa forma: ¿Qué tipo de información crees que tiene la base de datos?

#2) Observe el nombre de las variables - names(nombre_base_datos)

#3) Observe las categorías de la variable sexo - unique (base$variable)

#4) realice una tabla de sexo - table(base$variable)

#5) realice una tabla con proporciones y multipique por 100 - prop.table(table(base$variable))*100

#4. tabla bivariada
table(base_práctica$sexo, 
      base_práctica$clasificacion_resumen)

# Parte III. Exportar archivos: write_ () -----------------------------------------

# cada paquete que presenta funciones para importar bases de datos, 
# tiene como complemento una función para exportar (guardar en el disco de nuestra PC) 
# un objeto con la misma extensión.


#levanto bases
#distintos tipos de archivos
base_prueba <- read.csv("Fuentes/Bases adicionales/Covid19VacunasAgrupadas.csv")
base_prueba2 <- read.xlsx("Fuentes/Bases adicionales/Adquisiciones y vuelos covid.xlsx", 
                          startRow = 4)
#realizo otra base
base_prueba3 <- data.frame (x = c(1,2,3),
                            y = c("uno","dos","tres"))

#estructura write.csv:
write.csv(x= objeto_base_de_datos_en_ambiente, file = "archivo_de_exportacion.csv")

dir.create(path = "resultados") #genera una carpeta desde mi proyecto

#write.csv (default separa ",")####
write.csv(x= base_prueba3, file = "resultados/archivo_de_exportacion0.csv")

#observo como queda
# ¿Donde se guarda?!

#write.csv2 (default separa ";")####
write.csv2(x= base_prueba3, file = "resultados/archivo_de_exportacion1.csv")
#observo como queda

#write.xlsx() ####
#estructura
write.xlsx(x = objeto_resultados,file = "resultados/cuadro1.xlsx")

#ejemplo
write.xlsx(x = base.adquisiciones1,file = "resultados/cuadro1.xlsx")

# Parte IV: Tidyverse -----------------------------------------------------
# 01. Introducción --------------------------------------------------------

# ¿qué es tidyverse:
# paquete de paquetes, le da una coherencia a todos estos paquetes en cuanto los parametros
# implica una "nueva escuela" para programar.
# tiene que ver con paquetes para: 
# a) importación
# b) ordenar, 
# c) transformar, 
# d) visualizar, 
# e) modelar, 
# f) comunicar

install.packages("tidyverse")
library(tidyverse)

#atajo (shorcut) asignador: alt-

#01.1 el pipe %>%####
#uso general
# %>% ; se hace con ctrl+shift+m (es el atajo)

#forma de escritura:
#a) cual sería mi objeto que quiero operar (e.g. una base))
#b) poner el %>% (delimita: izquierda (sobre quien): derecha|abajo (que))
#c) poner lo que se quiere hacer (la operación) (a la derecha o abajo)

# es útil para concatenar diversas opereraciones, sobre mismo objeto. 
base_covid <- readRDS("Fuentes/base_covid_sample.RDS")

#ir escalando
#ejemplo: obtener función relativa por sexo: base, sexo, qué. 

#opción 1 (mediante R Base): 
table(base_covid$sexo)

#opción 2: 
base_covid$sexo %>% 
  table () 

#qué pasa cuándo se van sumando funciones, por ejemplo proporciones.
#opción 1: ir guardando objetos y aplicando funciones. 

tabla <- table(base_covid$sexo)
tabla

tabla2 <- prop.table(tabla)
tabla2

tabla3 <- round(tabla2, digits = 2)
tabla3

#opción 2: ir anidando funciones 
#a la tabla de sexo en la base, se le pide proporciones
#luego se redondea

table(base_covid$sexo)
prop.table (table(base_covid$sexo))
round(prop.table (table(base_covid$sexo)), digits = 2)

#opción 3: desde tidyverse: 
#con quién quiero trabajar, %>% , que voy queriendo hacer cada vez:

#trabajo sobre variable de base
# %>% 
#quiero table
# %>% 
#distribución relativa
# %>% 
# redondeo (con cierta cantidad de dígitos)

base_covid$sexo %>% 
  table () %>% 
  prop.table () %>% 
  round(digits = 2)

# tidyverse: intenta ser una versión más interpretable y legible
# dato: cuando queda con el + en consola (esc enconsola)


#02. Paquetes básicos de tidyverse -------------------------------------------
#2.1. deplyr####

#ordenar y transformar#

# Función	      Acción
# select()	    selecciona o descarta columnas/variables
# filter()     	selecciona filas/casos
# mutate()    	crea / edita variables
# rename()    	renombra variables


#2.1.1 select####
#quedarse con algunas columnas en específico.
#esta función pide base de datos (no sólo vector)

# a) seleccionar por nombre de variable/columna
#estructura
base_de_datos %>% 
  select(variable1, variable2)

#forma de operar: 
#escribir sobre que base se trabaja
# %>% 
#select(escribir que columnas se va a seleccionar)

#en términos prácticos: 
#ver como se llaman las variables a seleccionar
#ver en la meta data (diccionario de registro o de variables)
#ver mediante names: ver nombre exacto 

names(base_covid)

# a) por NOMBRE DE VARIABLE####
#asigno a nueva base la selección y pongo nombre de variable.
base_covid_seleccion <- base_covid %>% 
  select(sexo, edad)

#chequeo
names(base_covid_seleccion)

#práctica 
#seleccione otras 3 variables de base_covid y cree una nueva base llamanda base_covid_2
#primero observe las variables mediantes names()

# b) por POSICIÓN DE VARIABLE ####
#asigno a nueva base la selección realizada y pongo números de posición.
names(base_covid)

# quiero seleccionar id_evento_caso, edad, edad_años_meses
# en la base son columnas 1, 3 y 4

base_covid_seleccion <- base_covid %>% 
  select(1, 3, 4)

#reviso
names(base_covid_seleccion)

#práctica####
#seleccione otras 3 variables de base_covid y cree una nueva base llamanda base_covid_3
#primero observe las variables mediantes names()


#c) (starts_with()según que EMPIECE con ####
#sirve para quedarse con bloques del cuestionario
names (base_covid)

base_covid_seleccion <- base_covid %>%
  select(starts_with("residencia"))

#chequeo
names(base_covid_seleccion)

#¿Qué hice ahí?
base_covid_seleccion <- base_covid %>%
  select(starts_with("residencia") |
         1,2,3)

#práctica####
#seleccione otras 3 variables de base_covid y cree una nueva base llamanda base_covid_3
#primero observe las variables mediante names()


#d) (ends_with()según TERMINE con ####
base_covid_seleccion <-base_covid %>%
  select(ends_with("id"))

#chequeo
names(base_covid_seleccion)

#e) (contains())según un parametro que CONTENGA#### 
#ni empiezan ni terminan
base_covid_seleccion <- base_covid %>%
  select(contains("provincia"))

#chequeo
names(base_covid_seleccion)


#2.1.2 filter####
#filtrar casos; filas

#estructura: 
base_de_datos %>% 
  filter(variable operador valor/categoria)

#forma de operar: 
#escribir sobre que base se trabaja
# %>% 
#filter ()
# a) escribir variable (fila) 
# b) escribir OPERADOR (<, >, ==,!) 
# c) valores/categorías a cumplir

#ejemplo 1: mayores de 70
base_covid_practica_seleccion <-base_covid %>% 
  filter(edad > 70)

#observo la base
table(base_covid_practica_seleccion$edad)

#ejemplo 2: quiero seleccionar los que tengan 37
base_covid_practica_seleccion <-base_covid %>% 
  filter(edad == 37)

table(base_covid_practica_seleccion$edad)

#Práctica ####
#para la misma base 
# seleccione personas menores de 18
# seleccione personas de su edad


#ejemplo 3: quedarse con quienes requirieron asistencia mecánica
#ver nombre de variables
names(base_covid)

#ver tipo de variable es y cuáles son sus categorías
class(base_covid$asistencia_respiratoria_mecanica)
#en variables tipo character, no se puede poner mayor o menor!

unique(base_covid$asistencia_respiratoria_mecanica)

#quedarse con quienes requirieron asistencia médica
base_covid_practica_seleccion <-base_covid %>% 
  filter(asistencia_respiratoria_mecanica == "SI")

#chequeo
table(base_covid_practica_seleccion$asistencia_respiratoria_mecanica)


#ejemplo 4: combinación: 
# ¿Qué está diciendo lo siguiente?
base_covid_practica_seleccion <-base_covid %>% 
  select(id_evento_caso, asistencia_respiratoria_mecanica) %>% 
  filter(asistencia_respiratoria_mecanica== "SI")

# ¿Qué columnas se seleccionaron (variables)?
# ¿Qué filas se seleccionaron (casos)?

# para filtrar condiciones se usa un doble igual (==)
# siempre al filtrar, fijarse que en la selección esté la variable.

# a) operadores####
# Condición	Acción
# ==	igual (ojo doble igual)
# !=	distinto
# >	mayor que
# <	menor que
# >=	mayor o igual que
# <=	menor o igual que

# Operador para combinar
# &	y - Cuando se cumplen ambas condiciones
# |	o - Cuando se cumple una u otra condición
# %in%	incluye: lo que está a la izquierda está incluido en lo q está a la derecha

#ejemplo 1: 
# no quiero eleccionar masculinos
base_covid_practica_seleccion <-base_covid %>% 
  select(sexo, edad) %>% 
  filter(sexo != "M")

#chequeo que categorías tiene sexo
unique(base_covid_practica_seleccion$sexo)

#agrego filtro para menores de 18
base_covid_practica_seleccion <-base_covid %>% 
  select(sexo, edad) %>% 
  filter(sexo != "M") %>% 
  filter(edad <=18)

#esto es lo mismo que 
base_covid_practica_seleccion <-base_covid %>% 
  select(sexo, edad) %>% 
  filter(sexo != "M" & edad <=18)

#chequeo
names(base_covid_practica_seleccion)
summary(base_covid_practica_seleccion$edad)
table(base_covid_practica_seleccion$edad)

#ejemplo 2: 
#Caso: 
#Quiero quedarme con la población de la CABA (Ciudad Autónoma de Buenos Aires)
#o de la PBA (Provincia de Buenos Aires)
#que haya recibido asistencia respiratoria mecánica:

#operadores:   
#Provincias CABA o Buenos Aires 
#(residencia_provincia_nombre %in% c("CABA", "Buenos Aires"));

#Asistencia respiratorio mecanica 
#(asistencia_respiratoria_mecanica == "SI")
#veo valores de variable

unique(base_covid$residencia_provincia_nombre)


#opción 1:
base_covid_practica_seleccion <-base_covid %>%
  select(sexo, edad, residencia_provincia_nombre, asistencia_respiratoria_mecanica) %>% 
  filter(residencia_provincia_nombre == "CABA" |
           residencia_provincia_nombre == "Buenos Aires") %>% 
  filter(asistencia_respiratoria_mecanica == "SI")


#chequeo base
unique(base_covid_practica_seleccion$residencia_provincia_nombre)
unique(base_covid_practica_seleccion$asistencia_respiratoria_mecanica)

#opción 2: 
base_covid_practica_seleccion <-base_covid %>%
  select(sexo, edad, residencia_provincia_nombre, asistencia_respiratoria_mecanica) %>% 
  filter(residencia_provincia_nombre  %in% c("CABA", "Buenos Aires")) %>% 
  filter(asistencia_respiratoria_mecanica == "SI")

#chequeo base
unique(base_covid_practica_seleccion$residencia_provincia_nombre)
unique(base_covid_practica_seleccion$asistencia_respiratoria_mecanica)

# Práctica####
#Crear un objeto que contenga las variables 
#id_evento_caso, residencia_provincia_nombre y asistencia_respiratoria_mecanica  
#cuya población sea sólo aquella de las provincias de
#Mendoza que NO recibió ayuda respiratoria mecánica (es región).

names(base_covid)

unique(base_covid$residencia_provincia_nombre)
unique(base_covid$asistencia_respiratoria_mecanica)

base_covid_practica_seleccion1 <-base_covid %>%
  select(__________) %>% 
  filter(residencia_provincia_nombre  == "________") %>% 
  filter(asistencia_respiratoria_mecanica == "_________")

table(base_covid_practica_seleccion1$residencia_provincia_nombre)
table(base_covid_practica_seleccion1$asistencia_respiratoria_mecanica)

#OJO: si no se pone comilla, r busca un objeto. 


#Tarea para la casa
base_covid_practica <- readRDS("Fuentes/base_covid_sample.RDS")

#Práctica general####
#1) Crear un objeto desde base_covid_sample.RDS 
#(recordar tener en cuenta la extensión del archivo)
#pongale a la base nueva: base_covid_practica
#2) Crear otro objeto en donde selecciono 3 columnas de interés 
#según sus nombres
#3) Crear otro objeto en donde selecciono 3 columnas de interés 
#según su posición.
#4) Guarde como objeto, una base filtrada sólo de las provincia de Córdoba y Santa Fe, mayores de 65
#5) Observe si la base generada está bien realizada
#6) Guarde la base en formato excel




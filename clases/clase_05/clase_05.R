
# PARTE I: Proyectos, librerías y bases de datos -----------------------------------------
# (signo gato permite dejar comentarios que no se ejecutan como sintaxis)

#01. Recapitulación

#Objeto valor y asignación
4+2
x <- 4
y <- 6
x + y

#Objeto vector
vector_numerico <- c(1, 2, 4, 78, 42, 3, 65)
vector_de_texto <- c("casa", "auto", "bus", "bicicleta")

#Objeto factor
genero <- c(1,2,2,2,1,2,1,99,99)
generof <- factor (genero, labels = c("Hombre", "Mujer", NA))

letras <- c("Hombre", "Mujer", NA)
generof2 <- factor (genero, labels = letras)
table(generof2)


# 02. data.frame ####
# tipo de objeto que tiene filas y columnas
# creación: nombre_nueva_base <- data.frame(vector1, vector2, vector3,...,vectorn)
edad <- c(24, 56, 75, 42, 99)
nombre <- c("D'artanian", "Rigoberta", "Menganita", 
                       "Juancito", "Estanislao")
data.frame.prueba <- data.frame(edad, nombre)
data.frame.prueba


#ejemplo 2
edad <- c(5:8) #qué significan esos puntos
nombres <- c("juan", "pedro", "ale", "pepe")

base <- data.frame(edad, nombres)
base
#ver la base, clickeando

paises <- c("chile", "argentina", "brasil", "venezuela")

base2 <- data.frame(edad, nombres, paises)
base2

# observar la base de datos en "Global Environment"

#Práctica 2####
# sume otra variable con 4 elementos, por ejemplo, tendencia política (tendpol)
# genere otra base de datos (base3)


#cuándo no coinciden filas/columnas: poner NA
edad <- c(24, 56, 75, 42, NA)
nombre_y_apellido <- c("D'artanian estrujillo", "Rigoberta manchuria", "Menganita fulaique", 
                       "Juancito loquillo", "Estanislao leningrado")
data.frame.prueba2 <- data.frame(edad, nombre_y_apellido)
data.frame.prueba2

#si se crea un objeto, y luego se crea otro con el mismo nombre se va a pisar. 
#si no coinciden filas y columnas existe un error
#para eso hay que hacerlo como NA

#Práctica: cree la base de datos de su grupo
nombres <-  c(_____,______,____) #recuerde que palabras van con comillas ("")
lectura_de_textos <-  (_____,______,____) # si leyó bibliografía obligatoria, coloque "si", sino lo hizo "no" 
BBDD_GRUPO <-  data.frame (_____,_____,_____)

#¿Cuántos leyeron los textos?
table(BBDD_GRUPO$lectura_de_texto)

#02.1 Funciones para las bases####
#dim(base)####

base
dim(base)
#dimesiones
#4 filas, 2 columnas

#names(base)####
#nombres de columnas o variables 
names(base)

#base$variable:col/var entera#### 
# operador $ señala del dataframe X, selecciona una determinada variable
base$edad
edad_2 <- base$edad


#class(base$variable)####
# permite señalar el tipo de variable 
class(base$edad)

#table(base$variable)
table(base$nombres)

#mean(base$variable)####
#volvamos a hacer la base
edad <- c(5,6,7, NA)
nombres <- c("juan", "pedro", "ale", "pepe")
base <- data.frame(edad, nombres)
base

mean(base$edad)
# por qué?

mean(base$edad, na.rm = TRUE)
#na.rm: no considerar los NA al realizar la media

# práctica saque la media de edad de su grupo
# BBDD_GRUPO



#03. instalación de paquetes o librerias
# ojo: install.packages("nombre_del_paquete") y luego library (nombre_del_paquete)
# instalación de las librerías openxlsx y tidyverse 

install.packages("openxlsx")
install.packages("tidyverse")
#con comillas

#2. abrir librerias
library(openxlsx)
library(tidyverse)
#sin comillas

#04. Proyectos
#Práctica ####
#a) creen una carpeta que se llame "clases r" en el escritorio
#b) creen un nuevo proyecto en un nuevo directorio de sus computadoras: llamelo "En clase 5" 


#  PARTE II: Abrir bases de datos ----------------------------------------
#Cierre el programa y volvamos a abrir proyecto Clase 5

# 1. Abrir archivo RDS -------------------------------------------------------
base.covid <- readRDS (file = ".../donde_está_según_mi_proyecto")

#ejemplo
tweets_vacunas <- readRDS (file = "Fuentes/Bases adicionales/vacuna.tweets.RDS")

#Abra base: base_covid_sample.RDS 
#designela como base_covid
base_covid <- readRDS (_____ = "")

#no requiere instalar un paquete

# 2. Abrir archivo CSV ----------------------------------------------------
#read.csv()
#está en tidyverse
library (tidyverse) 

#read.csv()####
#utilice la función read.csv (file="buscar_el_archivo.csv")
#asignela a una base en el ambiente llamada c19
c19 <- read_csv(file ="Fuentes/Bases adicionales/Covid19VacunasAgrupadas.csv")

#abra la base Covid19VacunasAgrupadas - copia 
#guardela como c19_2
___ <- read_csv(file ="_________")

#forma de operar:
# a) estoy situado en mi proyecto, 
# b) pongo file= comillas""
# c) para buscar el archivo que quiero, puedo retroceder (../) hacia carpetas anteriores o buscar
# d) realizar la búsqueda con tecla tab, evita equivocaciones en la escritura. 

remove(list = ls()) #para que sirve?

#read.xlsx(): xlsx ####
#esta es otra función que hace lo mismo, pero tiene otros parámetros
library(openxlsx)

#lo tienen instalado en el computador?
#si no lo tienen cómo se baja de internet?

#estructura
#base_nueva <- read.xlsx(xlsxFile = "ruta_desde_el_proyecto")

base.adquisiciones0 <- 
  read.xlsx(xlsxFile = "Fuentes/Bases adicionales/Adquisiciones y vuelos covid.xlsx")

#chequeo base: tres primeras filas son información innecesaria, partiré desde la 4.

# abrir archivo, en pestaña 1 y que empiece en fila 4 (hay información no relevante antes)
#la función startRow = ; indica desde que fila empezar
base.adquisiciones1 <- read.xlsx(xlsxFile = "Fuentes/Bases adicionales/Adquisiciones y vuelos covid.xlsx", 
                                 sheet = 1, startRow = 4) 
#chequeo base: ahí si me aparece bien lo que quiero 

#práctica: abrir el mismo archivo, pero ahora desde pestaña 2 y leer los datos desde 3 fila.
# asignelo como vuelos
vuelos <- read.xlsx(xlsxFile = "Fuentes/Bases adicionales/Adquisiciones y vuelos covid.xlsx", 
                    sheet =_____, startRow =_______)

# Abrir bases de STATA y SPSS: haven ------------------------------------------
#Instalar paquete y abrirlo
install.packages("haven")
library(haven)

#abrir archivo UDP_2015 (formato stata) - comando read.dta de paquete haven
UDP_stata <- read_dta("Fuentes/Bases adicionales 2/UDP_2015.dta") 

#Abra la base de SPSS
#abrir archivo UDP_2015 (formato SPSS) - comando read_spss de paquete haven
UDP_spss <- read_spss("_______")

#5. Tarea Casa ----------------------------------------------------------------------
# 1. Cree un proyecto (Rproject). File->New Project->New Directory-> New Project,
# el nombre del proyecto debe ser "Estudiantes Antropología 2023", recuerde que se creará una carpeta con ese nombre en la ruta que seleccione.
# Además asegurese tener el archivo "Encuesta Estudiantes Antropología 2023.xls" dentro de la carpeta del proyecto ("Estudiantes Antropología 2023").

# 2. Cree una Script (File-> New File -> RScript), denomine esta Script como "Tarea 2.R"

# 3. Construcción de data.frame
#3.1. Cree un VECTOR llamado nombres que contenga los nombres de los/as integrantes de su grupo

#3.2. Cree un VECTOR llamado nombres_na que contenga los nombres de los/as integrantes de su grupo y un valor NA.

#3.3.Cree un VECTOR llamado edad que contenga la edad de los/as integrantes de su grupo

#3.4.Cree un vector llamado tendencia que contenga la tendencia política de los/as integrantes de su grupo

#3.5.Cree un dataframe (llamarla: BASE_DATOS) que contenga los vectores creados previamente

#Observe su base de datos

#Obtenga el promedio de edad de su grupo (uso de $)

#Parte 2: apertura de bases
# 4.Cargue los paquetes tidyverse y openxlsx, en caso de no tenerlos, instalarlos.

# 5.Importe la base de datos "Encuesta Estudiantes Antropología 2023", la que está configurada con extensión xlsx.
# Se encuentra en Bases adicionales 3

# ¿Qué función permite abrir bases de datos con extensión .xlsx?
# Nombrela la base que abra como encuesta_antropologia

# Hint1: Esta base de datos se encuentra en las segunda hoja del archivo xlsx: (sheet=) 
# Hint2: Observe desde donde parte la base de datos: (startRow =)
#¿cuál es el argumento que especifica la hoja en un archivo excel?

# 6. ¿Cuál es la cantidad de filas(observaciones) y columnas(variables) de la base de datos?


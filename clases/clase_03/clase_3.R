#---------------------- 1.CLASE 1: CREACIÓN Y MANIPULACIÓN DE OBJETOS ---------------
# (signo gato permite dejar comentarios que no se ejecutan como sintaxis)

#1. INGRESAR VALORES #####


5 # para ejecutar: "ctr + enter" al final de lÍnea o selección  o botón "run"
5+6
c(1:10) #concatenar


# 2. ASIGNACIÓN DE VALORES #####
x <- 4 
x
5 -> a
a

# Práctica: asignen otro valor!


# 3. CREACIÓN DE VECTORES #####

y <- c(4, 3, 5) # Información del vector en entorno. Función concatenar "c ()"
z <- c(1.1, 4.67, 5.1, 6.8)
letras <- c("hombre", "mujer", "no sabe/no responde")

class(y)
class(z)
class(letras)

#4. MANIPULACIÓN MATEMÁTICA DE VECTORES #####
2 - 1  #operar los dos cálculos a la vez
10/2
y * 2 #operación directa no guarda resultado (multiplicación de valores de un vector o variable)

a+x
a-x
a*x
a/x
a^x

# Pregunta: ¿Cómo asigno los resultados de la última operación a un nuevo vector w. 


#Para retener el resultado y disponerlo como un elemento con contenido debemos almacenarlo

doble_y <- y*2
mitad_y <- y/2


#5. CONFIGURACIÓN DE UN VECTOR TIPO FACTOR #####

factor <- c("Hombre", "Mujer", "Mujer", "Mujer", "N/S", "N/S", "Hombre", "N/R")

#le doy la característica de factor
sexo <- factor(factor)

#Obtengo una tabla de frecuencias: ¿Cuántos hombres y mujeres tengo?
table(sexo)

genero <- c(1,2,2,2,1,2,1,99,99)

genero_f <- factor(genero, labels = c("Hombre", "Mujer")) #Importancia del error (cantidad valores)

# factor (sobre_qué_objeto, labels = las_etiquetas)

genero_f <- factor(genero, labels = "Hombre")
#observo cómo los categorizó (marco sólo genero_f)
genero_f 

generof <- factor (genero, labels = c("Hombre", "Mujer", "NS-NR")) #Incorporar valores perdidos
generof <- factor (genero, labels = c("Hombre", "Mujer", NA)) #Cambiar a valor lógico: valor perdido
letras <- c("hombre", "mujer", "no sabe/no responde")
generof2 <- factor (genero, labels = letras)

#Obtengo tabla de frecuencias
table(generof)
table(generof2)


# mi primera tabla!####

install.packages("gt")
install.packages ("tidyverse")
library(gt)
library(tidyverse)


tabla_ejemplo <- table(generof)


#ahora siganmé 

tabla_ejemplo <- as.data.frame (tabla_ejemplo) #Se cambia el formato de tabla a dataframe

#Técnica avanzada el pipe %>% 
tabla_ejemplo %>% 
  gt () %>% 
  tab_header("Mi primera tabla uwu") %>% 
  cols_label (generof  = "Género", 
             Freq = "Frecuencia") %>% 
  tab_footnote(
    footnote = "Ya aprenderé a programar", 
    locations = cells_title(groups = "title")
  )


#mi primer gráfico! #### usamos ggplot
ggplot(tabla_ejemplo, aes(x=generof, y=Freq, fill=generof))  +
  geom_col () + 
  theme_linedraw()+
  labs (title = "Mi primer gráfico uwu", 
        x = "Género", 
        y = "Frecuencia")+
  guides (fill= "none") +
  theme (plot.title = element_text(hjust = 0.5))

#de esto, al gráfico
tabla_ejemplo

#6.  NA####

edad <- c(1:5) #concateno
edad2 <- c(1,2,3,4,5, NA)


# 7. SUMATORIA ####
#realizo sumatoria "sum()"

sum(edad)
sum(edad2)

#se saca de la suma los perdidos
sum(edad2, na.rm = TRUE)

# se entiende que es valor perdido?

# 8. MEDIA 
#Acá la funcion na.rm elimina de la suma los na
mean(edad2, na.rm = T)

(1+2+3+4+5)/5 #lo compruebo


#9. REMOVER OBJETOS ESPECÍFICOS DEL ENTORNO DE TRABAJO #####
remove(x)
remove (a, y, z)

#Para limpiar entorno de trabajo completo
remove(list = ls()) #para limpiar entorno de trabajo completo

# ¿Qué aprendimos?
# Usar menu (4#). No aparece media. Poner 4#


# Ojo: 
# asignación se guarda en global enviroment.
# en objetos: no se aceptan espacios (usar guión bajo)
# en objetos: no se puede empezar con símbolo o valor numérico
# sugerencias: r permite acentos o simbolos (es mejor evitarlos, para evitar problemas de traducción)
# evitar objetos con funciones que se utilicen
# r es quisquilloso con mayusculas y minusculas, se crean objetos diferentes
# se usa convencionalmente los espacios con guión bajo y todo en minúscula.

#Tarea para la casa (revisión en ayudantía)

#Creación de vectores!!



#1. Cree un vector llamado "artistas" que contenga los nombres de sus 5 artistas musicales favoritos 
# no es necesario que sean sólo cantantes (pueden ser bandas o solistas, pueden ser dj's, beatmakers,guitarristas,etc, la idea es que sea alguien que a usted le guste mucho)


#2. Cree un vector llamdao "estilos" que contenga el nombre de los estilos de los 5 artistas/bandas 
#Pista: para que se corresponda el artista con su estilo deben estar en el mismo orden que el vector artista


#3. Cree un vector llamado "anio_inicio" que contenga el año de inicio de cada artista/banda (debe seguir el orden que corresponda a cada artista/banda del vector "artistas")


#4. Cree un vector llamado "presencia_femenina" que sea igual a 1 si el artista/banda es mujer (o existe una mujer en la banda)
#y 0 si no es mujer (o no hay mujeres en la banda).
#Pista: si mis 5 artistas, de acuerdo al orden que puse en mi vector "artistas" las 2 primeras contienen mujeres y los ultimos 3 artistas son hombres,
# mi vector "presencia_femenina" será (1,1,0,0,0)

#5. Cree un vector llamado "edad" que contenga las edades de los artistas del vector "artistas" (en orden correspondiente),
# Si es una banda coloque la edad promedio de la banda.
#Pista: Por ejemplo si una de mis bandas favoritas es SFDK (dos integrantes), estos en promedio tienen 46 años.

#6. Transforme el vector "presencia_femenina" a factor con las etiquetas "presencia femenina" cuando el vector sea igual a 1, 
#y con la etiqueta "sin presencia femenina" cuando el vector sea igual a 0. Pista: el código está en este script.

#7. Cree un vector denominado "anio_artista" que debe contener el año de nacimiento del o la artista/banda, recuerde mantener el orden con el vector "anio_inicio".
# Si se trata de una banda calcular el año promedio de nacimiento.

#8. Finalmente, reste el vector anio_inicio con anio_artista, guarde el resultado en un objeto denominado "edad_inicio_artista". 
# ¿Qué me indica este nuevo vector?
# Pista: el código es:
# edad_inicio_artista <- anio_inicio - anio_artista
# edad_inicio_artista








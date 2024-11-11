# Prueba 2. VERSIÓN B - Métodos Cuantitativos en R

# Esta prueba incluye dos partes:
# a) Data Wrangling
# b) Análisis Descriptivo

# Debe exportar su tabla en la primera parte para proceder con la segunda.
# Se considerará en la nota final: el orden del script y el envío correcto de información.

# Al finalizar la prueba, debe guardar este script como Apellido_Nombre_Prueba2.R
# Ejemplo: Ocampo_Gino_Prueba2.R
# Debe enviar los siguientes archivos en un formato comprimido:
# a) Script en R (.R)
# b) Base de datos inicial
# c) Base de datos limpia
# d) Proyecto de R (.Rproj)

# Nota: La ruta de trabajo corresponde a la carpeta donde se encuentra el archivo .Rproj,
# por lo que no es necesario indicar una ruta más larga.

# Importante: solo puede utilizar el script de apuntes.
# El uso de redes sociales, celular o cualquier medio de comunicación externo
# será sancionado con la nota mínima.

# Recuerde cargar los paquetes necesarios para responder las preguntas. Recomendados: tidyverse y openxlsx.

#Suerte!!


### Primera parte:Data Wrangling: importación, limpieza y exportación----------

#1. Importar base 

#1.1. instale (si es necesario) y abra las librerías openxlsx y tidyverse (1 punto)
library(openxlsx)
library(tidyverse)
#1.2. importe la base "estudiantes_2023.xlsx", recuerde desde donde debe empezar a leer (1,5 puntos)
#asígnela a un objeto llamado estudiantes_2023
estudiantes_2023 <- read.xlsx(xlsxFile = "estudiantes_2023.xlsx", startRow = 3)

# 2. Renombre las siguientes variables específicas, y guarde los cambios en la base de datos 
# estudiantes_2023 
# Pista: utilice la función rename del paquete dplyr (2 puntos)

#   edad = p02,
#   genero = p03,
#   annio = p04,
#   comuna_actual = p05,
#   comuna_pre= p06,
#   tipo_colegio = p07,
#   puntaje = p08,
#   estudio_trabajo = p09,
#   educacion_madre = p10,
#   trabaja_madre =p11,
#   empleo_madre =p12,
#   educacion_padre =p13,
#   trabaja_padre =p14,
#   empleo_padre = p15,
#   psdhogar = p17,
#   clase_social_subjetiva = p18

estudiantes_2023 <- estudiantes_2023 %>% rename (edad = p02,
  genero = p03,
  annio = p04,
  comuna_actual = p05,
  comuna_pre= p06,
  tipo_colegio = p07,
  puntaje = p08,
  estudio_trabajo = p09,
  educacion_madre = p10,
  trabaja_madre =p11,
  empleo_madre =p12,
  educacion_padre =p13,
  trabaja_padre =p14,
  empleo_padre = p15,
  psdhogar = p17,
  clase_social_subjetiva = p18)


#2.1 Observe como quedaron las categorías de su base de datos con names () (0,5 puntos)
names(estudiantes_2023)

#3. Exporte su base de datos
# Guarde la base estudiantes_2023 como estudiantes_2023_limpia en formato xlsx (1 punto)
write.xlsx(x = estudiantes_2023,file = "estudiantes_2023_limpia.xlsx")

# Ejecute el siguiente código para borrar los objetos de su environment (0,2 puntos)
rm(list=ls())


#####  Segunda parte: tidyverse  ---------------------------
# 1) Importe su base creada en la parte 1 "estudiantes_2023_limpia.xlsx" nombrela base como estudiantes_limpia (0,5 puntos)
estudiantes_limpia <- read.xlsx(xlsxFile = "estudiantes_2023_limpia.xlsx")

# 2) cree una base en donde realice una selección considerando los nombres de las variables
# genero, annio, tipo de colegio, educación del padre y clase social subjetiva
# denomine al objeto base_nombres (2 puntos)
base_nombres <- estudiantes_limpia %>% select(genero, annio, tipo_colegio, educacion_padre, clase_social_subjetiva)

#2.1) Compruebe si está bien realizada mediante names() (0,5 puntos)
names(base_nombres)

#3.1) A partir de la base original: estudiantes_limpia
# cree una base en donde realice un filtro, que permita quedarse sólo con los estudiantes que se perciben de género femenino
# esto es contestaron: "Femenino" en la variable "genero" 
# a esta nueva base pongale estudiantes_genero (2 puntos)

#Pista: recuerde usar unique() para ver el nombre de las categorías de las variables y
# tenga cuidado con las mayúsculas, recuerde que R es case sensitivo a esas diferencias.

unique(estudiantes_limpia$genero)
estudiantes_genero <- estudiantes_limpia %>% filter (genero == "Femenino")



# 3.2) Compruebe lo realizado, mediante una tabla: ¿Cuántos casos tiene base_filtrada? (0,5 puntos)
# Siga formato: table(base$variable)
table(estudiantes_genero$genero)


# A continuación: Realizará los pasos para construir un gráfico -----------
# 4. Utilizando la base de datos "estudiantes_limpia" realice una tabla  de frecuencias con la variable genero 
# Guarde la tabla en un objeto llamado frecuencia_genero  (1 punto)
frecuencia_genero  <- table(estudiantes_limpia$genero)

# 5. con esa tabla de frecuencias cree una tabla en porcentajes con el siguiente código:
#   prop.table(frecuencia_genero) * 100 y asignela a un objeto denominado "porcentajes_clases" (1 punto)
porcentajes_genero <- prop.table(frecuencia_genero) * 100

# 6. transforme esta tabla a data frame con la función as.data.frame(), el dataframe se debe seguir llamando porcentaje_clases
#es necesario convertir la tabla en dataframe para el gráfico. (1 punto)
porcentajes_genero <- as.data.frame(porcentajes_genero)

# 7. realice un gráfico de barras usando el data frame porcentaje_clases (3 puntos)
#rellenando el siguiente código según corresponda:


ggplot(data =___________, aes(x = ________, y =__________, fill = Var1)) +
  geom_bar(stat = "identity", fill = "red") +
  theme(axis.text.x = element_text(angle = 70, hjust = 1)) +
  labs(title = "Gráfico de Barras de Genero", x = "___________", y = "_________") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))

ggplot(data =porcentajes_genero, aes(x = Var1, y =Freq, fill = Var1)) +
  geom_bar(stat = "identity", fill = "red") +
  theme(axis.text.x = element_text(angle = 70, hjust = 1)) +
  labs(title = "Gráfico de Barras de Genero", x = "Genero", y = "%") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))



# 8.0: Observe el orden de su script dejando sólo lo necesario. Dejelo limpio y completo (1 punto)
# 8.1: guarde su script y pongale su apellido y luego nombre (1 punto)
# 8.2: envie su script, la base inicial, la base limpia y el proyecto a (1 punto): 
# a) semunoz@uahurtado.cl; Fran.roco21@gmail.com 
# envielo como tarea por teams 
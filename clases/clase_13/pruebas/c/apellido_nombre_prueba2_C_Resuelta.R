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
#1.2. importe la base "es_2023.xlsx", recuerde desde donde debe empezar a leer (1,5 puntos)
#asígnela a un objeto llamado es_2023
es_2023 <- read.xlsx(xlsxFile = "es_2023.xlsx", sheet = 2, startRow = 5)

# 2. Renombre las siguientes variables específicas, y guarde los cambios en la base de datos 
# estudiantes_2023 
# Pista: utilice la función rename del paquete dplyr (2 puntos)

#   edad_e = p02,
#   genero_e = p03,
#   annio_e = p04,
#   comuna_actual_e = p05,
#   comuna_pre_e= p06,
#   tipo_colegio_e = p07,
#   puntaje_e = p08,
#   estudio_trabajo_e = p09,
#   educacion_madre_e = p10,
#   trabaja_madre_e =p11,
#   empleo_madre_e =p12,
#   educacion_padre_e =p13,
#   trabaja_padre_e =p14,
#   empleo_padre_e = p15,
#   psdhogar_e = p17,
#   clase_social_subjetiva_e = p18

es_2023 <- es_2023 %>% rename (
    edad_e = p02,
    genero_e = p03,
    annio_e = p04,
    comuna_actual_e = p05,
    comuna_pre_e= p06,
    tipo_colegio_e = p07,
    puntaje_e = p08,
    estudio_trabajo_e = p09,
    educacion_madre_e = p10,
    trabaja_madre_e =p11,
    empleo_madre_e =p12,
    educacion_padre_e =p13,
    trabaja_padre_e =p14,
    empleo_padre_e = p15,
    psdhogar_e = p17,
    clase_social_subjetiva_e = p18
)


#2.1 Observe como quedaron las categorías de su base de datos con names () (0,5 puntos)
names(es_2023)

#3. Exporte su base de datos
# Guarde la base es_2023 como es_2023_limpia en formato xlsx (1 punto)
write.xlsx(x = es_2023,file = "es_2023_limpia.xlsx")

# Ejecute el siguiente código para borrar los objetos de su environment (0,2 puntos)
rm(list=ls())


#####  Segunda parte: tidyverse  ---------------------------
# 1) Importe su base creada en la parte 1 "es_2023_limpia.xlsx" nombrela base como es_limpia (0,5 puntos)
es_limpia <- read.xlsx(xlsxFile = "es_2023_limpia.xlsx")

# 2) cree una base en donde realice una selección considerando los nombres de las variables
# genero, tipo de colegio, estudio o trabajo de estudiante, principal sosten del hogar y clase social subjetiva.
# denomine al objeto base_nombres (2 puntos)
base_nombres <- es_limpia %>% select(genero_e, tipo_colegio_e, estudio_trabajo_e, psdhogar_e, clase_social_subjetiva_e)

#2.1) Compruebe si está bien realizada mediante names() (0,5 puntos)
names(base_nombres)

#3.1) A partir de la base original: es_limpia
# cree una base en donde realice un filtro, que permita quedarse sólo con los estudiantes cuya madre es la principal sostén del hogar.
# a esta nueva base pongale es_psd (2 puntos)
es_psd <- es_limpia %>%  filter (psdhogar_e == "Su madre")


#Pista: recuerde usar unique() para ver el nombre de las categorías de las variables y
# tenga cuidado con las mayúsculas, recuerde que R es case sensitivo a esas diferencias.

# 3.2) Compruebe lo realizado, mediante una tabla: ¿Cuántos casos tiene base_filtrada? (0,5 puntos)
# Siga formato: table(base$variable)
table(es_psd$psdhogar_e)


# A continuación: Realizará los pasos para construir un gráfico -----------
# 4. Utilizando la base de datos "es_limpia" realice una tabla  de frecuencias con la variable psdhogar_e
# Guarde la tabla en un objeto llamado frecuencia_psdh  (1 punto)
frecuencia_psdh   <- table(es_limpia$psdhogar_e)

# 5. con esa tabla de frecuencias cree una tabla en porcentajes con el siguiente código:
#   prop.table(frecuencia_psdh ) * 100 y asignela a un objeto denominado "porcentaje_psdhogar" (1 punto)
porcentaje_psdhogar <- prop.table(frecuencia_psdh) * 100

# 6. transforme esta tabla a data frame con la función as.data.frame(), el dataframe se debe seguir llamando porcentaje_psdhogar
#es necesario convertir la tabla en dataframe para el gráfico. (1 punto)
porcentaje_psdhogar <- as.data.frame(porcentaje_psdhogar)

# 7. realice un gráfico de barras usando el data frame porcentaje_clases (3 puntos)
#rellenando el siguiente código según corresponda:


ggplot(data =___________, aes(x = ________, y =__________, fill = Var1)) +
  geom_bar(stat = "identity", fill = "red") +
  theme(axis.text.x = element_text(angle = 70, hjust = 1)) +
  labs(title = "Gráfico de Barras de Genero", x = "___________", y = "_________") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))

ggplot(data =porcentaje_psdhogar, aes(x = Var1, y =Freq, fill = Var1)) +
  geom_bar(stat = "identity", fill = "red") +
  theme(axis.text.x = element_text(angle = 70, hjust = 1)) +
  labs(title = "Gráfico de Principal Sosten del Hogar", x = "Principal Sosten del Hogar", y = "%") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))



# 8.0: Observe el orden de su script dejando sólo lo necesario. Dejelo limpio y completo (1 punto)
# 8.1: guarde su script y pongale su apellido y luego nombre (1 punto)
# 8.2: envie su script, la base inicial, la base limpia y el proyecto a (1 punto): 
# a) semunoz@uahurtado.cl; Fran.roco21@gmail.com 
# envielo como tarea por teams 
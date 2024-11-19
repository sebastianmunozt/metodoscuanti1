# Prueba 2 - Métodos Cuantitativos en R

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

#1.2. importe la base "antropologia_2023.xlsx", recuerde desde donde debe empezar a leer (1,5 puntos)
#asígnela a un objeto llamado antropo_2023


# 2. Renombre las siguientes variables específicas, y guarde los cambios en la base de datos 
# antropo_2023 
# Pista: utilice la función rename (2 puntos)

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


#2.1 Observe como quedaron las categorías de su base de datos con names () (0,5 puntos)


#3. Exporte su base de datos
# Guarde la base antropo_2023 como antropo_2023_limpia en formato xlsx (1 punto)

# Ejecute el siguiente código para borrar los objetos de su environment (0,2 puntos)
rm(list=ls())


#####  Segunda parte: tidyverse  ---------------------------
# 1) Importe su base creada en la parte 1 "antropo_2023_limpia.xlsx" nombrela base como antropo_limpia (0,5 puntos)


# 2) cree una base en donde realice una selección considerando los nombres de las variables
# genero, edad, tipo de colegio, educación de la madre y clase social subjetiva
# denomine al objeto base_nombres (2 puntos)


#2.1) Compruebe si está bien realizada mediante names() (0,5 puntos)


#3.1) A partir de la base original: antropologia_limpia
# cree una base en donde realice un filtro, que permita quedarse sólo con los estudiantes que se perciben como clase media
# esto es contestaron: "Al grupo de clase social media" en la variable "clase_social_subjetiva" 
# a esta nueva base pongale antropologia_clasemedia (2 puntos)

#Pista: recuerde usar unique() para ver el nombre de las categorías de las variables y
# tenga cuidado con las mayúsculas, recuerde que R es case sensitivo a esas diferencias.


# 3.2) Compruebe lo realizado, mediante una tabla: ¿Cuántos casos tiene base_filtrada? (0,5 puntos)
# Siga formato: table(base$variable)



# A continuación: Realizará los pasos para construir un gráfico -----------
# 4. Utilizando la base de datos "antropo_limpia" realice una tabla  de frecuencias con la variable clase_social_subjetiva
# Guarde la tabla en un objeto llamado frecuencia_clase_social (1 punto)

# 5. con esa tabla de frecuencias cree una tabla en porcentajes con el siguiente código:
#   prop.table(frecuencia_clase_social) * 100 y asignela a un objeto denominado "porcentajes_clases" (1 punto)


# 6. transforme esta tabla a data frame con la función as.data.frame(), el dataframe se debe seguir llamando porcentaje_clases
#es necesario convertir la tabla en dataframe para el gráfico. (1 punto)


# 7. realice un gráfico de barras usando el data frame porcentaje_clases (3 puntos)
#rellenando el siguiente código según corresponda:


ggplot(data =___________, aes(x = ________, y =__________, fill = Var1)) +
  geom_bar(stat = "identity", fill = "#faad3e") +
  theme(axis.text.x = element_text(angle = 70, hjust = 1)) +
  labs(title = "Gráfico de Barras de Clase social subjetiva", x = "___________", y = "_________") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))





# 8.0: Observe el orden de su script dejando sólo lo necesario. Dejelo limpio y completo (1 punto)
# 8.1: guarde su script y pongale su apellido y luego nombre (1 punto)
# 8.2: envie su script, la base inicial, la base limpia y el proyecto a (1 punto): 
# a) semunoz@uahurtado.cl; Fran.roco21@gmail.com 
# envielo como tarea por teams 
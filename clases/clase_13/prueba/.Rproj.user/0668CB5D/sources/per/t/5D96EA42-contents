
#Ejemplo de script

#01. Nociones básicas: 
  
nuevo_objeto <- c(1,2,3,4) #esto me permite asignar
class(nuevo_objeto) # esto me permite observar tipo de objeto guardado en el entorno
sum () # esto me permite hacer sumatoria de valores al interior de objeto, si es son variables cuanti
NA # esto me indica valores perdidos 
ls () # esto lista los objetos del entorno
rm () # esto borra objetos específicos del entorno
rm (list =ls ()) # esto borra todos los objetos del entorno


#02. Funciones básicas de data.frame
#creo vectores
variable1 <- c(1:3)
variable2 <- c("juan", "pedro", "ale")

#a partir de vectores genero un data.frame
base <- data.frame(variable1, variable2)

#03. observación y transformación inicial de base
dim(base) # dimensiones de la base (cantidad de filas y columnas)
length(base) # cantidad de columnas de base
names(base) # nombre de columnas o variables
unique(base$variable) # categorías de variable en particular, $ ingresa a variable
table(base$variable) # frecuencias de variable en particular
glimpse(base) # listado de variables, clase de variable, primeros resultados


#04. Navegar en datos de base mediante $ 
base$variable #Entrega valor de columna/variable entera
class(base$variable) # aplicar función class en variable específica del data.frame
table(base$variable) # aplicar función table en variable específica del data.frame
mean(base$variable) # aplicar función media en variable específica del data.frame, solo variables cuanti!


#05. Flujo de trabajo 

#a) abrir proyectos → install.packages("paquete") → library(paquete)→ traer base
#b) pertura de archivos: según tipo de archivo: deber cargar la librería cuando corresponda

read.table (file=”ruta de archivo”, header = T, na.strings = “?”)
readRDS (file=“ruta_del_archivo/nombre_de_archivo.RDS”, otros parámetros (con tab)): de RBase; archivo:.RDS    
read.xlsx (xlsxFile=“ruta_del_archivo/nombre_de_archivo.xlsx”, otros parámetros (con tab)) de openxlsx; archivo:.xlsx   
read_excel (file=“ruta_del_archivo/nombre_de_archivo.xls”, otros parámetros (con tab)) de readxl; archivo: .xls 
read_dta (file=“ruta_del_archivo/nombre_de_archivo.dta”, otros parámetros (con tab)) de haven; archivo .dta    	
read_spss (file=“ruta_del_archivo/nombre_de_archivo.sav”, otros parámetros (con tab)) de haven; archivo: .sav    
	  
#c) Exportación de archivos
#cada paquete tiene función y parametros específicos para salvar base trabajada, en general comienza con write
write.xlsx(x = objeto_resultados,file = "ruta_de/archivo_de_exportacion.xlsx")
saveRDS (x=objeto_base_de_datos_en_ambiente, file= “ruta_de/archivo_de_exportacion.RDS”)
write.csv(x= objeto_base_de_datos_en_ambiente, file = "ruta_de/archivo_de_exportacion.csv",   sep = "con que se va a separar")
write.csv2(x= objeto_base_de_datos_en_ambiente, file = "archivo_de_exportacion2.csv",   sep = ",")

#06. Tidyverse: paquete de paquetes que homogeniza códigos para hacerlos más cotidianos
#a) Estructura básica

Dónde_quiero hacer_algo (base)  %>%
  Qué_quiero_hacer_1 () %>%
  Qué_quiero_hacer_2 ()

#b) Funciones

#(a)  Select () : seleccionar/descartar columnas/variables

base_de_datos_nueva  <- base_de_datos_original %>%
select(variable_1, variable_2) # por nombre de variables

select (1, 2) # según posición de variable
select (1:2) # por un rango de posiciones
select (start_with ("id")) # variables que empiecen con "id"
select (ends_with ("id")) # variables que terminen con "id"
select (contains() ("id")) # variables que contengan "id"

# es posible hacer selecciones combinadas
base_de_datos_nueva  <- base_de_datos_original %>%
  select(1: 2, 
         variable_3, variable_4,
         starts_with (“id1”), 
         end_with (“id2”))

#(b)  filter () : seleccionar/descartar filas/casos

#filtros individuales

base_de_datos_nueva  <- base_de_datos_original %>%
  filter (variable_1    operador (==, %in%, <,>, >=, <=, !=) valores/categorias_variable_1 (&, | ) 
          variable_2 operador valores/categorias)

filter (variable_1  %in% c(“categoria_1”, “categoria_2”)) [incluye categoría 1 y 2 de variable 1]

#	se usa %in% cuándo hay más de un valor; == es para un sólo valor


#(c) mutate: crear, editar, recodificar variables a partir de otras

#mutate en misma variable
base_de_datos_original %>%
  mutate (var_nueva = lo que se quiere obtener(en general desde variable(s) vieja(s)) [nueva variable con operación de otras variables]
          
          
#c1.case_when (): recodificar.
#ojo: [alt+fn+126:con teclado en pantalla ~]

base_de_datos_recodificada <- base_de_datos_original %>%
            select (variables de trabajo) %>%
            mutate (var_nueva1 = case_when (variable_vieja 1 == “categoría_1” ~ valor_nuevo1, 
                                            variable_vieja 1 ==  “categoría_2” ~ valor_nuevo2))  

# de categórica a numérica (e.g. recodificar edad)
          
base_de_datos_recodificada <- base_de_datos_original %>%
            select (variables de trabajo) %>%
            mutate (var_nueva1 = case_when (variable_1 %in% c(0:18) ~  "0 a 18",
                                            variable_1%in% c(19:29) ~ "19 a 29",
                                            variable_1 >= 30 ~ "30 o más"))

 
#07. Ggplot
#Proceso 1: Genero una tabla de frecuencias y lo transformo a data.frame
          
#1) realizo la tabla a graficar
tabla_frecuencia <- table(datos$genero)
df_tabla_frecuencia <- as.data.frame(tabla_frecuencia) # transformo a data.frame
df_tabla_frecuencia #observo tabla
          
 #2) realizo gráfico
ggplot(data = df_tabla_frecuencia, aes(x = Var1, y = Freq)) + # ver que variable 
geom_bar(stat = "identity", fill = "blue") + #puedo cambiar el color en fill
labs(title = "Gráfico de Barras de Género", x = "Género", y = "Frecuencia") #le pongo las etiquetas correspondientes

 

#Proceso 2: porcentajes
#1) Crear la tabla de frecuencia
tabla_frecuencia <- table(datos$genero)
          
#2) Creo tabla de porcentajes
 porcentajes <- prop.table(tabla_frecuencia) * 100
 df_porcentajes <- data.frame(porcentajes) # transformo a data.frame
df_porcentajes #observo tabla
          
#3) realizo gráfico
ggplot(data = df_porcentajes, aes(x = Var1, y = Freq)) +
(stat = "identity", fill = "blue") +
labs(title = "Gráfico de Barras de Género", x = "Género", y = "Porcentaje (%)") +
scale_y_continuous(labels = scales::percent_format(scale = 1)) # pasa a formato porcentaje






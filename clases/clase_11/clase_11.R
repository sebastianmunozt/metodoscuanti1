
#Clase 10: Data Wranglig y ggplot 2

# I. Limpieza de bases de datos
# 01. Apertura de base --------------------------------------------------------
library(openxlsx) #para abrir xlsx

#Importar el archivo y la asigno en el environment
#Abra base: Encuesta Estudiantes Antropología 2023 (respuestas).xlsx, que está en base
datos <- read.xlsx()
#datos <- read.xlsx(xlsxFile = "base/Encuesta Estudiantes Antropología 2023 (respuestas).xlsx", startRow = 2)


# 02. Limpieza de nombres de variables ------------------------------------

names(datos) #observo las variables 
# hay puntos, mayúsculas y minúsculas, etcétera. Está sucia

# Janitor
#install.packages("janitor")
library(janitor)

datos <- janitor::clean_names(datos) #con esto transformo todo a minúscula, quito tildes, saco signos, borro espacios

names(datos) #vuelvo a observar las variables


# Renombrar variables -----------------------------------------------------

#extraigo el nombre de todas las variables
names (datos)

#Para comentar (#) toda una fila: ctl+shift+c
# [1] "marca_temporal"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
# [2] "p02_edad_del_a_entrevistado"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
# [3] "p03_genero_del_a_entrevistado_a"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
# [4] "p04_ano_en_que_se_encuentra_de_la_carrera_1_2_3_4_5"                                                                                                                                                                                                                                                                                                                                                                                                                                 
# [5] "p05_comuna_actual_de_residencia"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
# [6] "p06_comuna_de_residencia_de_su_familia_nuclear_padres_hermanos_as_u_otros_as_cuidadores_o_en_la_que_vivio_la_mayor_parte_de_infancia_y_adolescencia"                                                                                                                                                                                                                                                                                                                                 
# [7] "p07_ultimo_tipo_de_establecimiento_educativo_en_que_realizo_su_ensenanza_media"                                                                                                                                                                                                                                                                                                                                                                                                      
# [8] "p08_puntaje_final_obtenido_en_la_prueba_de_seleccion_universitaria_ponderado_segun_carrera_elegida"                                                                                                                                                                                                                                                                                                                                                                                  
# [9] "p09_cual_de_estas_situaciones_describe_mejor_su_actividad_principal_durante_el_ultimo_mes"                                                                                                                                                                                                                                                                                                                                                                                           
# [10] "p10_indique_el_maximo_nivel_educativo_alcanzado_por_su_madre"                                                                                                                                                                                                                                                                                                                                                                                                                        
# [11] "p11_actualmente_su_madre_trabaja"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
# [12] "p12_cual_es_la_ocupacion_u_oficio_actual_de_su_madre_describa_las_principales_tareas_y_funciones_en_el_puesto_de_trabajo_actual_de_su_madre"                                                                                                                                                                                                                                                                                                                                         
# [13] "p13_indique_el_maximo_nivel_educativo_alcanzado_por_su_padre"                                                                                                                                                                                                                                                                                                                                                                                                                        
# [14] "p14_actualmente_su_padre_trabaja"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
# [15] "p15_cual_es_la_ocupacion_u_oficio_actual_de_su_padre_describa_las_principales_tareas_y_funciones_en_el_puesto_de_trabajo_actual_de_su_padre"                                                                                                                                                                                                                                                                                                                                         
# [16] "p17_quien_es_el_principal_sostenedor_a_de_su_hogar_actual_quien_aporta_mas_al_presupuesto_mensual"                                                                                                                                                                                                                                                                                                                                                                                   
# [17] "p18_en_la_sociedad_comunmente_existen_distintos_grupos_o_clases_sociales_las_personas_de_clase_social_alta_son_las_que_tienen_los_ingresos_mas_altos_el_mayor_nivel_de_educacion_y_los_trabajos_mas_valorados_las_personas_de_clase_social_baja_son_las_que_tienen_los_ingresos_mas_bajos_el_menor_nivel_de_educacion_y_los_trabajos_menos_valorados_entre_estas_clases_existen_otras_intermedias_segun_su_opinion_a_cual_de_los_siguientes_grupos_o_clases_sociales_pertenece_usted"
# [18] "p19_actualmente_en_su_casa_tienen_computador_ya_sea_notebook_o_de_escritorio"                                                                                                                                                                                                                                                                                                                                                                                                        
# [19] "p20_actualmente_usted_tiene_computador_para_uso_personal_ya_sea_notebook_o_de_escritorio"                                                                                                                                                                                                                                                                                                                                                                                            
# [20] "p21_actualmente_usted_tiene_smartphone_personal"                                                                                                                                                                                                                                                                                                                                                                                                                                     
# [21] "p22_con_que_frecuencia_escucha_musica"                                                                                                                                                                                                                                                                                                                                                                                                                                               
# [22] "p23_que_tipo_de_musica_es_la_que_mas_prefiere_escuchar_aun_cuando_escuche_mas_de_un_estilo_elija_el_que_mas_escuche"                                                                                                                                                                                                                                                                                                                                                                 
# [23] "p24_si_eligio_otra_cual"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
# [24] "p25_cual_es_la_segunda_musica_que_mas_prefiere_escuchar"                                                                                                                                                                                                                                                                                                                                                                                                                             
# [25] "p26_si_eligio_otra_cual"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
# [26] "p27_con_que_dispositivo_suele_escuchar_mas_musica"                                                                                                                                                                                                                                                                                                                                                                                                                                   
# [27] "p28_cual_es_principal_sitio_programa_o_aplicacion_para_bajar_o_escuchar_musica"                                                                                                                                                                                                                                                                                                                                                                                                      
# [28] "p29_si_respondio_otro_cual"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
# [29] "p30_cual_es_la_red_social_en_que_pasa_mas_tiempo"                                                                                                                                                                                                                                                                                                                                                                                                                                    
# [30] "p31_si_respondio_otra_cual"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
# [31] "p32_y_cual_es_la_segunda_red_social_en_que_pasa_mas_tiempo"                                                                                                                                                                                                                                                                                                                                                                                                                          
# [32] "p33_si_respondio_otra_cual"                                                                                                                                                                                                                                                                                                                                                                                                                                                          


#existen nombres de variables muy largos, los quiero acortar.

# genero un vector con todas las columnas que quiero renombrar
cols_a_renombrar <- c( 
"marca_temporal",
"p02_edad_del_a_entrevistado",
"p03_genero_del_a_entrevistado_a",
"p04_ano_en_que_se_encuentra_de_la_carrera_1_2_3_4_5",
"p05_comuna_actual_de_residencia",
"p06_comuna_de_residencia_de_su_familia_nuclear_padres_hermanos_as_u_otros_as_cuidadores_o_en_la_que_vivio_la_mayor_parte_de_infancia_y_adolescencia",
"p07_ultimo_tipo_de_establecimiento_educativo_en_que_realizo_su_ensenanza_media",
"p08_puntaje_final_obtenido_en_la_prueba_de_seleccion_universitaria_ponderado_segun_carrera_elegida",
"p09_cual_de_estas_situaciones_describe_mejor_su_actividad_principal_durante_el_ultimo_mes",
"p10_indique_el_maximo_nivel_educativo_alcanzado_por_su_madre",
"p11_actualmente_su_madre_trabaja",
"p12_cual_es_la_ocupacion_u_oficio_actual_de_su_madre_describa_las_principales_tareas_y_funciones_en_el_puesto_de_trabajo_actual_de_su_madre",
"p13_indique_el_maximo_nivel_educativo_alcanzado_por_su_padre",
"p14_actualmente_su_padre_trabaja",
"p15_cual_es_la_ocupacion_u_oficio_actual_de_su_padre_describa_las_principales_tareas_y_funciones_en_el_puesto_de_trabajo_actual_de_su_padre",
"p17_quien_es_el_principal_sostenedor_a_de_su_hogar_actual_quien_aporta_mas_al_presupuesto_mensual",
"p18_en_la_sociedad_comunmente_existen_distintos_grupos_o_clases_sociales_las_personas_de_clase_social_alta_son_las_que_tienen_los_ingresos_mas_altos_el_mayor_nivel_de_educacion_y_los_trabajos_mas_valorados_las_personas_de_clase_social_baja_son_las_que_tienen_los_ingresos_mas_bajos_el_menor_nivel_de_educacion_y_los_trabajos_menos_valorados_entre_estas_clases_existen_otras_intermedias_segun_su_opinion_a_cual_de_los_siguientes_grupos_o_clases_sociales_pertenece_usted",
"p19_actualmente_en_su_casa_tienen_computador_ya_sea_notebook_o_de_escritorio",
"p20_actualmente_usted_tiene_computador_para_uso_personal_ya_sea_notebook_o_de_escritorio",
"p21_actualmente_usted_tiene_smartphone_personal",
"p22_con_que_frecuencia_escucha_musica",
"p23_que_tipo_de_musica_es_la_que_mas_prefiere_escuchar_aun_cuando_escuche_mas_de_un_estilo_elija_el_que_mas_escuche",
"p24_si_eligio_otra_cual",
"p25_cual_es_la_segunda_musica_que_mas_prefiere_escuchar",
"p26_si_eligio_otra_cual",
"p27_con_que_dispositivo_suele_escuchar_mas_musica",
"p28_cual_es_principal_sitio_programa_o_aplicacion_para_bajar_o_escuchar_musica",
"p29_si_respondio_otro_cual",
"p30_cual_es_la_red_social_en_que_pasa_mas_tiempo",
"p31_si_respondio_otra_cual",
"p32_y_cual_es_la_segunda_red_social_en_que_pasa_mas_tiempo",
"p33_si_respondio_otra_cual") 


#Extraer las primeras letras de variables: hacerlas más sencillas para procesar.
library(tidyverse)

#genero un vector sólo con las 3 primeras letras: p01
nuevos_nombres <- str_sub(string = cols_a_renombrar, start = 1, end = 3) 
nuevos_nombres

#primer argumento - string = de donde saco los nombres: el vector creado
#segundo argumento - start = desde que posición extraigo (p)
#tercer argumento - end= hasta donde (1)


#renombro considerando todas las columnas elegidas asignando nuevos nombres
datos <- datos %>%
  rename_at(vars(cols_a_renombrar), ~ nuevos_nombres) #recodificación múltiples con un vector

#rename_at: renombra las siguientes columnas y ponle estos nombres
#cols_a_renombrar: son las columnas a renombrar
#~: es el signo que me indica una relación de transformación
#nuevos nombres: son los nuevos nombres que van adquirir las variables

names(datos)

#renombro algunas variables en específico
#posibilidad de renombrar uno por uno las variables de interés. 
libro_códigos <- read.xlsx(xlsxFile = "base/Encuesta Estudiantes Antropología 2023 (respuestas).xlsx", startRow = 2)
names(libro_códigos)

datos <- datos %>% dplyr::rename(  # primero nuevo nombre y luego nombre antiguo
                        edad = p02, 
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

names(datos)



# 03. Transformación de variables ---------------------------------------------

# 03.1 Transformaciones/limpieza en variables numéricas
names(datos)


#Limpieza inicial de variables numéricas
#Voy revisando variable por variable como viene

#edad: elimino letras en una variable que debería ser sólo de números
table(datos$edad) # vemos el ingreso de una variable que dice "años"
class (datos$edad) # Se considera "character"

datos$edad <- as.numeric(gsub("[^0-9]+", "", datos$edad)) # elimino todo lo que no es número

#explicación: 
# [^0-9] busca cualquier secuencia de caracteres que no sean dígitos (0-9) 
# los reemplaza con una cadena vacía "". 
# elimina cualquier carácter que no sea numérico de la columna "edad"
# as.numeric: transforma en numérico. 

class (datos$edad) # compruebo si es numérico
table(datos$edad) # observo como quedó variable


#recodificación de edad: paso de numérico a ordinal
#uso de mutate: 
#estructura:

#base de datos
# %>% 
# mutate ()
# nombre de la variable nueva
# = (sólo uno, cuándo asignamos; lógicamente dos)
# y lo que se quiere obtener


# uso del case_when () recodifica
#recodificación: de valores de variable

datos <- datos %>% 
  mutate (edadr= case_when (edad %in% c(18:20) ~ "18 a 20", 
                            edad %in% c(21:23) ~ "21 a 23", 
                            edad >= 24 ~ "24 o más"))
# compare:
table(datos$edad)
table(datos$edadr)

#práctica: siguiendo el modelo anterior, realice otra recodificación.


# 03.2 Transformaciones/limpieza en variables cualitativas
table(datos$genero)
table(datos$annio)
table(datos$comuna_actual) #que cosa rara observa? 
table(datos$comuna_pre) #que cosa rara observa? 


#¿Cómo homogeneizo los valores escritos?
#Algunos tienen mayúsculas y minusculas en diversas letras
#Algunos usan tildes y otros no
#Uno escribe Santiago y otro Santiago centro



#saco caracteres típicos del español (ñ), elimino comas y espacios y pongo todo en minúscula

datos <- datos %>%
  mutate(comuna_actual = stringi::stri_trans_general(comuna_actual, "Latin-ASCII"), # borra tildes y ñ
         comuna_actual = tolower (comuna_actual), # transforma en minuscula
         comuna_actual = gsub(" ", "_", comuna_actual)) #cambia espacios a_

#ObservO
table(datos$comuna_actual) 

#¿Cómo lo realizo en comuna pre?
#práctica: haga lo mismo con comuna_pre

#realice lo mismo con comuna_pre
#lupita
#In selection
#Replace: All
#comuna_actual por comuna_pre


# datos <- datos %>%
#   mutate(comuna_pre = stringi::stri_trans_general(comuna_pre, "Latin-ASCII"), # borra tildes y ñ
#          comuna_pre = tolower (comuna_pre), # transforma en minuscula
#          comuna_pre = gsub(" ", "_", comuna_pre)) #cambia espacios a_


#observo
table(datos$comuna_pre)


#Ahora transformo valores escritos de forma distinta:
table(datos$comuna_actual)

#recodifico
datos <- datos %>%
  mutate(comuna_actual = recode(comuna_actual,
                             "puente_alto_" = "puente_alto",
                             "santiago_centro" = "santiago",
                             "san_felipe,_v_region" = "san felipe", 
                             "paine_" = "paine"))
table(datos$comuna_actual) 



#recodifico comuna pre
table(datos$comuna_pre)

datos <- datos %>%
  mutate(comuna_pre = recode(comuna_pre,
                                "independencia_" = "independencia",
                                "los_andes,_los_andes" = "los_andes",
                                "los_andes,_v_region" = "los_andes", 
                                "paine_" = "paine",
                                "pudahuel_(santiago)_y_penaflor_" = "pudahuel", 
                                "puente_alto_y_penalolen." = "puente_alto", 
                                "puente_alto_" = "puente_alto"
                             ))
table(datos$comuna_pre) 

#¿qué es asies?


#práctica: 
#para empleo_madre y empleo padre
#saque caracteres típicos del español (ñ), elimino comas y espacios y pongo todo en minúscula
names(datos)

unique(datos$empleo_madre)
unique(datos$empleo_padre)
table(datos$empleo_madre)
table(datos$empleo_padre)


#recodificación de puntaje
unique(datos$puntaje)
class(datos$puntaje)

datos$puntaje <- as.numeric(gsub("[^0-9]+", "", datos$puntaje)) 

unique(datos$puntaje)
options(scipen = 999) #elimino notación científica

unique(datos$puntaje)



datos <- datos %>%
  mutate(puntajer = case_when(
    puntaje == 500600 ~ 550,
    puntaje == 437442684540688 ~ 500,
    TRUE ~ puntaje  # Mantener los valores no recodificados
  ))


unique(datos$puntajer)

#observo otra variables de interés
names(datos)
table(datos$tipo_colegio)
table(datos$clase_social_subjetiva)


# Exportar ----------------------------------------------------------------
# Finalmente guardo mi base

dir.create(path = "output")
write.xlsx(x = datos,file = "output/Encuesta_Antropología_Limpia.xlsx")



# III. Gráficar con {ggplot} ---------------------------------------------------

#lógica de cebolla anidando las capas con el signo +

ggplot(data= base_a_utilizar, aes(x = variable_1, y = variable_2, 
                                  color =variable_que distingue_color, 
                                  fill=variable_que_rellena,)) + #de donde salen los datos, cuales son las variables
  geom_algo()+ #qué tipo de gráfico se va a realizar?
  labs () + #cuales serán los títulos?
  guides()+ #cuadrado donde se mostrarán una descripción de categorías
  theme_() #se utilizará un tema global?

#Proceso 1: Frecuencias
#1) realizo la tabla a graficar
tabla_frecuencia <- table(datos$genero)
df_tabla_frecuencia <- as.data.frame(tabla_frecuencia) # transformo a data.frame
df_tabla_frecuencia #observo tabla

#2) realizo gráfico
ggplot(data = df_tabla_frecuencia, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Gráfico de Barras de Género", x = "Género", y = "Frecuencia")

#data: ¿que tabla/base utilizo?
#aes: de esa tabla que datos utilizo como ejes
#geom_bar: grágico de barras
#stat="identity"
#labs= title: Título, x= variable 1; y: variable 2


#Práctica: 
#Use el mismo gráfico, pero pongale color rojo ("red") y cambie X = Freq e Y= Var1
ggplot(data = df_tabla_frecuencia, aes(x = ______, y = _____)) +
  geom_bar(stat = "identity", fill = "_____") +
  labs(title = "Gráfico de Barras de Género", x = "_______", y = "_______")


#Proceso 2: porcentajes
#1) Crear la tabla de frecuencia
tabla_frecuencia <- table(datos$genero)

#2) Creo tabla de porcentajes
porcentajes <- prop.table(tabla_frecuencia) * 100
df_porcentajes <- data.frame(porcentajes) # transformo a data.frame
df_porcentajes #observo tabla

#3) realizo gráfico
ggplot(data = df_porcentajes, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Gráfico de Barras de Género", x = "Género", y = "Porcentaje (%)") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) # pasa a formato porcentaje


#Práctica: 
#Use el mismo gráfico, pero pongale color verde ("green") y cambie X = Freq e Y= Var1
ggplot(data = df_porcentajes, aes(x = _____, y = ___)) +
  geom_bar(stat = "identity", fill = "___") +
  labs(title = "Gráfico de Barras de Género", x = "______", y = "_______") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) # pasa a formato porcentaje


#4) voy puliendo gráfico
#a) agrego un tema y cambio colores

ggplot(data = df_porcentajes, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  labs(title = "Gráfico de Barras de Género", x = "Género", y = "Porcentaje (%)") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal() +  # Aplicar un tema minimal
  scale_fill_brewer() # Usar una paleta de colores Brewer

#práctica: utilice
#thema: linedraw
#scale_fill: discrete

ggplot(data = df_porcentajes, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  labs(title = "Gráfico de Barras de Género", x = "Género", y = "Porcentaje (%)") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_() +  
  scale_()


#b) elimino etiquetas, nombre de ejes y le pongo angulo de textos
ggplot(data = df_porcentajes, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  labs(title = "Gráfico de Barras de Género", caption = "fuente: Prueba Piloto: II Encuesta Estudiantes Antropología UAH") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal() +  # Aplicar un tema minimal
  scale_fill_brewer(palette = "Set3")  + # Usar una paleta de colores Brewer
  guides(fill = "none")+ #elimino cuadro de etiquetas
  xlab("") + ylab("") + #elimino nombre de ejes 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 



#Ejemplo 2
#Comuna actual 
names(datos)

#realizo tablas para hacer gráfico
tabla_frecuencia <- table(datos$comuna_actual)
df_tabla_frecuencia <- as.data.frame(tabla_frecuencia) # transformo a data.frame
df_tabla_frecuencia #observo tabla

#realizo gráfico básico
#gráfico por defecto
ggplot(data = df_tabla_frecuencia, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") 


#ordeno gráfico
ggplot(data = df_tabla_frecuencia, aes(x = fct_reorder (Var1, Freq), y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", fill = "grey") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 



#cambio de orden
ggplot(data = df_tabla_frecuencia, aes(x = fct_reorder (Var1, Freq), y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", fill = "grey") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip()


#elimino guides
ggplot(data = df_tabla_frecuencia, aes(x = fct_reorder (Var1, Freq), y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip()+ 
  theme_minimal() +  # Aplicar un tema minimal
  scale_fill_viridis_d()  + # Usar una paleta de colores Brewer
  guides(fill = "none")+ #elimino cuadro de etiquetas
  xlab("") + ylab("") 


#Práctica: 
#Realice un gráfico de barras con proporciones de la variable estudio_trabajo

#Proceso 2: porcentajes
#1) Crear la tabla de frecuencia

#2) Creo tabla de porcentajes

#3) realizo gráfico

#4) voy puliendo gráfico
#a) agrego un tema y cambio colores

#b) elimino etiquetas, nombre de ejes y angulo de textos


#Tarea--------------------------------------------------------------------------

#1. Importar base y cargar paquetes
#Importe la base "Encuesta Estudiantes Antropología 2023 (respuestas).xlsx", que está en la carpeta "base"
#asígnela a un objeto llamado antropo_2023

#2. Limpieza de nombres de variables:

# 2.1 Limpie el nombre de las variables con la función clean_names del paquete janitor
# 2.2 Genere un vector con todos los nombres de las variables (columnas)  
# Hint:  primero utilice la función names y luego cree el vector con los nombres y 
# denominelo vars_a_cambiar (este objeto sólo contiene el nombre de las variables)
# 2.3 Genere un vector sólo con las 3 primeras letras de la variables y denominelo nuevos_nombres
# Hint: utilice la función str_sub()
# 2.4 Renombre las variables antiguas utilizando el vector "nuevos_nombres" reescribiendo la base de datos "antropo_2023"
# Hint: utilice la función rename_at
# 2.5 Renombre las siguientes variables específicas utilizando el siguiente código
# antropo_2023 <- antropo_2023 %>% dplyr::rename(
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
#   clase_social_subjetiva = p18)

#3. Exporte su base de datos
# Guarde la base antropo_2023 como antropo_2023_limpia en formato xlsx en la carpeta output

#4. Gráficos

# 4.1 Utilizando la base de datos "antropo_2023_limpia" realice una tabla de frecuencias con la variable tipo_colegio
#     Guarde la tabla en un objeto llamado frecuencia_tipo_colegio
# 4.2 con esa tabla de frecuencias cree una tabla en porcentajes con el siguiente código:
#   prop.table(frecuencia_tipo_colegio) * 100 y asignela a un objeto denominado "porcentajes_colegios"
# 4.3 realice un gráfico de barras rellenando el siguiente código según corresponda:
#
# ggplot(data = ____, aes(x = ____, y = Freq)) +
#   geom_bar(stat = "identity", fill = "red") +
#   labs(title = "Gráfico de Barras de tipo de establecimiento", x = "Tipo de establecimiento", y = "Porcentaje (%)") +
#   scale_y_continuous(labels = scales::percent_format(scale = 1)) 

















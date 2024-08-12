#Tarea--------------------------------------------------------------------------

#1. Importar base y cargar paquetes
#Importe la base "Encuesta Estudiantes Antropología 2023 (respuestas).xlsx", que está en la carpeta "base"
#asígnela a un objeto llamado antropo_2023
library(openxlsx)
antropo_2023 <- read.xlsx(xlsxFile = "base/Encuesta Estudiantes Antropología 2023 (respuestas).xlsx", startRow = 2)

#2. Limpieza de nombres de variables:
# 2.1 Limpie el nombre de las variables con la función clean_names del paquete janitor
antropo_2023 <- janitor::clean_names(antropo_2023)
names(antropo_2023)

# 2.2 Genere un vector con todos los nombres de las variables (columnas)  
# Hint:  primero utilice la función names y luego cree el vector con los nombres y 
# denominelo vars_a_cambiar (este objeto sólo contiene el nombre de las variables)
vars_a_cambiar <- c(
  "marca_temporal",                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  "p02_edad_del_a_entrevistado"  ,                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  "p03_genero_del_a_entrevistado_a"   ,                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  "p04_ano_en_que_se_encuentra_de_la_carrera_1_2_3_4_5"   ,                                                                                                                                                                                                                                                                                                                                                                                                                              
  "p05_comuna_actual_de_residencia"      ,                                                                                                                                                                                                                                                                                                                                                                                                                                               
  "p06_comuna_de_residencia_de_su_familia_nuclear_padres_hermanos_as_u_otros_as_cuidadores_o_en_la_que_vivio_la_mayor_parte_de_infancia_y_adolescencia" ,                                                                                                                                                                                                                                                                                                                                
  "p07_ultimo_tipo_de_establecimiento_educativo_en_que_realizo_su_ensenanza_media"         ,                                                                                                                                                                                                                                                                                                                                                                                             
  "p08_puntaje_final_obtenido_en_la_prueba_de_seleccion_universitaria_ponderado_segun_carrera_elegida"        ,                                                                                                                                                                                                                                                                                                                                                                          
  "p09_cual_de_estas_situaciones_describe_mejor_su_actividad_principal_durante_el_ultimo_mes" ,                                                                                                                                                                                                                                                                                                                                                                                          
  "p10_indique_el_maximo_nivel_educativo_alcanzado_por_su_madre"   ,                                                                                                                                                                                                                                                                                                                                                                                                                     
  "p11_actualmente_su_madre_trabaja"   ,                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  "p12_cual_es_la_ocupacion_u_oficio_actual_de_su_madre_describa_las_principales_tareas_y_funciones_en_el_puesto_de_trabajo_actual_de_su_madre"   ,                                                                                                                                                                                                                                                                                                                                      
  "p13_indique_el_maximo_nivel_educativo_alcanzado_por_su_padre"   ,                                                                                                                                                                                                                                                                                                                                                                                                                     
  "p14_actualmente_su_padre_trabaja"        ,                                                                                                                                                                                                                                                                                                                                                                                                                                            
  "p15_cual_es_la_ocupacion_u_oficio_actual_de_su_padre_describa_las_principales_tareas_y_funciones_en_el_puesto_de_trabajo_actual_de_su_padre"    ,                                                                                                                                                                                                                                                                                                                                     
  "p17_quien_es_el_principal_sostenedor_a_de_su_hogar_actual_quien_aporta_mas_al_presupuesto_mensual"     ,                                                                                                                                                                                                                                                                                                                                                                              
  "p18_en_la_sociedad_comunmente_existen_distintos_grupos_o_clases_sociales_las_personas_de_clase_social_alta_son_las_que_tienen_los_ingresos_mas_altos_el_mayor_nivel_de_educacion_y_los_trabajos_mas_valorados_las_personas_de_clase_social_baja_son_las_que_tienen_los_ingresos_mas_bajos_el_menor_nivel_de_educacion_y_los_trabajos_menos_valorados_entre_estas_clases_existen_otras_intermedias_segun_su_opinion_a_cual_de_los_siguientes_grupos_o_clases_sociales_pertenece_usted",
  "p19_actualmente_en_su_casa_tienen_computador_ya_sea_notebook_o_de_escritorio" ,                                                                                                                                                                                                                                                                                                                                                                                                       
  "p20_actualmente_usted_tiene_computador_para_uso_personal_ya_sea_notebook_o_de_escritorio"      ,                                                                                                                                                                                                                                                                                                                                                                                      
  "p21_actualmente_usted_tiene_smartphone_personal"   ,                                                                                                                                                                                                                                                                                                                                                                                                                                  
  "p22_con_que_frecuencia_escucha_musica"    ,                                                                                                                                                                                                                                                                                                                                                                                                                                           
  "p23_que_tipo_de_musica_es_la_que_mas_prefiere_escuchar_aun_cuando_escuche_mas_de_un_estilo_elija_el_que_mas_escuche"   ,                                                                                                                                                                                                                                                                                                                                                              
  "p24_si_eligio_otra_cual"    ,                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  "p25_cual_es_la_segunda_musica_que_mas_prefiere_escuchar"     ,                                                                                                                                                                                                                                                                                                                                                                                                                        
  "p26_si_eligio_otra_cual" ,                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  "p27_con_que_dispositivo_suele_escuchar_mas_musica"      ,                                                                                                                                                                                                                                                                                                                                                                                                                             
  "p28_cual_es_principal_sitio_programa_o_aplicacion_para_bajar_o_escuchar_musica"       ,                                                                                                                                                                                                                                                                                                                                                                                               
  "p29_si_respondio_otro_cual"  ,                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  "p30_cual_es_la_red_social_en_que_pasa_mas_tiempo"  ,                                                                                                                                                                                                                                                                                                                                                                                                                                  
  "p31_si_respondio_otra_cual"           ,                                                                                                                                                                                                                                                                                                                                                                                                                                               
  "p32_y_cual_es_la_segunda_red_social_en_que_pasa_mas_tiempo"    ,                                                                                                                                                                                                                                                                                                                                                                                                                      
  "p33_si_respondio_otra_cual"   
)


# 2.3 Genere un vector sólo con las 3 primeras letras de la variables y denominelo nuevos_nombres
# Hint: utilice la función str_sub()
library(tidyverse)
nuevos_nombres <- str_sub(string = vars_a_cambiar, start = 1, end = 3) 
nuevos_nombres


# 2.4 Renombre las variables antiguas utilizando el vector "nuevos_nombres" reescribiendo la base de datos "antropo_2023"
# Hint: utilice la función rename_at

antropo_2023 <- antropo_2023 %>%
  rename_at(vars(vars_a_cambiar), ~ nuevos_nombres)


# 2.5 Renombre las siguientes variables específicas utilizando el siguiente código
antropo_2023 <- antropo_2023 %>% dplyr::rename(
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

#3. Exporte su base de datos
# Guarde la base antropo_2023 como antropo_2023_limpia en formato xlsx en la carpeta output

dir.create(path = "resultados") #genera una carpeta desde mi proyecto
write.xlsx(x = antropo_2023,file = "resultados/antropo_2023_limpia.xlsx")

#4. Gráficos

# 4.1 Utilizando la base de datos "antropo_2023_limpia" realice una tabla de frecuencias con la variable tipo_colegio
#     Guarde la tabla en un objeto llamado frecuencia_tipo_colegio
frecuencia_tipo_colegio <- table(antropo_2023$tipo_colegio)

# 4.2 con esa tabla de frecuencias cree una tabla en porcentajes con el siguiente código:
#   prop.table(frecuencia_tipo_colegio) * 100 y asignela a un objeto denominado "porcentajes_colegios"

porcentajes_colegios <- prop.table(frecuencia_tipo_colegio) * 100
df_porcentajes <- data.frame(porcentajes_colegios)

# 4.3 realice un gráfico de barras rellenando el siguiente código según corresponda:

ggplot(data = df_porcentajes, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Gráfico de Barras de tipo de establecimiento", x = "Tipo de establecimiento", y = "Porcentaje (%)") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))
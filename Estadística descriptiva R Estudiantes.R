#### Bibliografia utilizada o vinculos consultados ####
# https://www.datanalytics.com/libro_r/index.html
# https://www.rdocumentation.org
# http://www.r-tutor.com/elementary-statistics/numerical-measures/percentile
# http://www.cavsi.com/preguntasrespuestas/cual-es-la-diferencia-entre-media-mediana-y-moda/
# https://www.universoformulas.com/estadistica/descriptiva/curtosis/
# http://www.dma.ulpgc.es/profesores/personal/stat/cursoR4ULPGC/6g-Data_frames-Listas.html
# https://cran.r-project.org/doc/contrib/grafi3.pdf

#Decisiones bajo incertidumbre en las organizaciones

#Análisis de datos para la toma de una decisión

#Paso 1: Importar y cargar las librerías requeridas

install.packages("e1071")
library(e1071)

#Paso 2: Lectura de datos

#Lea los datos del archivo "Supermarket transactions.xlsx" y asignelos a un objeto
#cuyo nombre sea "datos"

#Sugerencia: Guarde el archivo como csv (punto decimal con . y separador de campos con ,)
#y use la función read.csv. Asegurese de remover el signo $ de la columna Revenue y de
#escribir el argumento header=TRUE para que R reconozca los encabezados del archivo.

#### Asignación de datos a utilizar ####
# no logre al grabar el archivo original de .xlsx a .csv con la indicación de que el punto decimal sea (.)
# entonces me tome la libertad usar el proceso de importacion de R-Studio el cual me permtio realizar
# dicha configuración y me genera el código correspondiente para realizar el Paso 2
library(readr)
datos <- read_delim("~/github/AnalisisDatosTomaDecision/Supermarket Transactions.csv", 
                      ";", escape_double = FALSE, 
                    locale = locale(decimal_mark = ",", grouping_mark = "."), 
                    trim_ws = TRUE)

#Use la función class para ver qué tipo de objeto es "datos"
class(datos)


#Paso 3: Calculo de la estadística básica de las variables cuantitativas del dataframe

#Use la función sapply(datos, estadístico, na.rm=TRUE) (reemplace estadístico por mean,
#sd, var) para calcular la media,desviación estándar y varianza de las tres variables
#cuantitativas del dataframe. ?

#### Uso de la función sapply ####
sapply(datos[,"Children"],mean, na.rm = TRUE)
sapply(datos[,"Children"],var, na.rm = TRUE)
sapply(datos[,"Children"],sd, na.rm = TRUE)

sapply(datos[,"Units Sold"],mean, na.rm = TRUE)
sapply(datos[,"Units Sold"],var, na.rm = TRUE)
sapply(datos[,"Units Sold"],sd, na.rm = TRUE)

sapply(datos[,"Revenue"],mean, na.rm = TRUE)
sapply(datos[,"Revenue"],var, na.rm = TRUE)
sapply(datos[,"Revenue"],sd, na.rm = TRUE)

#### Pregunta 1 ####
# ¿Cuáles son esas tres variables?
#### Respuesta a cuales son las tres variables cuantitativas ####
# Children, Units Sold, Revenue


# Use la función summary(datos$Variable) 
# (reemplace Variable por Units.Sold, Children y Revenue) 
# para ver otra forma de calcular estadísticos descriptivos del dataframe. ?

#### Uso de la función summary ####
summary(datos$`Units Sold`)
summary(datos$Children)
summary(datos$Revenue)

#### Pregunta 2 ####
# ¿Qué estadísticos adicionales produce la función summary?
#### Respuesta a la función summary ####
# La función summary muestra los siguientes valores estadisticos de la variable cuantitativa
# Su valor máximo y mínimo, el promedio, la media y el 1er y 3er cuartil


#Calcule el percentil 5 y 95 de las variables Units.Sold, Children y Revenue.
#Use la función quantile(datos$Variable,c(vector con valores de percentiles)) para calcular
#los percentiles pedidos (0.05 y 0.95). Reemplace Variable por Units.Sold, Children y Revenue.

quantile(datos$`Units Sold`,c(0.05,0.95))
quantile(datos$Children,c(0.05,0.95))
quantile(datos$Revenue,c(0.05,0.95))

#### Pregunta 3 ####
#¿Cómo se interpretan los valores obtenidos?
#### Respuesta a la función quantile ####
# El valor devuelto por la función quantile para la variable evaluada en los porcentajes observados
# corresponde al 1er valor hayado en el vector ordenado de la variable en esa posición de porcentaje.


#Calcule la mediana de las variables Units.Sold, Children y Revenue
#Use la función median(datos$Variable,na.rm=TRUE) 
#(reemplace Variable por Units.Sold, Children y Revenue) 
#para calcular la mediana de dichas variables cuantitativas.

median(datos$`Units Sold`, na.rm = TRUE)
median(datos$Children, na.rm = TRUE)
median(datos$Revenue, na.rm = TRUE)
#### Pregunta 4 ####
#¿Cuál es la interpretación del valor resultante?
#### Respuesta a la función median ####
# Es el valor del centro del vector de datos ordenado (varible evaluada)
# Este valor no siempre coincide con el promedio de la variable evaluada
# Además es uno de los valores de tendencia central utilizados en la estadística
# la mediana puede ser utilizada cuando en el vector de datos existan datos atipicos (outliers)
# los cuales pueden distorcionar el promedio, por lo tanto la mediana sería mejor utilizarla


#Calcule la curtosis (cuarto momento) de las variables Units.Sold, Children y Revenue
# Use la función kurtosis(datos$Variable,na.rm=TRUE) 
# (reemplace Variable por Units.Sold, Children y Revenue) 
# para calcular la curtosis de dichas variables cuantitativas.

kurtosis(datos$`Units Sold`, na.rm = TRUE)
kurtosis(datos$Children, na.rm = TRUE)
kurtosis(datos$Revenue, na.rm = TRUE)

#### Pregunta 5 ####
# ¿Cuál es la interpretación del valor resultante?
#### Respuesta a la función kurtosis ####
# La curtosis indica que tan escarpada o achatada esta una curva de distribución.
# Entonces para los datos evaluados la interpretación sería:
# Para las variables "Units Sold y Children" que tiene un valor de -0.4381643 y -1.031539  
# indica que tienen una curtosis "Platicúrtica" con muy poca concentración de datos en la media, 
# cuya forma es achatada.
# Para la variable "Revenue" que tiene un valor de 1.390813 indica que tiene un curtosis "Leptocúrtica"
# con mucha concentración de los datos en la media, siendo una curva escarpada.


#Calcule el sesgo (tercer momento) de las variables Units.Sold, Children y Revenue

#Use la función skewness(datos$Variable,na.rm=TRUE) 
# (reemplace Variable por Units.Sold, Children y Revenue) 
# para calcular el sesgo de dichas variables cuantitativas.

skewness(datos$`Units Sold`)
skewness(datos$Children)
skewness(datos$Revenue)

#### Pregunta 6
# ¿Cuál es la interpretación del valor resultante?
#### Respuesta a la funcion skewness ####

#Cree un dataframe A que tenga las columnas Units.Sold, Children y Revenue del objeto datos

# Creo vectores con los datos
Units.Sold <- datos$`Units Sold`
Children <- datos$Children
Revenue <- datos$Revenue
# Creo el data frame con los vectores
dataFrame <- data.frame(Units.Sold,Children,Revenue)
# Elimino los vectores
rm(Units.Sold,Children,Revenue)


#Calcule la matriz de correlaciones entre las variables Units.Sold, Children y Revenue

#Use la función cor(), donde el argumento de la función es el dataframe que creó con
#las columnas Units.Sold,Children y Revenue
cor(dataFrame)


#Paso 4: Visualización

#Cree un histograma para la variable Revenue

#Use la función hist(Variable) para crear el histograma. Explore los argumentos de la
#función para asignarle algún color de relleno al histograma.
hist(dataFrame$Revenue, col = 'orange', ylab = "Frecuencia", xlab = "Ingresos", main = "Histograma de Ingresos")


# Cree un histograma para revenue según el sexo de los clientes 
# (un histograma por cada sexo). 
# Note que debe extraer por separado los datos de Revenue para los cuales el sexo es masculino y femenino.

# Crear data frame con los ingresos y el sexo
Revenue_x_Gender <- select(datos, Gender, Revenue)
# Crear data frame con los ingresos de las mujeres
Revenue_x_F <- Revenue_x_Gender %>% 
       filter(Gender == "F") %>% 
       select(Revenue)
# Crear data frama con lo ingresos de los hombre
Revenue_x_M <- Revenue_x_Gender %>% 
  filter(Gender == "M") %>% 
  select(Revenue)

# Generar Histograma para cada genero
hist(Revenue_x_F$Revenue, col = 'blue' , ylab = "Frecuencia", xlab = "Ingresos", main = "Histograma de Ingresos Muejeres")
hist(Revenue_x_M$Revenue, col = 'green', ylab = "Frecuencia", xlab = "Ingresos", main = "Histograma de Ingresos Hombres")

#Cree un diagrama de dispersión con las variables Revenue y Children. Use la función
#plot. En esta función, el primer argumento los los datos del eje horizontal y el segundo
#argmento son los datos del eje vertical.

plot(datos$Children,datos$Revenue, main = "Diagrama de dispersión", xlab = "Cantidad Hijos", ylab = "Ingresos")


# Cree un gráfico boxplot para Revenue. 
# Use la función boxplot() donde el argumento
# es el conjunto de datos al que se le hará el boxplot.
boxplot(datos$Revenue)


#Cuente la cantidad de registros que se presentaron en cada ciudad. Esto significa
#contar la cantidad de ocurrencias de cada elemento de la columna City.

#Use la función table() donde el argumento es el conjunto de datos en los que 
#va a contar la cantidad de ocurrencias de cada elemento.

Registros_x_Ciudad <-  table(datos$City)

#Haga un gráfico de la cantidad de registros que se presentaron en cada ciudad.

#Sugerencia: asigne los resultados del punto anterior a un objeto, y use la función plot
#para graficar ese objeto.

# 1ra Opción
plot(Registros_x_Ciudad)
# 2da opción
barplot(table(datos$City), main = "Cantidad de Registros x Ciudad", xlab = "Ciudades" , ylab = "Registros")

#Haga un gráfico de torta de la participación de cada país (Country)
#en el total de los registros.

#Sugerencia: cuente primero la cantidad de registros para cada Country y luego
#use la función pie() para generar el gráfico de torta.

Registros_x_Pais <- table(datos$Country)
pie(table(datos$Country), 
    main = "Gráfica de registros por país", 
    labels = paste(names(Registros_x_Pais), Registros_x_Pais, sep = " - "),
    col = c("Red","Green", "Blue"),
    clockwise = TRUE)
legend("topright",names(Registros_x_Pais), cex = 0.8, fill = c("Red","Green", "Blue"))

#### Vinculos ####
# https://www.datanalytics.com/libro_r/index.html

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
# no logre al grabar el archivo original .xlsx a .csv con la indicación de que el punto decimal sea (.)
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
#Cuáles son esas tres variables?

# Respuesta a cuales son las tres variables cuantitativas
# Children, Units Sold, Revenue

sapply(datos[,"Children"],mean, na.rm = TRUE)
sapply(datos[,"Children"],var, na.rm = TRUE)
sapply(datos[,"Children"],sd, na.rm = TRUE)

sapply(datos[,"Units Sold"],mean, na.rm = TRUE)
sapply(datos[,"Units Sold"],var, na.rm = TRUE)
sapply(datos[,"Units Sold"],sd, na.rm = TRUE)

sapply(datos[,"Revenue"],mean, na.rm = TRUE)
sapply(datos[,"Revenue"],var, na.rm = TRUE)
sapply(datos[,"Revenue"],sd, na.rm = TRUE)


#Use la funci?n summary(datos$Variable) (reemplace Variable por
#Units.Sold, Children y Revenue) para ver otra forma de calcular estad?sticos
#descriptivos del dataframe. ?Qu? estad?sticos adicionales produce la funci?n
#summary?



#Calcule el percentil 5 y 95 de las variables Units.Sold, Children y Revenue.

#Use la funci?n quantile(datos$Variable,c(vector con valores de percentiles)) para calcular
#los percentiles pedidos (0.05 y 0.95). Reemplace Variable por Units.Sold, Children y Revenue.
#?C?mo se interpretan los valores obtenidos?



#Calcule la mediana de las variables Units.Sold, Children y Revenue

#Use la funci?n median(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular la mediana de dichas variables cuantitativas.
#?Cu?l es la interpretaci?n del valor resultante?



#Calcule la curtosis (cuarto momento) de las variables Units.Sold, Children y Revenue

#Use la funci?n kurtosis(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular la curtosis de dichas variables cuantitativas.
#?Cu?l es la interpretaci?n del valor resultante?



#Calcule el sesgo (tercer momento) de las variables Units.Sold, Children y Revenue

#Use la funci?n skewness(datos$Variable,na.rm=TRUE) (reemplace Variable por
#Units.Sold, Children y Revenue) para calcular el sesgo de dichas variables cuantitativas.
#?Cu?l es la interpretaci?n del valor resultante?



#Cree un dataframe A que tenga las columnas Units.Sold, Children y Revenue del objeto datos


#Calcule la matriz de correlaciones entre las variables Units.Sold, Children y Revenue

#Use la funci?n cor(), donde el argumento de la funci?n es el dataframe que cre? con
#las columnas Units.Sold,Children y Revenue



#Paso 4: Visualizaci?n

#Cree un histograma para la variable Revenue

#Use la funci?n hist(Variable) para crear el histograma. Explore los argumentos de la
#funci?n para asignarle alg?n color de relleno al histograma.



#Cree un histograma para revenue seg?n el sexo de los clientes (un histograma por
#cada sexo). Note que debe extraer por separado los datos de Revenue para los cuales
#el sexo es masculino y femenino.



#Cree un diagrama de dispersi?n con las variables Revenue y Children. Use la funci?n
#plot. En esta funci?n, el primer argumento los los datos del eje horizontal y el segundo
#argmento son los datos del eje vertical.



#Cree un gr?fico boxplot para Revenue. Use la funci?n boxplot() donde el argumento
#es el conjunto de datos al que se le har? el boxplot.



#Cuente la cantidad de registros que se presentaron en cada ciudad. Esto significa
#contar la cantidad de ocurrencias de cada elemento de la columna City.

#Use la funci?n table() donde el argumento es el conjunto de datos en los que 
#va a contar la cantidad de ocurrencias de cada elemento.



#Haga un gr?fico de la cantidad de registros que se presentaron en cada ciudad.

#Sugerencia: asigne los resultados del punto anterior a un objeto, y use la funci?n plot
#para graficar ese objeto.


#Haga un gr?fico de torta de la participaci?n de cada pa?s (Country)
#en el total de los registros.

#Sugerencia: cuente primero la cantidad de registros para cada Country y luego
#use la funci?n pie() para generar el gr?fico de torta.


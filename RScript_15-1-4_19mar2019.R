
# asignar seq a un objeto
mi_seq <- seq(10,20)

# asignar otra seq a un objeto
mi_seq2 <- seq(20,30)

#Asignar nueva matriz
Matriz <-  matrix(seq(1,9),nrow=3,ncol=3)

#contruir un data.frame
numeros <- c(1,2,3)
texto <- c("hola","como","estas")
Booleanos <- c(TRUE,FALSE,TRUE)

data_frame <- data.frame(numeros,texto,Booleanos)

#para seleccionar rangos dentro de matriz se señalan filasunidas por dos puntos separads por coma delas columnas

Matriz[1:2,2:3]

#compara cada valor del objeto
Matriz<3

#asignar nuevos valores a algunos elementos de la matriz
Matriz[Matriz>3] <- 999
Matriz

#Instalar paquete raster
install.packages("raster")
library("raster")

#convirtiendo una matriz en raster
Matriz <-  matrix(seq(1,9),nrow=3,ncol=3)
matriz
#    le cambié nombre sin mayusculas
matriz <-  matrix(seq(1,9),nrow=3,ncol=3)

matriz_raster <- raster(matriz)

#graficando raster
plot(matriz_raster)

#convirtiendo matriz de 8 x 8 y ploteando
matriz8 <-  matrix(seq(1,64),nrow=8,ncol=8)
matriz_raster8 <- raster(matriz8)
plot(matriz_raster8)

#poniendo un punto en el plot rojo
points(0.25,0.75,pch=21,bg="red",cex=2)

#operaciones sobre raster
raster_nuevo <- matriz_raster8 - 0.3*(matriz_raster8)
plot(raster_nuevo)

#Cargando raster de disco se usa comando Brick porque tiene más de una capa, si solo tuviese una capa se usaría raster
install.packages("rgdal")
rapid_eye_1 <- brick("c:/RepositorioGIT/curso_r_conabio/1crop.tif")
Rapid_eye_1

#visualizar las bandas RGB
plotRGB(rapid_eye_1,r=3,g=2,b=1)


#para ver las dimensiones
dim(rapid_eye_1)

#cortando capas del raster originas VISible(3) y cercaNo InfraRojo(5)
VIS <- subset(rapid_eye_1,subset=3)
NIR <- subset(rapid_eye_1,subset=5)

#dividiendo pantalla despliegue
par(mfrow=c(1,2))

plot(VIS,main="VIS")
plot(NIR,main="NIR")

#Calculando NDVI
ndvi <- (NIR-VIS)/(VIS+NIR)
par(mfrow=c(1,1))
plot(ndvi)

#guardando en nuestro disco
?writeRaster
rf <- writeRaster(ndvi,
                  filename="ndvi.tif",
                  format="GTiff",
                  overwrite=TRUE)
#estableciendo directorio de trabajo
setwd("c:/RepositorioGIT/ciencia-datos-practica")

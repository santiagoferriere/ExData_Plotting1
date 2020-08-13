data <- read.csv("hh.txt", header = TRUE, sep = ";", na.strings = "?")
## nótese el #sep y el #na.string
select <- data[ grep( "[1-2]/2/2007", data$Date), ]
## Selecciono el subset que dentro de la col Date tenga "1/2/2007" ó "2/2/2007"
library(lubridate)
library(dplyr)
# NB que ahora mismo class(select$Date) = "character"
select <- mutate(select, DateTime = paste(select$Date, select$Time))
## agrego una col en la que uno las col "Time" y "Date"
select <- mutate(select, asDateTime = dmy_hms(select$DateTime))
## agregé una una columna que tenga class(select$DateTime) = "Date" ("POSIXct" "POSIXt")

png(filename= "plot2.png")
## abro un dive de png para graficarlo allí
plot2 <- plot( x = select$asDateTime, y = select$Global_active_power, type = "l", xlab= "Days", 
               ylab = "Global Active Power (kw)", main = "Global Active Power time distribution")
#NB el tpe 1 reemplaza los puntos por lineas
##  main =titulo, xlab, ylab
dev.off()
## importante cerrar la conexion
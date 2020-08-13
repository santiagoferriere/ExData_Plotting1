##Plot3
data <- read.csv("hh.txt", header = TRUE, sep = ";", na.strings = "?")
## nótese el #sep y el #na.string
select <- data[ grep( "^(1|2)/2/2007", data$Date), ]
## Selecciono el subset que dentro de la col Date tenga "1/2/2007" ó "2/2/2007"
## Selecciono el subset que dentro de la col Date tenga "1/2/2007" ó "2/2/2007"
library(lubridate)
library(dplyr)
# NB que ahora mismo class(select$Date) = "character"
select <- mutate(select, DateTime = paste(select$Date, select$Time))
## agrego una col en la que uno las col "Time" y "Date"
select <- mutate(select, asDateTime = dmy_hms(select$DateTime))
## agregé una una columna que tenga class(select$DateTime) = "Date" ("POSIXct" "POSIXt")

png(filename= "plot3.png")
## abro un dive de png para graficarlo allí
p3 <- plot( y= select$Sub_metering_1, x = select$asDateTime, col = "red", 
            type = "l", main = "Energy", xlab = "Date", ylab = "submetering")
lines( y = select$Sub_metering_2, x = select$asDateTime , col = "blue")
lines( y = select$Sub_metering_3, x = select$asDateTime , col = "black")
## con lines()  puedo graficar varias variables en el mismo graph
legend("topright", pch = "l", col = c("red", "blue", "black"), legend = c("Sub1", "Sub2", "Sub3"))
## añado una leyenda

dev.off()
## importante cerrar la conexion

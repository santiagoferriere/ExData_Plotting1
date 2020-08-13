data <- read.csv("hh.txt", header = TRUE, sep = ";", na.strings = "?")
## nótese el #sep y el #na.string
select <- data[ grep( "^(1|2)/2/2007", data$Date), ]
## Selecciono el subset que dentro de la col Date tenga "1/2/2007" ó "2/2/2007"

png(filename= "plot1.png")
## abro un divice de png para graficarlo allí
hist1 <- hist(select$Global_active_power, breaks = 12, col = "red", 
              xlab = "Global Active Power (kw)", ylab = "frequency", main = "Global Active Power" )
## quiero 12 barras, main =titulo, xlab, ylab
dev.off()
## importante cerrar la conexion
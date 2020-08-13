data <- read.csv("hh.txt", header = TRUE, sep = ";", na.strings = "?")
## nótese el #sep y el #na.string
select <- data[ grep( "[1-2]/2/2007", data$Date), ]
## Selecciono el subset que dentro de la col Date tenga "1/2/2007" ó "2/2/2007"
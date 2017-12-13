#-----------------------------------------------------
# Reading files for the data frames
BTC <- read.csv("../csv/btc/bitcoin_dataset.csv")
# Modificando las fechas para que estas sean comparables
BTC[["Date"]] <- as.POSIXct(BTC[["Date"]])
#-----------------------------------------------------
require(ggplot2)
source("Utileria.r")

#-----------------------------------------------------
BTC <- subset_date(BTC, "2009-11-10","2017-11-08")
prediccion <- predictNumberBtc()
prediccion <- subset_date(prediccion, "2009-11-10","2017-11-08")

BTC[["Predicciones"]] <- prediccion["prediction"]

png("../png/btc/prediccionBTC.png", width=1280, height=720)
#ggplot(NULL, aes(Date)) + 
#	geom_line(data=BTC, aes(y = BTC$Predicciones, color="NAVY")) +
#	geom_line(data=BTC,aes(y = BTC$btc_total_bitcoins, color="RED")) 
#	scale_color_manual(labels=c("Prediccion", "Real"),values=c("NAVY","RED")) + 
#	labs(y="Cantidad", title="Prediccion de la cantidad de bitcoin") +
#	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#ggplot(prediccion, aes(prediccion$Date, prediccion$prediction)) + geom_line()

ggplot(BTC, aes(Date)) + 
	geom_line(aes(y = btc_total_bitcoins, color="BLUE")) + 
	geom_line(aes(y = Predicciones, color="RED")) + 
	scale_color_manual(labels=c("Real", "Prediccion"),values=c("BLUE","RED")) + 
	labs(y="Cantidad", title="Prediccion de cantidad de bitcoin") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))
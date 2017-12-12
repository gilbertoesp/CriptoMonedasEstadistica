#-----------------------------------------------------
# Reading files for the data frames
BTC <- read.csv("../csv/btc/bitcoin_dataset.csv")
# Modificando las fechas para que estas sean comparables
BTC[["Date"]] <- as.POSIXct(BTC[["Date"]])
#-----------------------------------------------------
require(ggplot2)
source("Utileria.r")

#-----------------------------------------------------

set <- subset_date(BTC, min(BTC$Date), max(BTC$Date))

#-----------------------------------------------------
png("../png/btc/fecha_vs_cantidad.png", width=1280, height=720)

set <- subset_date(BTC,min(BTC$Date),"2013-01-01")
ggplot(set, aes(set$Date, set$btc_total_bitcoin)) + geom_line() + 
	labs(y="Cantidad", x="Date", title="Cantidad de bitcoins 2009-2013") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

set <- subset_date(BTC,"2013-01-01",max(BTC$Date))
ggplot(set, aes(set$Date, set$btc_total_bitcoin)) + geom_line() + 
	labs(y="Cantidad", x="Date", title="Cantidad de bitcoins 2013-2017/Nov") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------

png("../png/btc/cantidad_vs_precio.png", width=1280, height=720)

ggplot(set, aes(set$btc_total_bitcoin, set$btc_market_price)) + geom_line() + 
	labs(y="Precio", x="Cantidad", title="Cantidad de Bitcoin y su precio") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------
png("../png/btc/blockSize_vs_precio.png", width=1280, height=720)

ggplot(set, aes(set$btc_total_bitcoin, set$btc_avg_block_size)) + geom_line() + 
	labs(y="Tamaño promedio bloque", x="Cantidad", title="Cantidad de Bitcoin y tamaño de block") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------
png("../png/btc/date_vs_hashRate.png", width=1280, height=720)

ggplot(set, aes(set$Date, set$btc_hash_rate)) + geom_line() + 
	labs(y="Hash Rate", x="Date", title="Fecha y Hash Rate") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------
png("../png/btc/hashRate_vs_dificultad.png", width=1280, height=720)

ggplot(set, aes(set$btc_difficulty, set$btc_hash_rate)) + geom_line() + 
	labs(y="Hash Rate", x="Dificultad", title="Dificultad y Hash Rate") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------
png("../png/btc/date_vs_dificultad.png", width=1280, height=720)

ggplot(set, aes(set$Date, set$btc_difficulty)) + geom_line() + 
	labs(y="Dificultad", x="Date", title="Dificultad de minado") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))
	
#-----------------------------------------------------
png("../png/btc/date_vs_recompensa.png", width=1280, height=720)

ggplot(set, aes(set$Date, set$btc_miners_revenue)) + geom_line() + 
	labs(y="Recompensa Total", x="Date", title="Recompensa Total de los mineros") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------
png("../png/btc/dificultad_vs_recompensa.png", width=1280, height=720)

ggplot(set, aes(set$btc_difficulty, set$btc_miners_revenue)) + geom_line() + 
	labs(y="Recompensa Total", x="Dificultad", title="Recompensa Total de los mineros y su Dificultad") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))


#-----------------------------------------------------
png("../png/btc/cantidad_vs_recompensa.png", width=1280, height=720)

ggplot(set, aes(set$btc_total_bitcoin, set$btc_miners_revenue)) + geom_line() + 
	labs(x="Cantidad de bitcoins", y="Recompensa Total", title="Recompensa total de los mineros segun cantidad de bitcoin") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

#-----------------------------------------------------
png("../png/btc/date_vs_tiempoConfirmacion.png", width=1280, height=720)

ggplot(set, aes(set$Date, set$btc_median_confirmation_time)) + geom_line() + 
	labs(x="Date", y="Tiempo (seg.)", title="Tiempo promedio de confirmacion por transaccion") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))



#-----------------------------------------------------
png("../png/btc/date_vs_minersRevenue-Cantidad.png", width=1280, height=720)

ggplot(set, aes(set$Date)) + 
	geom_line(aes(y = set$btc_miners_revenue, color="GREEN4")) + 
	geom_line(aes(y = set$btc_total_bitcoin, color="NAVY")) + 
	scale_color_manual(labels=c("Recompensa", "Cantidad"),values=c("GREEN4","NAVY")) + 
	labs(x="Date", y="Precio USD", title="Cantidad de monedas y total de Recompensas otorgadas", size=16) +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))
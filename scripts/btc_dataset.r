#-----------------------------------------------------
# Reading files for the data frames
BTC <- read.csv("../csv/btc/bitcoin_dataset.csv")
# Modificando las fechas para que estas sean comparables
BTC[["Date"]] <- as.POSIXct(BTC[["Date"]])
#-----------------------------------------------------
require(ggplot2)
source("Utileria.r")
#-----------------------------------------------------
pdf("../pdf/btc/fecha_vs_cantidad")

set <- subset_date(BTC,min(BTC$Date),"2013-01-01")
ggplot(set, aes(set$Date, set$btc_total_bitcoin)) + geom_line() + 
	labs(y="Cantidad", x="Date", title="Cantidad de bitcoins 2009-2013")

set <- subset_date(BTC,"2013-01-01",max(BTC$Date))
ggplot(set, aes(set$Date, set$btc_total_bitcoin)) + geom_line() + 
	labs(y="Cantidad", x="Date", title="Cantidad de bitcoins 2013-2017/Nov")

#-----------------------------------------------------

set <- subset_date(BTC, min(BTC$Date), max(BTC$Date))

#-----------------------------------------------------

pdf("../pdf/btc/cantidad_vs_precio.pdf")

ggplot(set, aes(set$btc_total_bitcoin, set$btc_market_price)) + geom_line() + 
	labs(y="Precio", x="Cantidad", title="Cantidad de Bitcoin y su precio")

#-----------------------------------------------------
pdf("../pdf/btc/blockSize_vs_precio.pdf")

ggplot(set, aes(set$btc_total_bitcoin, set$btc_avg_block_size)) + geom_line() + 
	labs(y="Tamaño promedio bloque", x="Cantidad", title="Cantidad de Bitcoin y tamaño de block")

#-----------------------------------------------------
pdf("../pdf/btc/date_vs_hashRate.pdf")

ggplot(set, aes(set$Date, set$btc_hash_rate)) + geom_line() + 
	labs(y="Hash Rate", x="Date", title="Fecha y Hash Rate")

#-----------------------------------------------------
pdf("../pdf/btc/hashRate_vs_dificultad.pdf")

ggplot(set, aes(set$btc_difficulty, set$btc_hash_rate)) + geom_line() + 
	labs(y="Hash Rate", x="Dificultad", title="Dificultad y Hash Rate")

#-----------------------------------------------------
pdf("../pdf/btc/date_vs_dificultad.pdf")

ggplot(set, aes(set$Date, set$btc_difficulty)) + geom_line() + 
	labs(y="Dificultad", x="Date", title="Dificultad de minado")
	
#-----------------------------------------------------
pdf("../pdf/btc/date_vs_recompensa.pdf")

ggplot(set, aes(set$Date, set$btc_miners_revenue)) + geom_line() + 
	labs(y="Recompensa", x="Date", title="Recompensa de los mineros")

#-----------------------------------------------------
pdf("../pdf/btc/date_vs_recompensa.pdf")

ggplot(set, aes(set$Date, set$btc_miners_revenue)) + geom_line() + 
	labs(y="Recompensa", x="Date", title="Recompensa de los mineros")
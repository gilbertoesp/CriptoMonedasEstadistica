#-----------------------------------------------------
# Reading files for the data frames
BTC <- read.csv("../csv/btc/bitcoin_price.csv")
# Modificando las fechas para que estas sean comparables
BTC[["Date"]] <- as.Date(BTC[["Date"]], format="%b %d,%Y")
#-----------------------------------------------------
# Reading files for the data frames
ETH <- read.csv("../csv/eth/ethereum_price.csv")
# Modificando las fechas para que estas sean comparables
ETH[["Date"]] <- as.Date(ETH[["Date"]], format="%b %d,%Y")
#-----------------------------------------------------
# Reading files for the data frames
CASH <- read.csv("../csv/other/bitcoin_cash_price.csv")
# Modificando las fechas para que estas sean comparables
CASH[["Date"]] <- as.Date(CASH[["Date"]], format="%b %d,%Y")
#-----------------------------------------------------
#Vamos a plotear con ggplot2
require(ggplot2)

subset_date <- function(data,date_1, date_2){
	# Funcion que regresa el subconjunto de datos que esta entre este intervalo
	# 	date_1 se incluye en el set, date_2 no
	set <- subset(data, subset = ( date_1 <= data$Date & date_2 >data$Date) )
	return(set)	
}	

plot_for_month_year_OpenClose <- function(data,year){
	months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" )
	fechas <- c("-01-01","-02-01","-03-01","-04-01","-05-01",
					"-06-01","-07-01","-08-01","-09-01","-10-01",
					#Se agrega una fecha auxiliar fantasma para plotear el ultimo mes
					"-11-01","-12-01","-12-31")

	fechas <- paste(year,fechas, sep="")

	for(i in 1:length(fechas)){
		set <- subset_date(data,fechas[i], fechas[i+1])
		if(nrow(set) > 0){
			print(ggplot(set, aes(Date)) + 
				geom_line(aes(y = Open, color="GREEN")) + 
				geom_line(aes(y = Close, color="RED")) + 
				scale_color_manual(labels=c("Open", "Close"),values=c("GREEN","RED")) + 
				labs(y="Precio USD", title=paste("Open-Close",months[i])))
		}
	}
}

years <- c("2013","2014","2015","2016","2017")
i<-2
#for(i in 1:length(years)){
	# Save the plots in the directory for the pdf's, in the archive
	#archivo <- paste("../pdf/graficaMensual_BTC_", years[i], sep="")
	#archivo <- paste(archivo, ".pdf", sep="")
	#pdf(archivo)
	# Cambiar BTC por otro frame para 
	#plot_for_month_year_OpenClose(BTC,years[i])
#}
png("../png/btc/date_vs_open-close.png", width=1280, height=720)
ggplot(BTC, aes(Date)) + 
	geom_line(aes(y = Open, color="GREEN")) + 
	geom_line(aes(y = Close, color="RED")) + 
	scale_color_manual(labels=c("Open", "Close"),values=c("GREEN","RED")) + 
	labs(y="Precio USD", title="Bitcoin open-close") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

png("../png/btc/date_vs_high-low.png", width=1280, height=720)
ggplot(BTC, aes(Date)) + 
	geom_line(aes(y = High, color="GREEN")) + 
	geom_line(aes(y = Low, color="RED")) + 
	scale_color_manual(labels=c("High", "High"),values=c("GREEN","RED")) + 
	labs(y="Precio USD", title="Bitcoin High-Close") +
	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

	#set_BTC <- subset_date(BTC,fechas[i], fechas[i+1])
	#set_ETH <- subset_date(ETH,fechas[i], fechas[i+1])
	#set_CASH <- subset_date(CASH,fechas[i], fechas[i+1])



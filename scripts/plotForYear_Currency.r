# Create a plot for currency that show the prices in the year, overlappaing diferrent Years

months <- c("Jan", "Feb", "Mar", "Apr", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" )

# Save the plots in the directory for the pdf's, in the archive
pdf("pdf/plot_YearCurrency.pdf")
#-----------------------------------------------------
# Reading files for the data frames
BTC <- read.csv("csv/btc/bitcoin_price.csv")
# Modificando las fechas para que estas sean comparables
BTC[["Date"]] <- as.Date(BTC[["Date"]], format="%b %d,%Y")
#-----------------------------------------------------
# Reading files for the data frames
ETH <- read.csv("csv/eth/ethereum_price.csv")
# Modificando las fechas para que estas sean comparables
ETH[["Date"]] <- as.Date(ETH[["Date"]], format="%b %d,%Y")
#-----------------------------------------------------
# Reading files for the data frames
CASH <- read.csv("csv/other/bitcoin_cash_price.csv")
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

subset_month_mean <- function(data,date_1, date_2){
	months <- c("Jan", "Feb", "Mar", "Apr", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" )
	low <- c()
}

set_2015 <- subset_date(BTC, "2015-01-01", "2016-01-01")

fecha_minima_eth <- min(ETH$Date)
fecha_minima_eth
fecha_minima_bth <- min(CASH$Date)
fecha_minima_bth


# Plotting el subset
# Este proceso no puede ser impletando en una funcion dado que no existe Low high, definidos
# fuera del contexto que estas manipulando los frames
#		->>>	ggplot(data=set_2015, aes(Date, High))  + geom_line()
#plot_date(BTC, BTC$Low, "2015-01-01","2016-01-01")
#plot_date(BTC, High, "2015-01-01","2016-01-01")
#plot_date(BTC, Open, "2015-01-01","2016-01-01")
#plot_date(BTC, Close, "2015-01-01","2016-01-01")
ggplot(BTC, aes(Date)) + 
	geom_line(aes(y = Open, color="GREEN")) + 
	geom_line(aes(y = Close, color="RED")) + 
	scale_color_manual(labels=c("Open", "Close"),values=c("GREEN","RED")) + 
	labs(y="Precio USD", title="Bitcoin Open-Close")

ggplot(ETH, aes(Date)) + 
	geom_line(aes(y = Open, color="GREEN")) + 
	geom_line(aes(y = Close, color="RED")) + 
	scale_color_manual(labels=c("Open", "Close"),values=c("GREEN","RED")) + 
	labs(y="Precio USD", title="Ethereum Open-Close")

ggplot(CASH, aes(Date)) + 
	geom_line(aes(y = Open, color="GREEN")) + 
	geom_line(aes(y = Close, color="RED")) + 
	scale_color_manual(labels=c("Open", "Close"),values=c("GREEN","RED")) + 
	labs(y="Precio USD", title="Bitcoin Cash Open-Close")
#---------------------------------------------------------------
ggplot(BTC, aes(Date)) + 
	geom_line(aes(y = Low, color="BLUE")) + 
	geom_line(aes(y = High, color="YELLOW")) + 
	scale_color_manual(labels=c("Low", "High"),values=c("BLUE","YELLOW")) + 
	labs(y="Precio USD", title="Bitcoin Low-High")

ggplot(ETH, aes(Date)) + 
	geom_line(aes(y = Low, color="BLUE")) + 
	geom_line(aes(y = High, color="YELLOW")) + 
	scale_color_manual(labels=c("Low", "High"),values=c("BLUE","YELLOW")) + 
	labs(y="Precio USD", title="Ethereum Low-High")

ggplot(CASH, aes(Date)) + 
	geom_line(aes(y = Low, color="BLUE")) + 
	geom_line(aes(y = High, color="YELLOW")) + 
	scale_color_manual(labels=c("Low", "High"),values=c("BLUE","YELLOW")) + 
	labs(y="Precio USD", title="Bitcoin Cash Low-High")
#---------------------------------------------------------------
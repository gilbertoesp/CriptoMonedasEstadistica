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
source("Utileria.r")
#-----------------------------------------------------


ETH <- subset_date(ETH, min(CASH$Date-1),max(CASH$Date))
BTC <- subset_date(BTC, min(CASH$Date-1),max(CASH$Date))

#png("../png/other/cash_vs_eth.png", width=1280, height=720)
#ggplot(NULL, aes(Date)) + 
#	geom_line(data=set_eth, aes(y = High, color="NAVY")) + 
#	geom_line(data=CASH,aes(y = High, color="ORANGE")) + 
#	scale_color_manual(labels=c("Ethereum", "Bitcoin Cash"),values=c("NAVY","ORANGE")) + 
#	labs(y="Precio USD", title="Ethereum y Bitcoin Cash - High") +
#	theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), title=element_text(size=16), legend.text=element_text(size=16))

# 	PRUEBAS DE INDEPENDENCIA

print(chisq.test(ETH$High, CASH$High))
print(chisq.test(CASH$High, BTC$High))
print(chisq.test(BTC$High, ETH$High))

print(chisq.test(ETH$Low, CASH$Low))
print(chisq.test(CASH$Low, BTC$Low))
print(chisq.test(BTC$Low, ETH$Low))
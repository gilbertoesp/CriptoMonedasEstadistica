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

#diferencias <- c(BTC$Open - BTC$Close)
#set_btc<-subset_date(BTC,"2013-10-01","2014-10-01")
#Date <-set_btc$Date
#Differences <- set_btc$Open - set_btc$Close
#diferencias <- data.frame(Date,Differences)
#diferencias

#pdf("../pdf/diferencias_BTC_OpenClose")
#ggplot(diferencias, aes(Date,Differences)) + geom_line()

#pdf("../pdf/diferencias_BTC_HighLow")
#acercamiento_1 <- subset_date(BTC,"2014-08-01","2015-04-01")
#ggplot(diferencias, aes(Date,Differences)) + geom_line()


#diferencias <- diferenciasOpenClose_set(BTC,"2016-12-01","2017-12-01")
#ggplot(diferencias, aes(Date,Differences)) + geom_line()

#diferencias <- diferenciasOpenClose_set(BTC,"2017-08-01","2017-12-01")
#ggplot(diferencias, aes(Date,Differences)) + geom_line()
pdf("../pdf/btc/diferencias_BTC_HighLow")

diferencias <- diferenciasHighLow_set(BTC,min(BTC$Date),max(BTC$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasHighLow_set(BTC,"2013-08-01","2014-06-01")
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasHighLow_set(BTC,"2017-01-01","2017-12-01")
ggplot(diferencias, aes(Date,Differences)) + geom_line()

pdf("../pdf/btc/diferencias_BTC_OpenClose")

diferencias <- diferenciasOpenClose_set(BTC,min(BTC$Date),max(BTC$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasOpenClose_set(BTC,"2013-08-01","2014-06-01")
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasOpenClose_set(BTC,"2017-01-01","2017-12-01")
ggplot(diferencias, aes(Date,Differences)) + geom_line()

#-----------------------------------------------------
pdf("../pdf/eth/diferencias_ETH_HighLow")

diferencias <- diferenciasHighLow_set(ETH,min(ETH$Date),max(ETH$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasHighLow_set(ETH,"2016-08-01","2016-10-01")
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasHighLow_set(ETH,"2017-01-01",max(ETH$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

pdf("../pdf/eth/diferencias_ETH_OpenClose")

diferencias <- diferenciasOpenClose_set(ETH,min(ETH$Date),max(ETH$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasOpenClose_set(ETH,"2016-08-01","2016-10-01")
ggplot(diferencias, aes(Date,Differences)) + geom_line()

diferencias <- diferenciasOpenClose_set(ETH,"2017-01-01",max(ETH$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()
#-----------------------------------------------------
pdf("../pdf/other/diferencias_CASH_HighLow")

diferencias <- diferenciasHighLow_set(CASH,min(CASH$Date),max(CASH$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

pdf("../pdf/other/diferencias_CASH_OpenClose")

diferencias <- diferenciasOpenClose_set(CASH,min(CASH$Date),max(CASH$Date))
ggplot(diferencias, aes(Date,Differences)) + geom_line()

#-----------------------------------------------------

#set_btc_2<-subset_date(BTC,"2016-12-01","2017-12-01")
#Date_2 <-set_btc_2$Date
#Differences_2 <- set_btc_2$Open - set_btc_2$Close
#diferencias_2 <- data.frame(Date_2,Differences_2)

#set_btc_3<-subset_date(BTC,"2017-08-01","2017-12-01")
#Date_3 <-set_btc_3$Date
#Differences_3 <- set_btc_3$Open - set_btc_3$Close
#diferencias_3 <- data.frame(Date_3,Differences_3)





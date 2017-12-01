# bitcoin_price.csv
print("Realizando analisis estadistico de Bitcoin")
BTC = read.csv("cryptocurrencypricehistory/bitcoin_price.csv", header = TRUE)
ETH = read.csv("cryptocurrencypricehistory/ethereum_price.csv", header = TRUE)

#	Summary
the_summarys <- function(data){
	columns = c("Open","High","Low","Close")
	
	for(i in 1:length(columns)){
		print(columns[i])
		print(summary(data[[columns[i]]], data=data))
		print("Standar Desviation: ")
		print(sd(data[[columns[i]]]))
	}
}
	the_summarys(BTC)



	#Volume
	#----------->>>>> WAHT THE ACTUAL FUCK
	#summary(BTC[["Volume"]], data=BTC)
	#Marketcap
	# ----------->>>> Datos invalidos
	#summary(BTC[["Marketcap"]], data=BTC)


# Boxplot
	# histogramas encimados
		#hist(BTC[["Low"]], main="Low Prices in Bitcoin", col="RED", ylab="Frecuency", xlab="Price")
		#hist(BTC[["High"]], col="GREEN", add=TRUE)
		#box()

	#plot(BTC[["Low"]], col="RED", main="High vs Low", type="l", ylab="Price", xlab="Date")
	#lines(BTC[["High"]], col="GREEN")
	#lines(BTC[["Open"]], col="BLUE")
	#lines(BTC[["Close"]], col="YELLOW")
	
# Con el siguiente grafico, podemos observar que no solo hay que comparar directamente, una cripto
# moneda contra otra, si no que estas deben de estar en el mismo intervalo de precios, ademas, podemos
# usar al BTC como refereancia para creciemiento, si este tiene una buena presencia en el mercado
# Tambien no todos lso archivos contienen una antiguedad tan aplastante como BTc, dado que todavia no se creaban
# Analisis, El precio del BTC afecta a los demas?, BTC podria decirserige el poder de las criptomonedas?
# 

	plot(BTC[["Low"]][1:825], col="RED", main="BTC vs ETH", type="l", ylab="Price", xlab="Date")
	lines(ETH[["Low"]][1:825], col="BLUE")


	#Low

	#boxplot(BTC["Low"], data=BTC)
	#Close

	#boxplot(BTC["Close"], data=BTC)
	#Open

	#boxplot(BTC["Open"], data=BTC)
	#btc_low <- BTC[["Low"]]
	#btc_low[1]
	#hist(BTC["Open"], data=BTC)
	#Volume

	#Marketcap

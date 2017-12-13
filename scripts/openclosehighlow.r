#Open vs Close bitcoin por anio y global

source("Utileria.r")

BTC = read.csv("../csv/btc/bitcoin_price.csv")

btcYears = 2013:2017
#compareTwoCol(BTC, "Open", "Close", btcYears, "opencloseBTC")
#compareTwoCol(BTC, "High", "Low", btcYears, "highLowBTC")

print("For bitcoin")
openingLowAnalysis(BTC)
openingHighAnalysis(BTC)
closingLowAnalysis(BTC)
closingHighAnalysis(BTC)

ETH = read.csv("../csv/eth/ethereum_price.csv")
ethYears = 2015:2017
#compareTwoCol(ETH, "Open", "Close", ethYears, "opencloseETH")
#compareTwoCol(ETH, "High", "Low", ethYears, "highLowETH")

print("For ethereum")
openingLowAnalysis(ETH)
openingHighAnalysis(ETH)
closingLowAnalysis(ETH)
closingHighAnalysis(ETH)

BCH = read.csv("../csv/other/bitcoin_cash_price.csv")
bchYears = 2017
#compareTwoCol(BCH, "Open", "Close", bchYears, "opencloseBCH")
#compareTwoCol(BCH, "High", "Low", bchYears, "highLowBCH")

print("For Bitcoin Cash")
openingLowAnalysis(BCH)
openingHighAnalysis(BCH)
closingLowAnalysis(BCH)
closingHighAnalysis(BCH)


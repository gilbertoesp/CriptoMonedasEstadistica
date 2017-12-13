#-----------------------------------------------------
# Reading files for the data frames
BTC <- read.csv("../csv/btc/bitcoin_dataset.csv")
# Modificando las fechas para que estas sean comparables
BTC[["Date"]] <- as.POSIXct(BTC[["Date"]])
#-----------------------------------------------------
require(ggplot2)
source("Utileria.r")

#-----------------------------------------------------
print(chisq.test(BTC$btc_total_bitcoin, BTC$btc_market_value))

print(chisq.test(BTC$btc_total_bitcoin, BTC$btc_hash_rate))

print(chisq.test(BTC$btc_total_bitcoin, BTC$btc_avg_block_size))

print(chisq.test(BTC$btc_total_bitcoin, BTC$btc_market_value))

print(chisq.test(BTC$btc_total_bitcoin, BTC$btc_market_value))
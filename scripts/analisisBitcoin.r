
btc = read.csv("csv/btc/bitcoin_dataset.csv")
#Slice original list for each year. Starting from 2009

colList = c("btc_total_bitcoins", "btc_avg_block_size", "btc_hash_rate", "btc_cost_per_transaction_percent", "btc_n_transactions_total", "btc_n_transactions_excluding_popular", "btc_n_transactions_excluding_chains_longer_than_100", "btc_output_volume", "btc_estimated_transaction_volume")

btcYears = 2009:2017

#Summaries of all the years
sink("results/summariesBtc.txt")
pdf('pdf/bitcoin.pdf')
for(year in btcYears){
    #Gets the rows with the selected year
    yearBtc = btc[ grep(toString(year), btc$Date), ]

    print("Year of analisis: ")
    print(year)
    for(col in colList){
        print(summary(yearBtc[col]))
        print("#######################")
        print("#######################")

        plot(yearBtc[[col]],  col="RED", main=toString(year), type="l", ylab=col, xlab="Dias")

    }

}

print("Global summary: ")
for(col in colList){
    print(summary(btc[col]))
    print("#######################")
    print("#######################")

    plot(btc[[col]],  col="RED", main="Global", type="l", ylab=col, xlab="Dias")
}

dev.off()

sink()

#Standard deviation
sink("results/standardDeviationBtc.txt")
for(year in btcYears){
    #Gets the rows with the selected year
    yearBtc = btc[ grep(toString(year), btc$Date), ]

    print("Year of analisis: ")
    print(year)
    for(col in colList){
        print(col)
        print(sd(as.numeric(unlist(yearBtc[col]))))
        print("#######################")
        print("#######################")
    }

}

print("Global summary: ")
for(col in colList){
    print(col)
    print(sd(as.numeric(unlist(yearBtc[col]))))
    print("#######################")
    print("#######################")
}

sink()

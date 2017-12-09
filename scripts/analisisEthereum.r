

eth = read.csv("csv/eth/ethereum_dataset.csv")
#Slice original list for each year. Starting from 2011

colList = c("eth_etherprice", "eth_supply", "eth_marketcap", "eth_hashrate", "eth_difficulty", "eth_blocks", "eth_uncles", "eth_blocksize", "eth_blocktime", "eth_gasprice", "eth_gaslimit", "eth_gasused", "eth_ethersupply")

ethYears = 2015:2017

#Summaries of all the years
sink("results/summaryEth.txt")
pdf('pdf/ethereum.pdf')
for(year in ethYears){
    #Gets the rows with the selected year
    yearEth = eth[ grep(toString(year), eth$Date.UTC.), ]

    print("Year of analisis: ")
    print(year)
    for(col in colList){
        print(summary(yearEth[col]))
        print("#######################")
        print("#######################")

        plot(yearEth[[col]],  col="RED", main=toString(year), type="l", ylab=col, xlab="Dias")

    }

}

print("Global summary: ")
for(col in colList){
    print(summary(eth[col]))
    print("#######################")
    print("#######################")

    plot(eth[[col]],  col="RED", main="Global", type="l", ylab=col, xlab="Dias")
}

dev.off()

sink()

#Standard deviation
sink("results/standardDeviationEth.txt")
for(year in ethYears){
    #Gets the rows with the selected year
    yearEth = eth[ grep(toString(year), eth$Date), ]

    print("Year of analisis: ")
    print(year)
    for(col in colList){
        print(col)
        print(sd(as.numeric(unlist(yearEth[col]))))
        print("#######################")
        print("#######################")
    }

}

print("Global summary: ")
for(col in colList){
    print(col)
    print(sd(as.numeric(unlist(yearEth[col]))))
    print("#######################")
    print("#######################")
}

sink()


#Invierte el orden de los renglones de un data frame
#Recibe un data frame
reverseRowDataFrame <- function(dataFrame)
{
    return( dataFrame[nrow(dataFrame):1, ] )
}

#Plotea dos columnas de un data frame por mes a traves del periodo de años especificado y lo pone en el pdf con el nombre especificado
#Datos es un data frame
#col1 es una de las columnas a plotear
#col2 es una de las columnas a plotear
#years Es el intervalo de años en el que se plotearan las columas
#pdfName es el nombre del pdf donde se encontrara el plot. No necesita terminar en .pdf
plotTwoCol <- function(datos, col1, col2, years, pdfName='comparison')
{
   type1 = toString(col1) 
   type2 = toString(col2) 

    months = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

    pdf(paste0("../pdf/", pdfName, ".pdf"))

    for(year in years){

        yearDF = datos[ grep(toString(year), datos$Date), ]

        for(month in months){
            monthDF = datos[ grep(month, yearDF$Date), ]

            if(nrow(monthDF) > 0){
                #set_month_year = subset_date(datos, paste0(toString(year), "-", month, "-01"), paste0(toString(year+1), "-", month, "-01")
                #ggplot(data=set_month_year, aes(Date, High)) + geom_line()
                plot(monthDF[[type1]], col="RED", main=paste(type1, "vs", type2, month, toString(year)), type="l", ylab="Price", xlab="Date")
                lines(monthDF[[type2]], col="GREEN")
            }
        }
        
    }

    revDatos = reverseRowDataFrame(datos)
	plot(revDatos[[type1]], col="RED", main= paste("Global", type1, "vs", type2) , type="l", ylab="Price", xlab="Date")
	lines(revDatos[[type2]], col="GREEN")

    dev.off()
}

#Revisa cuantas veces el precio con el que abre una moneda es el menor en todo el dia
#datos es un Data frame
openingLowAnalysis <- function(datos)
{
    oplo = datos[datos$Open == datos$Low, ]
    print(paste("Number of times the opening price is the lowest:", toString(nrow(oplo))))
    perc = nrow(oplo) / nrow(datos) * 100
    print(paste("Percentage of times the opening price is the lowest:", toString(perc)))
}

#Revisa cuantas veces el precio con el que abre una moneda es el mayor en todo el dia
#datos es un Data frame
openingHighAnalysis <- function(datos)
{
    ophi = datos[datos$Open == datos$High, ]
    print(paste("Number of times the opening price is the highest:", toString(nrow(ophi))))
    perc = nrow(ophi) / nrow(datos) * 100
    print(paste("Percentage of times the opening price is the highest:", toString(perc)))
}

#Revisa cuantas veces el precio con el que cierra una moneda es el menor en todo el dia
#datos es un Data frame
closingLowAnalysis <- function(datos)
{
    cllo = datos[datos$Close == datos$Low, ]
    print(paste("Number of times the closing price is the lowest:", toString(nrow(cllo))))
    perc = nrow(cllo) / nrow(datos) * 100
    print(paste("Percentage of times the closing price is the lowest:", toString(perc)))
}

#Revisa cuantas veces el precio con el que cierra una moneda es el mayor en todo el dia
#datos es un Data frame
closingHighAnalysis <- function(datos)
{
    clhi = datos[datos$Close == datos$High, ]
    print(paste("Number of times the closing price is the highest:", toString(nrow(clhi))))
    perc = nrow(clhi) / nrow(datos) * 100
    print(paste("Percentage of times the closing price is the highest:", toString(perc)))
}


#Invierte el orden de los renglones de un data frame
#Recibe un data frame
reverseRowDataFrame <- function(dataFrame)
{
    return( dataFrame[nrow(dataFrame):1, ] )
}

readCsv <- function(path)
{
    dato = read.csv(paste0("../csv/", path, ".csv"))
    dato[["Date"]] = as.Date(dato[["Date"]], format = "%b %d, %Y")
    return( reverseRowDataFrame(dato) )
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

#Revisa la mayor diferencia en valor absoluto por mes del valor de la media de dos valores de un
#data frame y encuentra el maximo y minimo de estas diferencias
compareTwoColMonth <- function(datos, col1, col2, years)
{
    months = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
   
    maxdif = 0
    mindif = 9999999
    for(year in years){

        yearDF = datos[ grep(toString(year), datos$Date), ]

        for(month in months){
            monthDF = yearDF[ grep(month, yearDF$Date), ]

            if(nrow(monthDF) > 0){ #Si mes o anio no existe, abrian 0 renglones. Este if los evita
                meandif = abs( mean(monthDF[[col1]]) - mean(monthDF[[col2]]) )
                if(meandif > maxdif && !(year == 2017 && month == "Nov")){
                    maxdif = meandif
                    maxYear = year
                    maxMonth = month
                }
                if(meandif < mindif){
                    mindif = meandif
                    minYear = year
                    minMonth = month
                }
            }
        }
        
    }

    print(paste("Max:", maxdif))
    print(paste("Max year:", maxYear))
    print(paste("Max month:", maxMonth))

    print(paste("Min:", mindif))
    print(paste("min Year:", minYear))
    print(paste("Min month:", minMonth))
}

subset_date <- function(data,date_1, date_2){
	# Funcion que regresa el subconjunto de datos que esta entre este intervalo
	# 	date_1 se incluye en el set, date_2 no
	set <- subset(data, subset = ( date_1 <= data$Date & date_2 >data$Date) )
	return(set)	
}

#Obtiene el porcentaje que aumenta el precio de una moneda desde que el dia comienza hasta que el dia acaba
getPercentRaiseDay <- function(datos)
{
    raise = 0

    for( i in 1:nrow(datos)){
        raise = raise + datos[i, "Close"] - datos[i, "Open"]
    }

    return(raise / 100)
}




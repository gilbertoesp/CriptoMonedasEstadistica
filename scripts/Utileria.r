
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

# Plotea una grafica por cada mes del anio dado, el cual debe ser String
# del frame dado en data, en la graifca se contraponen los valores de apretura y clausuara
plot_for_month_year_OpenClose <- function(data,year){

    months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" )
    fechas <- c("-01-01","-02-01","-03-01","-04-01","-05-01",
                    "-06-01","-07-01","-08-01","-09-01","-10-01",
                    #Se agrega una fecha auxiliar fantasma para plotear el ultimo mes
                    "-11-01","-12-01","-12-31")

    fechas <- paste(year,fechas, sep="")

    for(i in 1:length(fechas)){
        set <- subset_date(data,fechas[i], fechas[i+1])
        if(nrow(set) > 0){
            print(ggplot(set, aes(Date)) + 
                geom_line(aes(y = Open, color="GREEN")) + 
                geom_line(aes(y = Close, color="RED")) + 
                scale_color_manual(labels=c("Open", "Close"),values=c("GREEN","RED")) + 
                labs(y="Precio USD", title=paste("Open-Close",months[i])))
        }
    }
}

# Plotea una grafica por cada mes del anio dado, el cual debe ser String
# del frame dado en data, en la graifca se contraponen los valores de high y low
plot_for_month_year_OpenClose <- function(data,year){

    months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" )
    fechas <- c("-01-01","-02-01","-03-01","-04-01","-05-01",
                    "-06-01","-07-01","-08-01","-09-01","-10-01",
                    #Se agrega una fecha auxiliar fantasma para plotear el ultimo mes
                    "-11-01","-12-01","-12-31")

    fechas <- paste(year,fechas, sep="")

    for(i in 1:length(fechas)){
        set <- subset_date(data,fechas[i], fechas[i+1])
        if(nrow(set) > 0){
            print(ggplot(set, aes(Date)) + 
                geom_line(aes(y = High, color="GREEN")) + 
                geom_line(aes(y = Low, color="RED")) + 
                scale_color_manual(labels=c("High", "Low"),values=c("GREEN","RED")) + 
                labs(y="Precio USD", title=paste("High-Low",months[i])))
        }
    }
}


# Regresa un data frame con la fecha y la diferencia entre el precio de apertura y el 
# de clausura de la data(frame csv)
diferenciasOpenClose_set <- function(data,date_1,date_2){
    set <- subset_date(data,date_1,date_2)
    Date<- set$Date
    Differences <- set$Open - set$Close
    return(data.frame(Date, Differences))
}

# Regresa un data frame con la fecha y la diferencia entre el precio minimo y el 
# maximo de la data(frame csv)
diferenciasHighLow_set <- function(data,date_1,date_2){
    set <- subset_date(data,date_1,date_2)
    Date<- set$Date
    Differences <- set$High - set$Low
    return(data.frame(Date, Differences))
}

#Genera un vector con los porcentajesde cambio entre los precios de la primera fecha contra
# la segunda, siendo el orden open, high, low, close
porcentaje <- function(data,date_1,date_2){
    set_1 <- subset(data,subset=data$Date==date_1)
    set_2 <- subset(data,subset=data$Date==date_2)

    diff <- c(set_2[["Open"]] - set_1[["Open"]], 
                set_2[["High"]] - set_1[["High"]], 
                set_2[["Low"]] - set_1[["Low"]], 
                set_2[["Close"]] - set_1[["Close"]] )
    
    porcentaje <- c( (diff[1] / set_1[[2]]) * 100,
                        (diff[2] / set_1[[3]]) * 100,
                        (diff[3] / set_1[[4]]) * 100,
                        (diff[4] / set_1[[5]]) * 100 )

    return(porcentaje)
}


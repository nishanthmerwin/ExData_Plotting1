## Reads table and converts the date to appropriate format
EPC <- read.table("C:/Users/Nishanth/Documents/Coursera/household_power_consumption.txt" , header=T ,sep=";",na.strings="?")
EPC[,"Date"] <- as.character(EPC[,"Date"])
EPC[,"Date"] <- as.Date(EPC[,"Date"],format="%d/%m/%Y")
EPC[,"Time"] <- as.Date(EPC_sub[,"Time"],format="%T")


## Subsets the data frame between dates 2007-02-01 and 2007-02-02
EPC_sub <- subset(EPC,((EPC[,"Date"] >= as.Date("2007-02-01")) & (EPC[,"Date"] <= as.Date("2007-02-02"))))



#Creates a combined time and date vector
EPC_subz <- within(EPC_sub, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })
time <- strptime(EPC_subz[,"timestamp"],format="%d/%m/%Y %T")


#Creates a 2x2 plotting environment
    par(mfrow=c(2,2)
#Plot 1
    x <- time
    y <- EPC_subz[,"Global_active_power"]
    plot(x,y,type="n",xlab="",ylab="Global Active Power (kilowatts)")
    lines(x, y, type="S")
#Plot 2
    y <- EPC_subz[,"Voltage"]
    plot(x,y,type="n",xlab="",ylab="Voltage")
    lines(x, y, type="S")

#Plot 3
    x <- time
    y1 <- EPC_subz[,"Sub_metering_1"]
    y2 <- EPC_subz[,"Sub_metering_2"]
    y3 <- EPC_subz[,"Sub_metering_3"]
    
    plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
    lines(x, y1, type="S")
    lines(x, y2, type="S",col="red")
    lines(x, y3, type="S",col="blue")
    #Creates the legend
    legend( x="top", 
            legend=c("Sub-metering_1","Sub-metering_2","Sub-metering_3"), 
            col=c("black","red","blue"), lwd=1, lty=c(1), 
            merge=FALSE,cex=0.7,pt.cex=1,bty="n")
#Plot 4
    y <- EPC_subz[,"Global_reactive_power"]
    plot(x,y,type="n",xlab="",ylab="Global Reactive Power")
    lines(x, y, type="S")
dev.copy(png,file="plot4.png")
dev.off()

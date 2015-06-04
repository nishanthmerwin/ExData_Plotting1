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

#Creates the plot
x <- time
y <- EPC_subz[,"Global_active_power"]
plot(x,y,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(x, y, type="S")
dev.copy(png,file="plot2.png")
dev.off()

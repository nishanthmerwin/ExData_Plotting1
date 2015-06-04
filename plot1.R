?read.table

## Reads table and converts the date to appropriate format
EPC <- read.table("C:/Users/Nishanth/Documents/Coursera/household_power_consumption.txt" , header=T ,sep=";",na.strings="?")
EPC[,"Date"] <- as.character(EPC[,"Date"])
EPC[,"Date"] <- as.Date(EPC[,"Date"],format="%d/%m/%Y")


## Subsets the data frame between dates 2007-02-01 and 2007-02-02
EPC_sub <- subset(EPC,((EPC[,"Date"] >= as.Date("2007-02-01")) & (EPC[,"Date"] <= as.Date("2007-02-02"))))


## Creates the plot
hist(EPC_sub[,"Global_active_power"],col='red',xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()



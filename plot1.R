# read in the data
library(dplyr)
library(lubridate)
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
consumption <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]
consumption$DateTime <- dmy_hms(paste(consumption$Date, consumption$Time))

# make the plot
png("plot1.png")
hist(as.numeric(consumption$Global_active_power), col="RED", 
     xlab="Global active power (kilowatts)", 
     main="Global Active Power")
dev.off()
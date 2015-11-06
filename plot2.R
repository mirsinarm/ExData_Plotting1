# read in the data
library(dplyr)
library(lubridate)
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
consumption <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]
consumption$DateTime <- dmy_hms(paste(consumption$Date, consumption$Time))

# make the plot
png("plot2.png")
plot(consumption$Global_active_power ~ consumption$DateTime, type='l', 
     ylab="Global active power (kilowatts)",
     xlab=consumption$Date)
dev.off()


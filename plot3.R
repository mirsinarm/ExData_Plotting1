# read in the data
library(dplyr)
library(lubridate)
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
consumption <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]
consumption$DateTime <- dmy_hms(paste(consumption$Date, consumption$Time))

# make the plot
png("plot3.png")
plot(consumption$Sub_metering_1 ~ consumption$DateTime, type='l', ylab="Energy submetering")
lines(consumption$Sub_metering_2 ~ consumption$DateTime, col="RED")
lines(consumption$Sub_metering_3 ~ consumption$DateTime, col="BLUE")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1)

dev.off()
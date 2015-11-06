# read in the data
library(dplyr)
library(lubridate)
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
consumption <- power[which(power$Date == "1/2/2007" | power$Date == "2/2/2007"), ]
consumption$DateTime <- dmy_hms(paste(consumption$Date, consumption$Time))

# make the plot
png("plot4.png")
par(mfrow=c(2,2))

# first plot : same as plot2
plot(consumption$Global_active_power ~ consumption$DateTime, type='l', 
     ylab="Global Active Power", xlab="")

# second plot
plot(consumption$Voltage ~ consumption$DateTime, type="l", xlab="datetime", ylab="Voltage")

# third plot: same as plot3
plot(consumption$Sub_metering_1 ~ consumption$DateTime, type='l', ylab="Energy submetering")
lines(consumption$Sub_metering_2 ~ consumption$DateTime, col="RED")
lines(consumption$Sub_metering_3 ~ consumption$DateTime, col="BLUE")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1, bty="n")

# fourth plot
plot(consumption$Global_reactive_power ~ consumption$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

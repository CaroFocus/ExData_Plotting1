# read data
Lines <- readLines("./household_power_consumption.txt")
subL <- grep("^[12]/2/2007", substr(Lines, 1,8)) #get lines with corresponding Date

#read in required data
data <- read.table(text=Lines[subL], header = FALSE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#1,1
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)

#1,2
voltage <- as.numeric(data$Voltage)

#2,2
Global_reactive_power <- data$Global_reactive_power


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#1,1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#1,2
plot(datetime, voltage, type="l", ylab="Voltage")

#2,1
plot(datetime, Submetering1, type="n", xlab="", ylab="Energy sub metering")
lines(datetime, Submetering1)
lines(datetime, Submetering2, col="red")
lines(datetime, Submetering3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#2,2
plot(datetime, Global_reactive_power, type="l")
dev.off()
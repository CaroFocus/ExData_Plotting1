# read data
Lines <- readLines("./household_power_consumption.txt")
subL <- grep("^[12]/2/2007", substr(Lines, 1,8)) #get lines with corresponding Date

#read in required data
data <- read.table(text=Lines[subL], header = FALSE, sep=";", 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#date and time format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Submetering1 <- as.numeric(data$Sub_metering_1)
Submetering2 <- as.numeric(data$Sub_metering_2)
Submetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Submetering1, type="n", xlab="", ylab="Energy sub metering")
lines(datetime, Submetering1)
lines(datetime, Submetering2, col="red")
lines(datetime, Submetering3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


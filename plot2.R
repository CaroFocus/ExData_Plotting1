# plot 2
# read data
Lines <- readLines("./household_power_consumption.txt")
subL <- grep("^[12]/2/2007", substr(Lines, 1,8)) #get lines with corresponding Date

#read in required data
data <- read.table(text=Lines[subL], header = FALSE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
# read data
Lines <- readLines("./household_power_consumption.txt")
subL <- grep("^[12]/2/2007", substr(Lines, 1,8)) #get lines with corresponding Date

#read in required data
data <- read.table(text=Lines[subL], header = FALSE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global active power (kilowatts)", main = "Global active power")
dev.off()
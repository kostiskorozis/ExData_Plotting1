#reading and subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(power$Date, power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
#plot4.1
plot(datetime, power$Global_active_power, type ="l",
     col = "black", ylab = "Global Active Power (kilowatts)", xlab = "")
#plot4.2
plot(datetime, power$Voltage, type ="l",
     col = "black", ylab = "Voltage", xlab = "datetime")
#plot4.3
plot(datetime, power$Sub_metering_1, type ="l", 
     col = "black", ylab = "Energy sub metering")
points(datetime, power$Sub_metering_2, type = "l", col ="red")
points(datetime, power$Sub_metering_3, type = "l", col ="blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#plot4.4
plot(datetime, power$Global_reactive_power, type ="l",
     col = "black", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
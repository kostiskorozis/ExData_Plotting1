#reading and subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

#plot2
datetime <- strptime(paste(power$Date, power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, power$Global_active_power, type ="l",
     col = "black", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
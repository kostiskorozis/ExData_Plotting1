#reading and subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

#plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "orange",
      xlab = "Global Active Power (kilowatts)", 
      ylab = "Frequency", main = "Global Active Power")

dev.off()
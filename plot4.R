data <- read.csv('household_power_consumption.txt', 
                 header = TRUE, 
                 sep = ";",
                 na.strings = "?",
                 colClasses = c("character", 
                                "character", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric", 
                                "numeric"))
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

datetime <- strptime((paste(data$Date, data$Time)), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime,
     data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power", 
     type = "l")

plot(datetime,
     data$Voltage,   
     ylab = "Voltage",
     type = "l")

plot(datetime,
     data$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(datetime,
      data$Sub_metering_2, 
      col = "red", 
      type = "l")
lines(datetime,
      data$Sub_metering_3,
      col = "blue",
      type = "l")
legend("topright",
       lwd = 1,
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(datetime,
     data$Global_reactive_power,
     ylab = "Global_reactive_power",
     type = "l")

dev.off()
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

png("plot3.png", width=480, height=480)
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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
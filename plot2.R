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

dateData <- strptime((paste(data$Date, data$Time)), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datetime, data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()
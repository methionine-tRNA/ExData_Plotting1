library(lubridate)

power <- read.csv("household_power_consumption.txt", sep = ";")
power$Date <- dmy(power$Date)
power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

png(filename = "plot3.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(ymd_hms(paste(power$Date, power$Time)), power$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

plot(ymd_hms(paste(power$Date, power$Time)), power$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

plot(ymd_hms(paste(power$Date, power$Time)), power$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(ymd_hms(paste(power$Date, power$Time)), power$Sub_metering_2, col = "red")
lines(ymd_hms(paste(power$Date, power$Time)), power$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

plot(ymd_hms(paste(power$Date, power$Time)), power$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")
dev.off()
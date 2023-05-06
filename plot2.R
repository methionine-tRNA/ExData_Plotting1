library(lubridate)

power <- read.csv("household_power_consumption.txt", sep = ";")
power$Date <- dmy(power$Date)
power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(ymd_hms(paste(power$Date, power$Time)), power$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)")
dev.off()
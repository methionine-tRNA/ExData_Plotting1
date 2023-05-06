library(lubridate)

power <- read.csv("household_power_consumption.txt", sep = ";")
power$Date <- dmy(power$Date)
power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(power$Global_active_power), 
     main = "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
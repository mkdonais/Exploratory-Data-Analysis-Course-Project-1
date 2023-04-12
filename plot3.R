#load libraries
library(dplyr)
library(lubridate)

#Loads in file 
filename <- "household_power_consumption.txt"
temp <- read.table(filename, sep = ";", header = TRUE, 
                   na.strings = "?")

#Subsets data needed for Course Project 1
project1data <- subset(temp,temp$Date == "1/2/2007" | temp$Date ==
                         "2/2/2007")

# Converts Date and Time variables to Date/Time classes 
# and combines into one Date-time variable
project1data$datetime <- paste(project1data$Date, project1data$Time)
project1data$dt2 <- dmy_hms(project1data$datetime)

#Plot 3
png("plot3.png", width = 480, height = 480)
plot(project1data$dt2, project1data$Sub_metering_1, type =
       "l", xlab = "", ylab = "Energy sub metering", lwd = 2)
lines(project1data$dt2, project1data$Sub_metering_2, col = "red", lwd = 2)
lines(project1data$dt2, project1data$Sub_metering_3, col = "blue", lwd = 2)
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2",
      "Sub_metering_3"), col = c("black", "red", "blue", lwd = 2),
       lty = 1)
dev.off()


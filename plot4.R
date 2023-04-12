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

# Sets margins/columns/rows and generates plots to file
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(5,4,4,2))
with(project1data,{
  #upper left plot
  plot(project1data$dt2, project1data$Global_active_power, type =
      "l", xlab = "", ylab = "Global Active Power (kilowatts)",
      lwd = 1)
  #Upper right plot
  plot(project1data$dt2, project1data$Voltage, type =
         "l", lwd = 1, xlab = "datetime", ylab = "Voltage", yaxt = "n")
  axis(2, at = seq(234, 246, 4))
  axis(2, at = seq(234, 246, 2),labels = NA)
  #lower left plot
  plot(project1data$dt2, project1data$Sub_metering_1, type =
      "l", xlab = "", ylab = "Energy sub metering", lwd = 2)
  lines(project1data$dt2, project1data$Sub_metering_2, col = "red", lwd = 2)
  lines(project1data$dt2, project1data$Sub_metering_3, col = "blue", lwd = 2)
  legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2",
      "Sub_metering_3"), col = c("black", "red", "blue", lwd = 2),
      lty = 1)
  # Lower right plot
  plot(project1data$dt2, project1data$Global_reactive_power, type =
         "l", lwd = 1, xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()


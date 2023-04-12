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

#Plot 2
png("plot2.png", width = 480, height = 480)
plot(project1data$dt2, project1data$Global_active_power, type =
       "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


#load libraries
library(dplyr)
library(ggplot2)

#Loads in file 
filename <- "household_power_consumption.txt"
temp <- read.table(filename, sep = ";", header = TRUE, 
  na.strings = "?")

#Subsets data needed for Course Project 1
project1data <- subset(temp,temp$Date == "1/2/2007" | temp$Date ==
      "2/2/2007")

#Plot 1
png("plot1.png", width = 480, height = 480)
hist(project1data$Global_active_power, col = "red", xlab = 
       "Global Active Power (kilowatts)", main = 
       "Global Active Power", ylim = c(0, 1200))
dev.off()


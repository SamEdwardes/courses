library(dplyr)
library(readr)
library(lubridate)

# Load the data
power <- read_csv2('Exploratory_Data_Analysis_Project_1\\household_power_consumption.txt')


## Clean the data

power$Date <-  dmy(power$Date) # convert to date
power <- filter(power, Date >= date('2007-02-01') & Date <= date('2007-02-02')) # filter on date range
power$Date_Time <- ymd(power$Date) + hms(power$Time) # create a date_time column
power$Global_active_power <- as.numeric(power$Global_active_power) # convert to a number
power$Global_reactive_power <- as.numeric(power$Global_reactive_power) # convert to a number
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1) # covnert to a number
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2) # covnert to a number
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3) # covnert to a number


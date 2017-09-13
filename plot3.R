# Week 1, Project 1
#
# The purpose of this script is to reconstruct plot3 using the base plotting system.
# Source data set is obtained from: UC Irvine Machine Learning Repository
#
# The script will perform the following steps:
#    1. Download the data set if not yet available.
#    2. Load the data into a variable.
#    3. Extract subset corresponding to 2007-02-01 and 2007-02-02.
#    4. Open png graphic device.
#    5. Use base plotting system to render the plot.
#    6. Close the graphic device and release the memory.

library(data.table)

if ( ! file.exists("household_power_consumption.txt") ) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
    unzip("household_power_consumption.zip")
}

data <- fread("household_power_consumption.txt", na.strings=c("?"))
dtset <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

png(filename = "plot3.png", width = 480, height = 480, units = "px")

x <- strptime(paste(dtset$Date, ' ', dtset$Time), '%d/%m/%Y %H:%M:%S')
plot(x, dtset$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
lines(x, dtset$Sub_metering_1, type='l', col = "black")
lines(x, dtset$Sub_metering_2, type='l', col = "red")
lines(x, dtset$Sub_metering_3, type='l', col = "blue")
legend('topright', lty=1, col=c('black','red','blue'), legend =c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.off()
# release memory
rm(data, dtset)

# Week 1, Project 1
#
# The purpose of this script is to reconstruct plot1 using the base plotting system.
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

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(dtset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
# release memory
rm(data, dtset)

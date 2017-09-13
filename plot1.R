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
rm(data)

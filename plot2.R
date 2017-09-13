library(data.table)

if ( ! file.exists("household_power_consumption.txt") ) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
    unzip("household_power_consumption.zip")
}

data <- fread("household_power_consumption.txt", na.strings=c("?"))
dtset <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

png(filename = "plot2.png", width = 480, height = 480, units = "px")

x <- strptime(paste(dtset$Date, ' ', dtset$Time), '%d/%m/%Y %H:%M:%S')
plot(x, dtset$Global_active_power, type='n', xlab='', ylab='Global Active Power (kilowatts)')
lines(x, dtset$Global_active_power, type='l')

dev.off()
# release memory
rm(data)

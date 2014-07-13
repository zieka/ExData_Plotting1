#
# Plot3.R
#
# Copyright (C) 2014 Kyle Scully
#
# Author(s)/Maintainer(s):
# Kyle Scully
#
# This script does the following:
#
#  * Recreates the plot in figure/unnamed-chunk-4.png
#

#@DOWNLOAD FILE
###############
if (!file.exists("./household_power_consumption.txt")){
	download.file(
		"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
		destfile = "./household_power_consumption.zip",
		method = "curl"
	)

	unzip("./household_power_consumption.zip")
}

#@READ DATA
#############
data <- read.table(
	"./household_power_consumption.txt",
	sep = ";",
	header = TRUE,
	stringsAsFactors = FALSE,
	na.strings = "?"
)

#@SUBSET DATA
#############
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#@PLOT DATA AND WRITE
#####################
png(
	"plot3.png",
	width = 480,
	height = 480
)

plot(
	data$Time,
	data$Sub_metering_1,
	xlab = "",
	ylab = "Energy sub metering",
	type = "l",
)

lines(
	data$Time,
	data$Sub_metering_2,
	col = "red"
)

lines(
	data$Time,
	data$Sub_metering_3,
	col = "blue"
)

legend(
	"topright",
	col = c("black","red","blue"),
	lty = c(1,1,1),
	legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

dev.off()
#
# Plot1.R
#
# Copyright (C) 2014 Kyle Scully
#
# Author(s)/Maintainer(s):
# Kyle Scully
#
# This script does the following:
#
#  * Recreates the plot in figure/unnamed-chunk-2.png
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
	"plot1.png",
	width = 480,
	height = 480
)

hist(
	data$Global_active_power,
	main = "Global Active power",
	col = "red",
	xlab = "Global Active Power (kilowatts)"
)

dev.off()




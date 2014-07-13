#
# Plot4.R
#
# Copyright (C) 2014 Kyle Scully
#
# Author(s)/Maintainer(s):
# Kyle Scully
#
# This script does the following:
#
#  * Recreates the plot in figure/unnamed-chunk-5.png
#

#@DOWNLOAD FILE
###############

if (!file.exists("./household_power_consumption.txt")){
	download.file(
		"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
		destfile="./household_power_consumption.zip",
		method="curl"
	)

	unzip("./household_power_consumption.zip")
}

#@READ DATA
#############
data <- read.table(
	"./household_power_consumption.txt",
	sep=";",
	header=TRUE,
	stringsAsFactors=FALSE,
	na.strings="?"
	)

#@SUBSET DATA
#############
dataset <- as.Date(data$Date,"%d/%m/%Y")
dataset <- cbind(dataset, data)
colnames(dataset)[1] <- "Date_obj"
dataset <- subset(dataset, Date_obj>="2007-02-01" & Date_obj<="2007-02-02")

#@PLOT DATA
#############

#@WRITE PNG
#############

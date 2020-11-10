## Setting the working directory
setwd("C:/Users/happy/Desktop/R Project/ExData_Plotting1/")

## Download Variables
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
ZipFile <- "C:/Users/happy/Desktop/R Project/ExData_Plotting1/household_power_consumption.zip"
TextFile <- "C:/Users/happy/Desktop/R Project/ExData_Plotting1/household_power_consumption.txt"

## Download Datasets

download.file(URL, ZipFile)

## Unzip the Datafile
unzip(ZipFile)

## Read the Text file
AllData <- read.table(TextFile, header=T, sep=";", na.strings="?", , colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Separate data from 2007-02-01 to 2007-02-02
GraphData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007"),]

## Convert the Date and Time variables to Date/Time classes

SetTime <-strptime(paste(GraphData$Date, GraphData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
GraphData <- cbind(SetTime, GraphData)

## Plot 3
plot(GraphData$SetTime, GraphData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(GraphData$SetTime, GraphData$Sub_metering_2, col="red")
lines(GraphData$SetTime, GraphData$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=c(1,1,1))

## Save file and close device
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
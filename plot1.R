library(dplyr)
library(lubridate)
#download and unzip the file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile=paste(getwd(),"/power.zip",sep=""),method="libcurl")
unzip("power.zip")
#get the txt file unzipped in the wd, then read.table to the environment
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#get the subset of that datatable
subsetpower<-dplyr::filter(power,Date=="1/2/2007"|Date=="2/2/2007")
#draw the hist in the actual device
hist(subsetpower$Global_active_power[!is.na(subsetpower$Global_active_power)],col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
#copy it into the plot1.png
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()
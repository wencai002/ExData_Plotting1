library(dplyr)
library(lubridate)
##optionally, assume is run in plot1.R
##download and unzip the file
#fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile=paste(getwd(),"/power.zip",sep=""),method="libcurl")
#unzip("power.zip")
##get the txt file unzipped in the wd, then read.table to the environment
#power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
##get the subset of that datatable
#subsetpower<-dplyr::filter(power,Date=="1/2/2007"|Date=="2/2/2007")
#subsetpower<-dplyr::mutate(subsetpower,zeit=paste(Date,Time,sep="_"))
Sys.setlocale("LC_TIME", "English")
subsetpower$zeit<-lubridate::dmy_hms(subsetpower$zeit)
##get the weekdays of each row and put it in weekday
subsetpower<-dplyr::mutate(subsetpower,weekday=weekdays(zeit))
##plot the data with "l" line
with(subsetpower,plot(zeit,Global_active_power,"l",xlab="",ylab="Global Active Power (Kilowatts)"))
##save it to plot2.png
dev.copy(png,"plot2.png",width = 480,height = 480)
dev.off()
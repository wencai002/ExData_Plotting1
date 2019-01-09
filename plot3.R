library(dplyr)
library(lubridate)
##optionally, assume is run in plot2.R
##download and unzip the file
#fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile=paste(getwd(),"/power.zip",sep=""),method="libcurl")
#unzip("power.zip")
##get the txt file unzipped in the wd, then read.table to the environment
#power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
##get the subset of that datatable
#subsetpower<-dplyr::filter(power,Date=="1/2/2007"|Date=="2/2/2007")
#subsetpower<-dplyr::mutate(subsetpower,zeit=paste(Date,Time,sep="_"))
#Sys.setlocale("LC_TIME", "English")
#subsetpower$zeit<-lubridate::dmy_hms(subsetpower$zeit)
##get the weekdays of each row and put it in weekday
#subsetpower<-dplyr::mutate(subsetpower,weekday=weekdays(zeit))
png("plot3.png",width = 480,height = 480)
with(subsetpower,plot(zeit,Sub_metering_1,"n",xlab="",ylab="Energy sub metering"))
with(subsetpower,points(zeit,Sub_metering_1,"l"))
with(subsetpower,points(zeit,Sub_metering_2,"l",col="red"))
with(subsetpower,points(zeit,Sub_metering_3,"l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=names(subsetpower)[7:9])
dev.off()
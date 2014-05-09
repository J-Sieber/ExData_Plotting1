
# Read data from working dir
myData <- read.table("./household_power_consumption.txt", sep=";",header = TRUE,stringsAsFactors = FALSE)

#View data
View(myData)

#Find the dates needed
good<-myData$Date=="2/2/2007" | myData$Date=="1/2/2007"

#Get data with good dates
myData<-myData[good,]
row.names(myData)<-NULL

#View data
View(myData)

#Set 480 X 480 and margins
par(pin=c(6.013333,5.060556),mar=c(5.1,4.1,4.1,2.1))
par(mfrow=c(1,1))

#Create and Save Plot 1
xname<-"Global Active Power (kilowatts)"
title<- "Global Active Power"
hist(as.numeric(myData$Global_active_power),xlab=xname,main=title,col="red")
dev.copy(png,'plot1.png')
dev.off()
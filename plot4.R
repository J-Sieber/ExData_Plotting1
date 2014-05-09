myData <- read.table("./household_power_consumption.txt", sep=";",header = TRUE,
                     stringsAsFactors = FALSE)

myData$Date<-as.Date(myData$Date,"%d/%m/%Y")
myData<-myData[which(myData$Date == as.Date("2007-02-01") | 
                         myData$Date == as.Date("2007-02-02")), ]

NewTime<-paste(myData$Date,myData$Time)
NewTime<-strptime(NewTime,"%Y-%m-%d %H:%M:%S")




#Create and Save Plot 4
par(mfrow=c(2,2))
#1
yname<-"Global Active Power"
xlabel<-c("Thu","Fri","Sat")
plot(as.numeric(myData$Global_active_power),ylab=yname,xlab="",type="l",xaxt="n")
axis(1,at=c(0,1440,2880),labels=xlabel)

#2
yname<-"Voltage"
xlabel<-c("Thu","Fri","Sat")
plot(NewTime, y=as.numeric(myData$Voltage),ylab=yname,xlab="datetime",type="l")
axis(1,at=c(0,1440,2880),labels=xlabel)
axis(2,at=c(0,323,485,646,808,969,1131,1292,1454,1615,1777,1938,2100),labels=c(234:246))

#3
plot(NewTime,y=as.numeric(myData$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(NewTime, y = as.numeric(myData$Sub_metering_2), col = "red")
lines(NewTime, y = as.numeric(myData$Sub_metering_3), col = "blue")
Leg<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = Leg)

#4
yname<-"Global_reactive_power"
xlabel<-c("Thu","Fri","Sat")
plot(as.numeric(myData$Global_reactive_power),ylab=yname,xlab="",type="l",xaxt="n")
axis(1,at=c(0,1440,2880),labels=xlabel)


dev.copy(png,'plot4.png')
dev.off()


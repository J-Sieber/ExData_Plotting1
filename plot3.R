
# Read data from working dir
myData <- read.table("./household_power_consumption.txt", sep=";",header = TRUE,
                     stringsAsFactors = FALSE)

myData$Date<-as.Date(myData$Date,"%d/%m/%Y")
myData<-myData[which(myData$Date == as.Date("2007-02-01") | 
                     myData$Date == as.Date("2007-02-02")), ]

NewTime<-paste(myData$Date,myData$Time)
NewTime<-strptime(NewTime,"%Y-%m-%d %H:%M:%S")

#Set 480 X 480 and margins
par(pin=c(6.013333,5.060556),mar=c(5.1,4.1,4.1,2.1))
par(mfrow=c(1,1))

#Create and Save Plot 3
plot(NewTime,y=as.numeric(myData$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(NewTime, y = as.numeric(myData$Sub_metering_2), col = "red")
lines(NewTime, y = as.numeric(myData$Sub_metering_3), col = "blue")
Leg<-c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  ")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = Leg)
dev.copy(png,'plot3.png')
dev.off()

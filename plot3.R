# reading the data, and coverting the time field.
file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
file_sub<-subset(file,Date=="2007-02-01")
file_sub<-rbind(file_sub,subset(file,Date=="2007-02-02"))

# Plot 3
plot(file_sub$Time,file_sub$Sub_metering_1,type="n",xlab="Day",ylab="Global Active Power(Kilowatts)")
lines(file_sub$Time,file_sub$Sub_metering_1)
lines(file_sub$Time,file_sub$Sub_metering_2,col="red")
lines(file_sub$Time,file_sub$Sub_metering_3,col="blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!


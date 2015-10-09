# reading the data, and coverting the time field.
file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
file_sub<-subset(file,Date=="2007-02-01")
file_sub<-rbind(file_sub,subset(file,Date=="2007-02-02"))

# plot 4
par(mfrow=c(2,2))
plot(file_sub$Time,file_sub$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(file_sub$Time,file_sub$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(file_sub$Time,file_sub$Sub_metering_1,type="n",xlab="",ylab="Energy Sub metering")
lines(file_sub$Time,file_sub$Sub_metering_1)
lines(file_sub$Time,file_sub$Sub_metering_2,col="red")
lines(file_sub$Time,file_sub$Sub_metering_3,col="blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
plot(file_sub$Time,file_sub$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!


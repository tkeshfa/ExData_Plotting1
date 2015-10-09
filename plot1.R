# reading the data, and coverting the time field.
file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
file_sub<-subset(file,Date=="2007-02-01")
file_sub<-rbind(file_sub,subset(file,Date=="2007-02-02"))

# plot 1
hist(file_sub$Global_active_power, col="red" , xlab="Global Active Power (Kilowatts)", main="Global Active Power")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!


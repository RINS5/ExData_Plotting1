plot3 <- function() {
	data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors=FALSE)
	data[,1] <- as.Date(data[,1], "%d/%m/%Y") #Convert from character 'dd/mm/yyyy' to date format yyyy-mm-dd
	data[,3] <- as.numeric(data[,3]) #Convert Global_active_power to Numeric
	dateRange <- rbind(data[data[,1]=='2007-02-01',],data[data[,1]=='2007-02-02',]) #Select and combine Feb 1 data with Feb 2 data
	
	plot(dateRange$Sub_metering_1, type="n", xaxt = "n", ylab = "Energy sub metering", xlab="")
	points(dateRange$Sub_metering_1, type="l")
	points(dateRange$Sub_metering_2, type="l", col="red")
	points(dateRange$Sub_metering_3, type="l", col="blue")
	axis(1, at=c(0,1440,2880), las=0, labels=c("Thu","Fri","Sat"))
	legend("topright", text.width = strwidth("10000000000000"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))

	dev.copy(png, file = "plot3.png") #Copy/Save to png file
	dev.off()
}
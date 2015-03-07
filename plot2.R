plot2 <- function() {
	data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors=FALSE)
	data[,1] <- as.Date(data[,1], "%d/%m/%Y") #Convert from character 'dd/mm/yyyy' to date format yyyy-mm-dd
	data[,3] <- as.numeric(data[,3]) #Convert Global_active_power to Numeric
	dateRange <- rbind(data[data[,1]=='2007-02-01',],data[data[,1]=='2007-02-02',]) #Select and combine Feb 1 data with Feb 2 data
	
	plot(dateRange$Global_active_power, xaxt = "n", type="l", ylab = "Global Active Power (kilowatts)", xlab="")
	axis(1, at=c(0,1440,2880), las=0, labels=c("Thu","Fri","Sat")) #Draw x axis labels
	
	dev.copy(png, file = "plot2.png") #Copy/Save to png file
	dev.off()
}
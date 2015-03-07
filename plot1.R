plot1 <- function() {
	data <- read.table("household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors=FALSE)
	data[,1] <- as.Date(data[,1], "%d/%m/%Y") #Convert from character 'dd/mm/yyyy' to date format yyyy-mm-dd
	data[,3] <- as.numeric(data[,3]) #Convert Global_active_power to Numeric
	dateRange <- rbind(data[data[,1]=='2007-02-01',],data[data[,1]=='2007-02-02',]) #Select and combine Feb 1 data with Feb 2 data
	
	hist(dateRange$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
	
	dev.copy(png, file = "plot1.png") #Copy/Save to png file
	dev.off()
}
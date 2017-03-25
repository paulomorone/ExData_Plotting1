##### PLOT 4

#Read the data
file <- "C:/Users/paulo.morone/Dropbox/Data Science - Coursera/4 - Exploratory Analisys/Week 1/Power_consumption/household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, na.strings="?", sep=";")
hpcfeb <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Transform and add a new column date
hpcfeb$Date <- as.Date(hpcfeb$Date, format="%d/%m/%Y")
DT <- paste(hpcfeb$Date, hpcfeb$Time)
hpcfeb$Full_Date <- as.POSIXct(DT)

# Change the plot layout
par(mfrow=c(2,2))

# Plot all graphics using hpcfeb
with(hpcfeb, {
			plot(Full_Date, Global_active_power, type = "l", xlab="datetime", ylab="Global Active Power" ) # 1st Graph
			plot(Full_Date, Voltage, type = "l", xlab="", ylab="Voltage" )								   # 2nd Graph
			plot(Full_Date,Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering" )			   # 3rd Graph
			lines(Full_Date, Sub_metering_2, type = "l", col = "red")									   # Add line to the 3rd graph
			lines(Full_Date, Sub_metering_3, type = "l", col = "blue")									   # Add line to the 3rd graph
			legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8) # Add legend to the 3rd graph
			plot(Full_Date, Global_reactive_power, type = "l", xlab="datetime", ylab="Global Reactive Power" ) # 4th Graph
	})
	
# Copy to a PNG file	
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()	
##### PLOT 3
#Read the data
file <- "C:/Users/paulo.morone/Dropbox/Data Science - Coursera/4 - Exploratory Analisys/Week 1/Power_consumption/household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, na.strings="?", sep=";")
hpcfeb <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Transform and add a new column date
hpcfeb$Date <- as.Date(hpcfeb$Date, format="%d/%m/%Y")
DT <- paste(hpcfeb$Date, hpcfeb$Time)
hpcfeb$Full_Date <- as.POSIXct(DT)

#Plot the graph
plot(hpcfeb$Sub_metering_1~hpcfeb$Full_Date, type = "l", xlab="", ylab="Energy sub metering" )
lines(hpcfeb$Sub_metering_2~hpcfeb$Full_Date, type = "l", col = "red")
lines(hpcfeb$Sub_metering_3~hpcfeb$Full_Date, type = "l", col = "blue")

#Plot the legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

# Copy to a PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
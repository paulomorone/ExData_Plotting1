##### PLOT 2
#Read the data
file <- "C:/Users/paulo.morone/Dropbox/Data Science - Coursera/4 - Exploratory Analisys/Week 1/Power_consumption/household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, na.strings="?", sep=";")
hpcfeb <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Transform and add a new column date
hpcfeb$Date <- as.Date(hpcfeb$Date, format="%d/%m/%Y")
DT <- paste(hpcfeb$Date, hpcfeb$Time)
hpcfeb$Full_Date <- as.POSIXct(DT)

#Plot the graph
plot(hpcfeb$Global_active_power~hpcfeb$Full_Date, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

# Copy to a PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
##### PLOT 1
#Read the data
file <- "C:/Users/paulo.morone/Dropbox/Data Science - Coursera/4 - Exploratory Analisys/Week 1/Power_consumption/household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, na.strings="?", sep=";")
hpcfeb <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Plot the graph
hist(hpcfeb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

# Copy to a PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
# Plot plot3.png
setwd("./exdata_data_household_power_consumption")
# read in header only
consumptionHeader <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
# only load the rows required
consumptionData <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip=(grep("1/2/2007", readLines("household_power_consumption.txt"))-1),nrows=2880)
colnames(consumptionData) <- consumptionHeader

# convert datetime to as.POSIXct

consumptionData$DateTime <- strptime(paste(consumptionData$Date, consumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# save in png format
png("plot3.png", width = 480, height = 480)
with(consumptionData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(consumptionData, lines(DateTime, Sub_metering_2, col = "red"))
with(consumptionData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
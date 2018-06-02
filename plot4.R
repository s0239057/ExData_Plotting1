# Plot plot4.png
setwd("C:/Users/Paddy/Documents/Work/data_sci/JHcourse/Coursera/WEEK4_Exploratory_Data/Week_1/Assignment/exdata_data_household_power_consumption")
# read in header only
consumptionHeader <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
# only load the rows required
consumptionData <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip=(grep("1/2/2007", readLines("household_power_consumption.txt"))-1),nrows=2880)
colnames(consumptionData) <- consumptionHeader

# convert datetime to as.POSIXct

consumptionData$DateTime <- strptime(paste(consumptionData$Date, consumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot the histogram for Gloabal Active Power
# save in png format
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(consumptionData, {
  plot(DateTime, Global_active_power, type="l", xlab = "", ylab="Global Active Power")
  plot(DateTime, Voltage, type="l", xlab = "datetime", ylab="Voltage")
  with(consumptionData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  with(consumptionData, lines(DateTime, Sub_metering_2, col = "red"))
  with(consumptionData, lines(DateTime, Sub_metering_3, col = "blue"))
  legend("topright", lty = 1, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
})
dev.off()
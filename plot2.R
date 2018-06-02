# Plot plot2.png
setwd("./exdata_data_household_power_consumption")
# read in header only
consumptionHeader <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
# only load the rows required
consumptionData <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip=(grep("1/2/2007", readLines("household_power_consumption.txt"))-1),nrows=2880)
colnames(consumptionData) <- consumptionHeader

# convert datetime to as.POSIXct

consumptionData$DateTime <- strptime(paste(consumptionData$Date, consumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# save in png format
png("plot2.png", width = 480, height = 480)
plot(consumptionData$DateTime,consumptionData$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()


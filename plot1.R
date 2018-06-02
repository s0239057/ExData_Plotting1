# Plot plot1.png
setwd("./exdata_data_household_power_consumption")
# read in header only
consumptionHeader <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
# only load the rows required
consumptionData <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip=(grep("1/2/2007", readLines("household_power_consumption.txt"))-1),nrows=2880)
colnames(consumptionData) <- consumptionHeader
# plot the histogram for Gloabal Active Power
# save in png format
png("plot1.png", width = 480, height = 480)
hist(consumptionData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
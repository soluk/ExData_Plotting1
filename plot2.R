#unzip and subset data
unzip("exdata_data_household_power_consumption.zip")
library(data.table)
hpcraw <- fread("household_power_consumption.txt", sep=";", na.strings="?")
hpc <- subset(hpcraw, Date=="1/2/2007"|Date=="2/2/2007")

#create new Timestamp variable with date+time
hpc$Timestamp <- as.POSIXct(paste(as.Date(hpc$Date, format="%d/%m/%Y"), hpc$Time))

#plot line plot into png graphics device
png("plot2.png", width=480, height=480, units="px")
with(hpc, plot(Timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

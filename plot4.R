#unzip, read, and subset data
unzip("exdata_data_household_power_consumption.zip")
library(data.table)
hpcraw <- fread("household_power_consumption.txt", sep=";", na.strings="?")
hpc <- subset(hpcraw, Date=="1/2/2007"|Date=="2/2/2007")

#create new Timestamp variable with Date+Time as POSIXct
hpc$Timestamp <- as.POSIXct(paste(as.Date(hpc$Date, format="%d/%m/%Y"), hpc$Time))

#use PNG device, configure 2x2 plotting space
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

#plot the 4 plots required
with(hpc, plot(Timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(hpc, plot(Timestamp, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(hpc, plot(Timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc, lines(Timestamp, Sub_metering_2, col="red"))
with(hpc, lines(Timestamp, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(hpc, plot(Timestamp, Global_reactive_power, type="l", xlab="datetime"))
dev.off()

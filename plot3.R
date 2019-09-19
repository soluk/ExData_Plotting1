#unzip and subset data
unzip("exdata_data_household_power_consumption.zip")
library(data.table)
hpcraw <- fread("household_power_consumption.txt", sep=";", na.strings="?")
hpc <- subset(hpcraw, Date=="1/2/2007"|Date=="2/2/2007")

#create new Timestamp variable with Date+Time as POSIXct
hpc$Timestamp <- as.POSIXct(paste(as.Date(hpc$Date, format="%d/%m/%Y"), hpc$Time))

#plot multiline plot into png graphics device
png("plot3.png", width=480, height=480, units="px")
with(hpc, plot(Timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc, lines(Timestamp, Sub_metering_2, col="red"))
with(hpc, lines(Timestamp, Sub_metering_3, col="blue"))

#add legend
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#unzip and subset data
unzip("exdata_data_household_power_consumption.zip")
library(data.table)
hpcraw <- fread("household_power_consumption.txt", sep=";", na.strings="?")
hpc <- subset(hpcraw, Date=="1/2/2007"|Date=="2/2/2007")

#plot into png graphics device
png("plot1.png", width=480, height=480, units="px")
hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()

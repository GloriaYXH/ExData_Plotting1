library(sqldf)
hpc0 <- read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                     "select * from file where Date in ('1/2/2007','2/2/2007')", 
                     sep = ";", header=T)

datetime <- strptime(paste(hpc0$Date, hpc0$Time), "%d/%m/%Y%H:%M:%S")

DT <- cbind(datetime, hpc0[,c(3:9)])


#plot4
png(file="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2), mar=c(4,2,2,1))

with(DT, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(DT, plot(datetime, Voltage, type="l"))

with(DT, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(DT$datetime, DT$Sub_metering_2, col="red")
lines(DT$datetime, DT$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(DT, plot(datetime, Global_reactive_power, type="l"))

dev.off()



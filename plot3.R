library(sqldf)
hpc0 <- read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                     "select * from file where Date in ('1/2/2007','2/2/2007')", 
                     sep = ";", header=T)

datetime <- strptime(paste(hpc0$Date, hpc0$Time), "%d/%m/%Y%H:%M:%S")

DT <- cbind(datetime, hpc0[,c(3:9)])

#plot3
png(file="plot3.png", width=480, height=480, units="px")
with(DT, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(DT$datetime, DT$Sub_metering_2, col="red")
lines(DT$datetime, DT$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()





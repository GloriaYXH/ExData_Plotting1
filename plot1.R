#install sqldf package if not already

library(sqldf)
hpc0 <- read.csv.sql("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                   "select * from file where Date in ('1/2/2007','2/2/2007')", 
                   sep = ";", header=T)

datetime <- strptime(paste(hpc0$Date, hpc0$Time), "%d/%m/%Y%H:%M:%S")

DT <- cbind(datetime, hpc0[,c(3:9)])

#plot1
hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width=480, height=480, units="px")
dev.off()


     
     



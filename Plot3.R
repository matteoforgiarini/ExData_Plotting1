setwd("~/Google Drive/Github/ExData_Plotting1")
data=read.csv2(file = "household_power_consumption.txt",  header = T, sep=";")
head(data)
str(data)
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 

data$Date=strptime(data$Date, "%d/%m/%Y")
head(data)
data$Time=strptime(data$Time, "%H:%M:%S")
head(data)

start.date = as.POSIXct("2007-02-01")
end.date = as.POSIXct("2007-02-02")
d = subset(data, Date >= start.date & Date <= end.date)
d$wd=weekdays(d$Date, abbreviate=T)
head(d)
str(d)

d$Sub_metering_1=as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2=as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3=as.numeric(as.character(d$Sub_metering_3))
str(d)

png(file = "plot3.png",  width = 480, height = 480)
par(mar=c(3, 4, 2, 4))
plot(d$Sub_metering_1, xaxt = "n", ylab = "Energy sub metering", cex.main=0.8, cex.lab=0.8, cex.axis=0.8, type = "l")
lines(d$Sub_metering_2, col="red")
lines(d$Sub_metering_3, col="blue")
axis(1, c(0,1450,2900), c("Thu","Fry", "Sat"),  cex.axis=0.7)
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue", cex=0.6))
dev.off()


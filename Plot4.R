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
d$Global_active_power=as.numeric(as.character(d$Global_active_power))
d$Voltage=as.numeric(as.character(d$Voltage))
d$Global_reactive_power=as.numeric(as.character(d$Global_reactive_power))
head(d)
str(d)


png(file = "plot4.png",  width = 480, height = 480)
par(mfcol = c(2, 2))          
par(mar=c(3, 4, 2, 2))

#1,1
plot(d$Global_active_power,xaxt = "n", mar=c(3,4,4,2), ylab = "Global Ative Power", cex.main=0.8, cex.lab=1, cex.axis=1, type = "l")
axis(1, c(0,1450,2900), c("Thu","Fry", "Sat"),  cex.axis=0.9)

#2,1
plot(d$Sub_metering_1, xaxt = "n", ylab = "Energy sub metering", cex.main=0.8, cex.lab=1, cex.axis=0.9, type = "l")
lines(d$Sub_metering_2, col="red")
lines(d$Sub_metering_3, col="blue")
axis(1, c(0,1450,2900), c("Thu","Fry", "Sat"),  cex.axis=0.9)
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty=1, col=c("black", "red", "blue", cex=0.3))

#1,2
plot(d$Voltage,xaxt = "n", mar=c(3,4,4,2), ylab = "Voltage",cex.main=0.8, cex.lab=1, cex.axis=1, type = "l")
axis(1, c(0,1450,2900), c("Thu","Fry", "Sat"),  cex.axis=0.9)

#2,2
plot(d$Global_reactive_power,xaxt = "n", mar=c(3,4,4,2), ylab = "Global_reactive_power", cex.main=1, cex.lab=1, cex.axis=0.7, type = "l")
axis(1, c(0,1450,2900), c("Thu","Fry", "Sat"),  cex.axis=0.9)

dev.off()


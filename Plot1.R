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
end.date = as.POSIXct("2007-02-02T")
d = subset(data, Date >= start.date & Date <= end.date)
head(d)
str(d)
d$Global_active_power=as.numeric(as.character(d$Global_active_power))
str(d)
png(file = "plot1.png",  width = 480, height = 480)
hist(d$Global_active_power,  main="Global Ative Power",  col="red", cex.main=0.8, cex.lab=0.8, cex.axis=0.7, xlab="Global Ative Power (kilowatts)", ylim=c(0, 1320))
dev.off()

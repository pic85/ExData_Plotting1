data <- read.table("/media/tommaso/TrekStor/Documents/Coursera/Exploratory Data Analysis/week 1/assignement/household_power_consumption.txt", sep=";", dec=".", head=TRUE,na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Time <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")


data <- data[data$Date >= "2007-02-01",]
data <- data[data$Date <= "2007-02-02",]



png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(data$Time,data$Global_active_power, type = "l", ylab="Global active power (kilowatts)", xlab="")

plot(data$Time,data$Sub_metering_1, type="l", ylab="Global active power (kilowatts)",xlab="")
lines(data$Time,data$Sub_metering_2, type="l", col="red")
lines(data$Time,data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("black", "red", "blue"), lty=1, cex=0.8)

plot(data$Time,data$Voltage, type = "l", ylab="Voltage", xlab="datetime")

plot(data$Time,data$Global_reactive_power, type = "l", xlab="datetime")
dev.off()

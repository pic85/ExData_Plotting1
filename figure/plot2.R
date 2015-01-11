data <- read.table("/media/tommaso/TrekStor/Documents/Coursera/Exploratory Data Analysis/week 1/assignement/household_power_consumption.txt", sep=";", dec=".", head=TRUE,na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Time <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

data <- data[data$Date >= "2007-02-01",]
data <- data[data$Date <= "2007-02-02",]


png("plot2.png", width = 480, height = 480)
plot(data$Time,data$Global_active_power, type = "l", ylab="Global active power (kilowatts)", xlab="")
dev.off()
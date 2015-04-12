# Read full data 
data <- read.table("./data/household_power_consumption.txt", sep=";", header=T, quote="", strip.white=TRUE, stringsAsFactors=F, na.strings="?")
head(data)

# Get data of two days
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007")) 

# Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Type of plot, naming and size
png("plot3.png", width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")

lines(data$DateTime, data$Sub_metering_2, type="l", col="red")

lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=1, col=c("black", "red", "blue"))

dev.off()

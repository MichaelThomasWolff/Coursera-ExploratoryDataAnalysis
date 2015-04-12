# Read full data 
data <- read.table("./data/household_power_consumption.txt", sep=";", header=T, quote="", strip.white=TRUE, stringsAsFactors=F, na.strings="?")
head(data)

# Get data of two days
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007")) 

# Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Type of plot, naming and size
png("plot4.png", width=480, height=480)

# Make sub-plots
par(mfrow=c(2,2)) 

# Plot top left
plot(data$DateTime, data$Global_active_power, type="l", lwd=1, ylab="Global Active Power (kW)", xlab="") 

# Plot top right
plot(data$DateTime, data$Voltage, type="l", xlab="", ylab="Voltage")   

# Plot bottom left
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# Plot bottom right
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power")  

dev.off()

# Read full data 
data <- read.table("./data/household_power_consumption.txt", sep=";", header=T, quote="", strip.white=TRUE, stringsAsFactors=F, na.strings="?")
head(data)

# Get data of two days 
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007")) 

# Type of plot, naming and size
png("plot1.png", width=480, height=480)

hist(data$Global_active_power, col="red", xlab="Global Active Power (kW)", ylab= "Frequency", main="Global Active Power")

dev.off()
# Read full data 
data <- read.table("./data/household_power_consumption.txt", sep=";", header=T, quote="", strip.white=TRUE, stringsAsFactors=F, na.strings="?")
head(data)

# Get data of two days
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007")) 

# Change date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Type of plot, naming and size
png("plot2.png", width=480, height=480)

plot(data$DateTime, data$Global_active_power, type="l", lwd=1, ylab="Global Active Power (kW)", xlab="")

dev.off()
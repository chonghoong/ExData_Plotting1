## read in the full dataset
tmp <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, 
                sep = ";", na.strings  = "?", check.names = FALSE,  comment.char = "", stringsAsFactors = FALSE, 
                quote = "")

## convert Date
tmp$Date <- as.Date(tmp$Date, format = "%d/%m/%Y")

## subset the data based on the required date range
data <- subset(tmp, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combining the Date and Time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot 4
png(filename = "plot4.png", width = 480, height = 480)

## set the mfrow parameter
par(mfrow=c(2,2))

## top left plot 
plot(data$Global_active_power~data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

## top right plot 
plot(data$Voltage~data$Datetime, type="l", ylab="Voltage (volt)", xlab="")

## bottom left plot
plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

lines(data$Sub_metering_2~data$Datetime,col='Red')

lines(data$Sub_metering_3~data$Datetime,col='Blue')

legend("topright",
       lty = c(1,1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", cex = 0.8)

## bottom right plot
plot(data$Global_reactive_power~data$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
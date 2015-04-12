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

## Display Plot 2 - Line Plot
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
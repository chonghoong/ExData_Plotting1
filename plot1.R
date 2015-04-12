## read in the full dataset
tmp <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, 
                sep = ";", na.strings  = "?", check.names = FALSE,  comment.char = "", stringsAsFactors = FALSE, 
                quote = "")

## convert Date
tmp$Date <- as.Date(tmp$Date, format = "%d/%m/%Y")

## subset the data based on the required date range
data <- subset(tmp, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Display Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


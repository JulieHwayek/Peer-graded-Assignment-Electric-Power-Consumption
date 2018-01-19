getwd()
DS <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
               stringsAsFactors = F, comment.char = "", quote = '\"')
DS$Date <- as.Date(DS$Date, format = "%d/%m/%Y")


Sub_DS <- subset(DS, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DS)

CDATE <- paste(as.Date(Sub_DS$Date), Sub_DS$Time)
Sub_DS$Datetime <- as.POSIXct(CDATE)

plot(Sub_DS$Global_active_power ~ Sub_DS$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, 'plot2.png')
dev.off()
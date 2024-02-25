##Download, unzip and load dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "C:/Users/Ailee/Downloads/datasciencecoursera/
              Course 4/UCIIHEPCdataset/UCI IHEPC dataset.zip", method = "curl")
unzip("UCI IHEPC dataset.zip", exdir = "UCI IHEPC dataset")
power <- read.table("C:/Users/Ailee/Downloads/datasciencecoursera/Course 4/
                    UCIIHEPCdataset/UCI IHEPC dataset/household_power_consumption.txt", 
                    header = TRUE, sep = ";", dec = ".", na.strings = "?")
str(power)

##Subset values and convert the Date and Time variables to Date/Time classes
Feb07 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
Feb07$Date_Time <- strptime(paste(Feb07$Date, Feb07$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Create line plot (plot 3) in png file
png(filename = "plot3.png", width = 480 , height = 480)
plot(Feb07$Date_Time, Feb07$Sub_metering_1, type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering", xaxt = "n")
lines(Feb07$Date_Time, Feb07$Sub_metering_2, type = "l", col = "red")
lines(Feb07$Date_Time, Feb07$Sub_metering_3, type = "l", col = "blue")
##Round the Date_Time column to the nearest weekday
r <- as.POSIXct(round(range(Feb07$Date_Time), "days"))
##Add x-axis labels
axis.POSIXct(1, at = seq(r[1], r[2], by = "days"), format = "%a")
##Add legend
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
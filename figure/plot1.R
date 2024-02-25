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

##Create histogram (plot 1) in png file
sum(is.na(Feb07$Global_active_power)) ##Sum equals 0, no NA values to remove
png(filename = "plot1.png", width = 480 , height = 480)
hist(Feb07$Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
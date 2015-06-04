destination <- "file.zip"
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destination, method = "curl")
data <- read.table(unz(destination, "household_power_consumption.txt"),header =TRUE, sep = ";")
subdata = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime = (paste(subdata$Date,subdata$Time)
datetime = strptime(datetime, format= '%d/%m/%Y %H:%M:%S') 
subdata = cbind(datetime,subdata)
with(subdata, plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
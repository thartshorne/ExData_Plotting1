destination <- "file.zip"
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destination, method = "curl")
data <- read.table(unz(destination, "household_power_consumption.txt"),header =TRUE, sep = ";")
subdata = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime = (paste(subdata$Date,subdata$Time))
datetime = strptime(datetime, format= '%d/%m/%Y %H:%M:%S') 
subdata = cbind(datetime,subdata)
with(subdata,plot(datetime,Sub_metering_1, type = "l",ylab="Energy Sub Metering"))
lines(subdata$datetime,subdata$Sub_metering_2, col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col =c("black","red","blue"),pch =20 )
dev.copy(png,file = "plot3.png")
dev.off()
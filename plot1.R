destination <- "file.zip"
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destination, method = "curl")
data <- read.table(unz(destination, "household_power_consumption.txt"),header =TRUE, sep = ";")
subdata = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$Global_active_power <- as.numeric(as.character(unlist(subdata$Global_active_power)))
hist(subdata$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
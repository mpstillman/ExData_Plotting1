#Set working directory
dir<-"C:/DataScience/Coursera/ExploratoryDataAnalysis/ExData_Plotting1"
setwd(dir)

#Download household power consumption data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip")

#Import household power consumption data into data table dt1
dt1 <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep = ";", header = TRUE)

#Update date attribute to a date datatype
dt1$Date <- as.Date(dt1$Date,format='%d/%m/%Y')

#Remove all data except data from 2007-02-01 and 2007-02-02
dt2<-subset(dt1,Date == " 2007-02-01" | Date== "2007-02-02")

#Update datatype of global active power to a numeric field.
dt2$Global_active_power_numeric<-as.numeric(as.character(dt2$Global_active_power))

#Open png device
png(file = "plot1.png")

#Create historgram
hist(dt2$Global_active_power_numeric,xlab='Global Active Power (kilowatts)',ylab='Frequency', col = "red", main = "Global Active Power") 

#Close device
dev.off()

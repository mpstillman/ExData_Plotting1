#Set working directory
dir<-"C:/DataScience/Coursera/ExploratoryDataAnalysis/ExData_Plotting1"
setwd(dir)

#Download household power consumption data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip")

#import household power consumption data into data table dt1
dt1 <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep = ";", header = TRUE)

#Update date attribute to a date datatype
dt1$Date <- as.Date(dt1$Date,format='%d/%m/%Y')

#remove all data except data from 2007-02-01 and 2007-02-02
dt2<-subset(dt1,Date == " 2007-02-01" | Date== "2007-02-02")

#Update datatype of global active power to a numeric field.
dt2$Global_active_power_numeric<-as.numeric(as.character(dt2$Global_active_power))

#merge the date ant time together into one field
dt2$DateTime<-as.POSIXct(paste(dt2$Date, dt2$Time), format="%Y-%m-%d %H:%M:%S")

#Open png device
png(file = "plot2.png")

#Plot line graph
plot(dt2$DateTime,dt2$Global_active_power_numeric,type="n", xlab='', ylab='Global Active Power (kilowatts)')
with(dt2, lines(DateTime, Global_active_power_numeric,type="l"))

#Close device
dev.off()

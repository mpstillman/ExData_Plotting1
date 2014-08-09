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

#merge the date ant time together into one field
dt2$DateTime<-as.POSIXct(paste(dt2$Date, dt2$Time), format="%Y-%m-%d %H:%M:%S")

#Update datatype of global active power to a numeric field.
dt2$Global_active_power_numeric<-as.numeric(as.character(dt2$Global_active_power))

#Update datatype of Voltage to a numeric field.
dt2$Voltage_numeric<-as.numeric(as.character(dt2$Voltage))

#Update datatype of Sub_metering to a numeric field.
dt2$Sub_metering_1_numeric<-as.numeric(as.character(dt2$Sub_metering_1))
dt2$Sub_metering_2_numeric<-as.numeric(as.character(dt2$Sub_metering_2))
dt2$Sub_metering_3_numeric<-as.numeric(as.character(dt2$Sub_metering_3))

#Update datatype of Sub_metering to a numeric field.
dt2$Global_reactive_power_numeric<-as.numeric(as.character(dt2$Global_reactive_power))

#Open png device
png(file = "plot4.png")
par(mfrow = c(2, 2), mar = c(4, 6, 4, 0))

#Top left plot
plot(dt2$DateTime,dt2$Global_active_power_numeric,type="n", xlab='', ylab='Global Active Power')
with(dt2, lines(DateTime, Global_active_power_numeric,type="l"))

#top right plot
plot(dt2$DateTime,dt2$Voltage_numeric,type="n", xlab='datetime', ylab='Voltage')
with(dt2, lines(DateTime, Voltage_numeric,type="l"))

#Bottom left plot
plot(dt2$DateTime,dt2$Sub_metering_1_numeric,type="n",xlab='', ylab='Energy sub metering')
with(dt2, lines(DateTime, Sub_metering_1_numeric,type="l",col='black'))
with(dt2, lines(DateTime, Sub_metering_2_numeric,type="l",col='red'))
with(dt2, lines(DateTime, Sub_metering_3_numeric,type="l",col='blue'))
legend("topright", lty=1, bty="n" ,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Bottom right plot
plot(dt2$DateTime,dt2$Global_reactive_power_numeric,type="n", xlab='datetime', ylab='Global_active_power')
with(dt2, lines(DateTime, Global_reactive_power_numeric,type="l"))

#Close device
dev.off()
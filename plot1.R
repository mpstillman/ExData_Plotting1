dir<-"C:/DataScience/Coursera/ExploratoryDataAnalysis/ExData_Plotting1"
setwd(dir)

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip")

dt1 <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep = ";", header = TRUE)

dt1$Date = as.Date(dt1$Date,format='%d/%m/%Y')

dt2<-subset(dt1,Date == " 2007-02-01" | Date== "2007-02-02")


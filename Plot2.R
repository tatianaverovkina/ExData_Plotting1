strfileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"C:\\Users\\vava\\Desktop\\Statistics\\Exploratory Analysis\\data1.zip")
unzip("C:\\Users\\vava\\Desktop\\Statistics\\Exploratory Analysis\\data1.zip")
electrition<-read.table("data1\\household_power_consumption.txt",sep=";",header=TRUE)
electrition$DateTime<-with(electrition, interaction(Date,Time))
library(lubridate)
electrition$DateTime<-dmy_hms(electrition$DateTime)
projectdata<-subset(electrition, as.Date(as.character(Date), "%d/%m/%Y") %in% as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y"))
projectdata$Global_active_power<-as.numeric(as.character(projectdata$Global_active_power))
png(filename="Plot2.png", width=480, height=480)
plot(projectdata$DateTime,projectdata$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()


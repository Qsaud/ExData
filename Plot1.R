#reading file
hs<-read.csv2("household_power_consumption.txt", sep=";", header=T)
#formating and subseting data
hs$Date<-as.Date(hs$Date, format="%d/%m/%Y")
hs2<-subset(hs, Date==as.Date("01/02/2007", format="%d/%m/%Y")| Date==as.Date("02/02/2007", format="%d/%m/%Y"))
hs2$DateTime<-as.POSIXct(paste(hs2$Date, hs2$Time))
#cleaning data
hs2$Global_active_power<-as.numeric(gsub("\\?",NA, hs2$Global_active_power))
hs2$Global_reactive_power<-as.numeric(gsub("\\?",NA, hs2$Global_reactive_power))
hs2$Voltage<-as.numeric(gsub("\\?",NA, hs2$Voltage))
#Plotting
png('plot2.png', width=480, height=480)
hist(hs2$Global_active_power, main="Global active power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()

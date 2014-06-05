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
png('plot4.png', width=480, height=480)
par(mfrow = c(2,2))
plot(hs2$DateTime,  hs2$Global_active_power, ylab="Global Active Power", type="l", lwd=1, xlab="")
plot(hs2$DateTime,  hs2$Voltage, ylab="Voltage", type="l", lwd=1, xlab="datetime")
plot(hs2$DateTime,hs2$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
     points(hs2$DateTime, hs2$Sub_metering_2, type="l", col="red")
     points(hs2$DateTime, hs2$Sub_metering_3, type="l", col="blue")
     legend("topright",  c(colnames(hs2)[7:9]), col=c("black", "red", "blue"), lty=1, bty="n")
     legend("topright", lwd=c(1, 1, 1), col=c("black","red","blue"), border=c(1,4,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(hs2$DateTime,hs2$Global_reactive_power, ylab="Global_reactive_Power", type="l", lwd=1, xlab="datetime")
dev.off()



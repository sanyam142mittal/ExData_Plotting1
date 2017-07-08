library("dplyr")
setwd("E:\course4\household_power_consumption")
ds1 <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
ds2 <- mutate(ds1, Date1 = as.Date(Date, "%d/%m/%Y"))
ds3<- filter(ds2,Date1>= "2007-02-01" & Date1 <= "2007-02-02")
ds3<-mutate(ds3,datetime=as.POSIXct(strptime(paste(ds3$Date,ds3$Time,sep=" "),"%d/%m/%Y %H:%M:%S")))
rm(ls=ds1)
rm(ls=ds2)

png(file="plot3.png",width=480,height=480)

plot(ds3$datetime,ds3$Sub_metering_1,type="l",xlab="",ylab="Enery sub metering",col="black")
lines(ds3$datetime,ds3$Sub_metering_2,col="red")
lines(ds3$datetime,ds3$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=2,lwd=3,col=c("black","red","blue"))

dev.off()
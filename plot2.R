library("dplyr")
setwd("E:\course4\household_power_consumption")
ds1 <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
ds2 <- mutate(ds1, Date1 = as.Date(Date, "%d/%m/%Y"))
ds3<- filter(ds2,Date1>= "2007-02-01" & Date1 <= "2007-02-02")
ds3<-mutate(ds3,datetime=as.POSIXct(strptime(paste(ds3$Date,ds3$Time,sep=" "),"%d/%m/%Y %H:%M:%S")))
rm(ls=ds1)
rm(ls=ds2)
png(file="plot2.png",width=480,height=480)
plot(ds3$datetime,ds3$Global_active_power,type = "l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
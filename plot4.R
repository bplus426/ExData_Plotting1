# cleansing & selection

install.packages("dplyr)")
library(dplyr)   

t1<-read.table("household_power_consumption.txt"
               ,header=T
               ,sep = ';'
               ,na.strings = '?'
)

date_time <- paste(t1[,1], t1[,2])

date_time<-strptime(date_time,
                    "%d/%m/%Y %H:%M:%S"
)

t1<-cbind(date_time, t1)

t2<-filter(t1,
           date_time>='2007-02-01 00:00:00',
           date_time<'2007-02-03 00:00:00'
)

#plot1
hist(t2$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power"
)


t2$weekdays<-weekdays(t2$date_time)


# plot4


par(mfrow=c(2,2))

plot(t2$date_time,
     t2$Global_active_power,
     type='line',
     xlab="",
     ylab="Global Active Power (killowatts)")

plot(t2$date_time,
     t2$Voltage,
     type='l',
     xlab="datetime",
     ylab="Voltage")

plot(t2$date_time,
     t2$Sub_metering_1,
     type='l',
     col='black',
     xlab="",
     ylab="Energy sub metering"
)

lines(t2$date_time,
      t2$Sub_metering_2,
      col='red')

lines(t2$date_time,
      t2$Sub_metering_3,
      col='blue')

plot(t2$date_time,
     t2$Global_reactive_power,
     type='l',
     xlab="datetime",
     ylab="Global_reactive_power"
)

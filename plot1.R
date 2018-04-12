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


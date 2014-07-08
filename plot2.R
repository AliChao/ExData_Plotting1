Sys.setlocale("LC_TIME", "C")
household_power_consumption <- read.csv("G:/R_code/data/EDAproject1/household_power_consumption.txt", sep=";")
##Cleaning data
household <- household_power_consumption
household$Date <- as.Date(household$Date,"%d/%m/%Y")
household1 <-household[(household$Date<="2007-02-02") & (household$Date>="2007-02-01"),]
household1$Global_active_power <- as.character(household1$Global_active_power)
household1$Global_active_power <- as.numeric(household1$Global_active_power)
Date <-household1$Date
Time <-household1$Time
x <-paste(Date,Time)
x<- strptime(x,"%Y-%m-%d %H:%M:%S",tz="")
household1$Date <- x
household1 <- household1[c(1,3,4,5,6,7,8,9)]
##plot
plot(x=household1$Date, y=household1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")

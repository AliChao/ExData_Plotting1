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
household1$Sub_metering_1 <- as.character(household1$Sub_metering_1)
household1$Sub_metering_1 <- as.numeric(household1$Sub_metering_1)

household1$Sub_metering_2 <- as.character(household1$Sub_metering_2)
household1$Sub_metering_2 <- as.numeric(household1$Sub_metering_2)

household1$Sub_metering_3 <- as.character(household1$Sub_metering_3)
household1$Sub_metering_3 <- as.numeric(household1$Sub_metering_3)

plot(household1$Date,household1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(household1$Date,household1$Sub_metering_2,type="l",col="red")
points(household1$Date,household1$Sub_metering_3,type="l",col="blue")

legend("topright", col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)

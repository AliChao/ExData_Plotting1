##Plot One
household_power_consumption <- read.csv("G:/R_code/data/EDAproject1/household_power_consumption.txt", sep=";")
household <- household_power_consumption
household$Date <- as.Date(household$Date,"%d/%m/%Y")
household1 <-household[(household$Date<="2007-02-02") & (household$Date>="2007-02-01"),]
household1$Global_active_power <- as.character(household1$Global_active_power)
household1$Global_active_power <- as.numeric(household1$Global_active_power)
hist(x=household1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main ="Global Active Power")


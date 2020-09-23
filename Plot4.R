##---------------------
## File :Plot4.R
##---------------------

## NOTE: Make sure that the required directory is set to where the source file is

## Read the rows where dates 01/02/2007 and 01/02/2007 are found
dt <- read.table("household_power_consumption.txt",sep=";", skip=66637, nrows=2880)

## Read the header of the file only
hd <- read.table("household_power_consumption.txt",sep=";",nrows=1)

## Append the column names headers to the main data frame
colnames(dt) <- c(hd)

## Create a column in dt data frame to hold the date and time as date time format after 
## concatenating the date and time column from dt data frame
dt$DateTime <- strptime(paste(dt[,1],dt[,2]),"%d/%m/%Y %H:%M:%S")

## set up the device file for the plot
png(file="plot4.png",width=480,height=480)

## set up plot window for 4 plots - as 2 rows and 2 columns
par(mfrow = c(2,2))

## Plot 1
plot(dt$DateTime, type="n", dt$Global_active_power, xlab="", ylab="Global Active Power")
lines(dt$DateTime,dt$Global_active_power) 

## Plot 2
plot(dt$DateTime, type="n", dt$Voltage, xlab="datetime", ylab="Voltage")
lines(dt$DateTime,dt$Voltage) 
 
## Plot 3
m1 <- dt$Sub_metering_1
m2 <- dt$Sub_metering_2
m3 <- dt$Sub_metering_3
plot(dt$DateTime, type="n", m1, xlab="", ylab="Energy sub metering")
lines(dt$DateTime,m1)
lines(dt$DateTime,m2,col="red")
lines(dt$DateTime,m3,col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot 4
plot(dt$DateTime, type="n", dt$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power")
lines(dt$DateTime,dt$Global_reactive_power) 

## close the device file
dev.off()
##---------------------
## File :Plot2.R
##---------------------

## NOTE: Make sure that the required directory is set to where the source file is

## Read the rows where dates 01/02/2007 and 01/02/2007 are found
dt <- read.table("household_power_consumption.txt",sep=";", skip=66637, nrows=2880)

## Read the header of the file only
hd <- read.table("household_power_consumption.txt",sep=";",nrows=1)

## Append the column names headers to the main data frame dt
colnames(dt) <- c(hd)

## Create a column in dt data frame to hold the date and time as date time format after 
## concatenating the date and time column from dt data frame
dt$DateTime <- strptime(paste(dt[,1],dt[,2]),"%d/%m/%Y %H:%M:%S")

## set up device file 
png(file="plot2.png",width=480,height=480)

## Create Plot 2
plot(dt$DateTime, type="n", dt$Global_active_power,
     xlab="",
	 ylab="Global Active Power (kilowatts)")

lines(dt$DateTime,dt$Global_active_power)

## close the device file
dev.off()
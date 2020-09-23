##---------------------
## File :Plot1.R
##---------------------

## NOTE: Make sure that the required directory is set to where the source file is

## Read the rows where dates 01/02/2007 and 01/02/2007 are found
dt <- read.table("household_power_consumption.txt",sep=";", skip=66637, nrows=2880)

## Read the header of the file only
hd <- read.table("household_power_consumption.txt",sep=";",nrows=1)

## Append the column names headers to the main data frame dt
colnames(dt) <- c(hd)

## set up device file 
png(file="plot1.png",width=480,height=480)

## Create plot 1
hist(dt$Global_active_power,col="red",
     main="Global Active Power",
	 xlab="Global Active Power (kilowatts)",
	 ylab="Frequency")

## close the device file
dev.off()
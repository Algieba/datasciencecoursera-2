## R script for plot 1


# read the file
hpc<-read.csv2("household_power_consumption.txt",stringsAsFactors=F)

#change the date format 
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")

# Subset the data for the days we are interested in, ie, 01 and 02/02/2007
hpc_01and02_02_2007<- subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")

# The histogram
png(file="plot1.png",width=480,height=480) # open ploting device

hist(as.numeric(hpc_01and02_02_2007$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")

dev.off() # close ploting device
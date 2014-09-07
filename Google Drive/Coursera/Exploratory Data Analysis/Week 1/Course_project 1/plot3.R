## R script for plot 3

Sys.setlocale("LC_TIME","C")

# read the file
hpc<-read.csv2("household_power_consumption.txt",stringsAsFactors=F)

#change the date format 
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")

# Subset the data for the days we are interested in, ie, 01 and 02/02/2007
hpc_01and02_02_2007<- subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")

# Information to be used in the plot
unique(weekdays(hpc_01and02_02_2007$Date, abbreviate=TRUE)) # allows you to see what were the weekdays for 01/02/2007 and 02/02/2007
table(hpc_01and02_02_2007$Date) # allows to see that the there are 1440 observations for 2007/02/01 (Thu) and 1440 observations for 2007/02/02 (Fri).

# The plot
png(file="plot3.png",width=480,height=480) # open ploting device

with(hpc_01and02_02_2007, plot(Sub_metering_1, type="n",axes=FALSE, frame.plot=TRUE, xlab="", ylab="Energy sub metering"))
with(hpc_01and02_02_2007, points(Sub_metering_1,type="l"))
with(hpc_01and02_02_2007, points(Sub_metering_2,type="l", col="red"))
with(hpc_01and02_02_2007, points(Sub_metering_3,type="l", col="blue"))
axis(side=1, at=c(0,1440,2881), labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,10,20,30))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() # close ploting device
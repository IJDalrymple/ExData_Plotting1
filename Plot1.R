# set working directory (point to your directory)
setwd("~/ExData_Plots1")

# read data and assign classes
vclass<-c(rep('character',2),rep('numeric',7))
HPC<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?",colClasses=vclass)

# subset data
HPC<-HPC[HPC$Date=='1/2/2007'| HPC$Date=='2/2/2007',]

# Plot1
png('plot1.png',width=480,height=480,units='px')
hist(HPC$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
dev.off()
# set working directory (point to your directory)
setwd("~/ExData_Plots1")

# read data and assign classes
vclass<-c(rep('character',2),rep('numeric',7))
HPC<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?",colClasses=vclass)

# subset data
HPC<-HPC[HPC$Date=='1/2/2007'| HPC$Date=='2/2/2007',]

# create DateTime variable
HPC[,1]=as.Date(HPC$Date, '%d/%m/%Y')
HPC$DateTime=paste(HPC[,1],HPC[,2])
HPC$DateTime <- strptime(HPC$DateTime, '%Y-%m-%d %H:%M:%S')

# Plot2
png('plot2.png',width=480,height=480,units='px')
plot(HPC$DateTime,HPC$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()

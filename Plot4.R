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

# Plot4
png('plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2), cex=0.75)
plot(HPC$DateTime,HPC$Global_active_power,ylab='Global Active Power',xlab='',type='line')
plot(HPC$DateTime,HPC$Voltage,ylab='Voltage',xlab='datetime',type='line')
plot(HPC$DateTime,HPC$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(HPC$DateTime,HPC$Sub_metering_2,col='red')
lines(HPC$DateTime,HPC$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), bty="n", lty=1,lwd=1.5,xjust=1,y.intersp=0.8)
plot(HPC$DateTime,HPC$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='line')
dev.off()

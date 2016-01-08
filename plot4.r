plot4 <- function(filename){
        # filename is the name of the data file.
        # this assumes that that file is under current working directory, if not, change work directory first.
        x <- read.table(paste("./",filename,sep=""),header=TRUE, sep=";")
        x$Date <- as.Date(x$Date,"%d/%m/%Y")
        x_small<-x[x$Date == as.Date("2007-02-01","%Y-%m-%d") | x$Date == as.Date("2007-02-02","%Y-%m-%d"),]
        rm(x)
        x_small$Date_Time <- as.POSIXct(paste(x_small$Date,x_small$Time), format = "%Y-%m-%d %H:%M:%S")
        x_small$Global_active_power <- as.numeric(as.character(x_small$Global_active_power))
        x_small$Sub_metering_1 <- as.numeric(as.character(x_small$Sub_metering_1))
        x_small$Sub_metering_2 <- as.numeric(as.character(x_small$Sub_metering_2))
        x_small$Global_reactive_power <- as.numeric(as.character(x_small$Global_reactive_power))
        x_small$Voltage <- as.numeric(as.character(x_small$Voltage))
        png('plot4.png')
        old.par <- par(mfrow=c(2, 2))
        par(mar=c(3,4,2,2))
        plot(x_small$Date_Time, x_small$Global_active_power,type="l", ylab="Global Active Power(Kilowatts)", xlab="")
        plot(x_small$Date_Time, x_small$Voltage,type="l", ylab="Voltage", xlab="datetime")
        plot(x_small$Date_Time,x_small$Sub_metering_1,type="l",ylab="Energy Sub metering",xlab="")
        lines(x_small$Date_Time,x_small$Sub_metering_2,col="red")
        lines(x_small$Date_Time,x_small$Sub_metering_3,col="blue")
        legend("topright",col=c("black","red","blue"),lwd=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)
        plot(x_small$Date_Time, x_small$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")
        par(old.par)
        dev.off()
        
}
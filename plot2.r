plot2 <- function(filename){
        # filename is the name of the data file.
        # this assumes that that file is under current working directory, if not, change work directory first.
        x <- read.table(paste("./",filename,sep=""),header=TRUE, sep=";")
        x$Date <- as.Date(x$Date,"%d/%m/%Y")
        x_small<-x[x$Date == as.Date("2007-02-01","%Y-%m-%d") | x$Date == as.Date("2007-02-02","%Y-%m-%d"),]
        rm(x)
        x_small$Date_Time <- as.POSIXct(paste(x_small$Date,x_small$Time), format = "%Y-%m-%d %H:%M:%S")
        x_small$Global_active_power <- as.numeric(as.character(x_small$Global_active_power))
        png('plot2.png')
        par(mar=c(3,4,2,2))
        plot(x_small$Date_Time, x_small$Global_active_power,type="l", ylab="Global Active Power(Kilowatts)", xlab="")
        dev.off()
}
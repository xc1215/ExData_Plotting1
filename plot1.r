plot1 <- function(filename){
        # filename is the name of the data file.
        # this assumes that that file is under current working directory, if not, change work directory first.
        x <- read.table(paste("./",filename,sep=""),header=TRUE, sep=";")
        x$Date <- as.Date(x$Date,"%d/%m/%Y")
        x_small<-x[x$Date == as.Date("2007-02-01","%Y-%m-%d") | x$Date == as.Date("2007-02-02","%Y-%m-%d"),]
        rm(x)
        x_small$Global_active_power <- as.numeric(as.character(x_small$Global_active_power))
        png('plot1.png')
        hist(x_small$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
        dev.off()
}
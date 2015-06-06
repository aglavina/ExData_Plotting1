plot3 <- function() {
  file<-'household_power_consumption.txt'
  dataheader <- read.table(file, nrows = 2, header =TRUE, sep =';')
  #read only the relevant values
  first <- grep("1/2/2007",readLines(file))[1]
  last <- grep("3/2/2007",readLines(file))[1]
  data<-read.table(file, skip = first-1, nrows = last-first, header =FALSE, sep =';')
  names(data) <- names(dataheader)
  
  dateTime   <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
  png("./plot3.png",width=480,height=480)
  plot(dateTime, data$Sub_metering_1, type="l",xlab = "",ylab = "Energy sub metering")  
  lines(dateTime,data$Sub_metering_2, type="l", col="red")
  lines(dateTime,data$Sub_metering_3, type="l", col="blue")
  # Create a legend at that is slightly smaller 
  # (cex) and uses the same line colors and points used by 
  # the actual plots 
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","blue","red"), lty=1);
  
#  dev.copy(png, file = "plot3.png",width=480,height=480) ## Copy my plot to a PNG file
  dev.off() ## Don't forget to close the PNG device!
}

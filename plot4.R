plot4 <- function() {
  file<-'household_power_consumption.txt'
  dataheader <- read.table(file, nrows = 2, header =TRUE, sep =';')
  #read only the relevant values
  #first <- grep("1/2/2007",readLines(file))[1]
  #last <- grep("3/2/2007",readLines(file))[1]
  #data<-read.table(file, skip = first-1, nrows = last-first, header =FALSE, sep =';')
  
  data<-read.table(file, skip = 66637 , nrows = 2880, header =FALSE, sep =';')
  names(data) <- names(dataheader)
  
  dateTime   <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
  png("./plot4.png",width=480,height=480)
  
  par(mfrow = c(2, 2))
  plot(dateTime, data$Global_active_power, type="l",xlab = "",ylab = "Global Active Power")  
  plot(dateTime, data$Voltage, type="l",xlab = "datetime",ylab = "Voltage",yaxt="n")
  axis(2, at=seq(234,246, by = 2),labels=c("234","","238","","242","","246"))
  plot(dateTime, data$Sub_metering_1, type="l",xlab = "",ylab = "Energy sub metering")  
  lines(dateTime,data$Sub_metering_2, type="l", col="red")
  lines(dateTime,data$Sub_metering_3, type="l", col="blue")
  # Create a legend at that is slightly smaller 
  # (cex) and uses the same line colors and points used by 
  # the actual plots 
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","blue","red"), lty=1,bty = "n");
  plot(dateTime, data$Global_reactive_power, type="l",xlab = "datetime",ylab = "Global_reactive_power",yaxt="n")  
  axis(2, at = seq(0.0, 0.5, by = 0.1), labels =seq(0.0, 0.5, by = 0.1), cex=0.5 )
#  dev.copy(png, file = "plot4.png",width=480,height=480) ## Copy my plot to a PNG file
  dev.off() ## Don't forget to close the PNG device!
}

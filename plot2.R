plot2 <- function() {
  file<-'household_power_consumption.txt'
  dataheader <- read.table(file, nrows = 2, header =TRUE, sep =';')
  #read only the relevant values
  first <- grep("1/2/2007",readLines(file))[1]
  last <- grep("3/2/2007",readLines(file))[1]
  data<-read.table(file, skip = first-1, nrows = last-first, header =FALSE, sep =';')
  names(data) <- names(dataheader)
  
  dateTime   <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
  plot(dateTime, data$Global_active_power, type="l",xlab = "",ylab = "Global Active Power (kilowatts)")  
  
  dev.copy(png, file = "plot2.png",width=480,height=480) ## Copy my plot to a PNG file
  dev.off() ## Don't forget to close the PNG device!
}

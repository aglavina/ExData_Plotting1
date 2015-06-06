plot1 <- function() {
  file<-'household_power_consumption.txt'
  dataheader <- read.table(file, nrows = 2, header =TRUE, sep =';')
  #read only the relevant values
  first <- grep("1/2/2007",readLines(file))[1]
  last <- grep("3/2/2007",readLines(file))[1]
  data<-read.table(file, skip = first-1, nrows = last-first, header =FALSE, sep =';')
  names(data) <- names(dataheader)
  write.table(data,"project_results.txt",row.name=FALSE)
  hist(data$Global_active_power,col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "plot1.png",width=480,height=480) ## Copy my plot to a PNG file
  dev.off() ## Don't forget to close the PNG device!
}

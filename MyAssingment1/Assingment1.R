
## ---------------------------------------------------------------------------------------
## prepare the environment

getwd()
setwd("C:/Users/tkun/OneDrive/Dokumenty/R/Coursera/ExploratoryAnalysis/Week1/Assignment")
getwd()

#install.packages("graphics")
#install.packages("ggplot2")
install.packages("dplyr")
install.packages("lubridate")

library("graphics")
library("ggplot2")
library("dplyr")
library("lubridate")


## ---------------------------------------------------------------------------------------
## load and prepare the data

d0 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") )

d0$DateTime <- as.POSIXlt( strptime( paste(d0$Date, d0$Time), "%d/%m/%Y %H:%M:%S"))
d0$Date     <- as.POSIXlt( strptime( paste(d0$Date, d0$Time), "%d/%m/%Y" ))

d1 <- subset(d0, Date == "2007-02-01" | Date == "2007-02-02" )



## ---------------------------------------------------------------------------------------
## plotting the graphs

# plot 1

png(filename="Plots/plot1.png")

hist(d1$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()


# plot 2

png(filename="Plots/plot2.png")

with(d1, plot(x = DateTime, y = Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()


# plot 3

png(filename="Plots/plot3.png")

with(d1, plot(x = DateTime, y = Sub_metering_1, type="l", color = "black", xlab = "", ylab = "Energy sub metering"))
with(d1, lines(x = DateTime, y = Sub_metering_2, type="l", col = "red"))
with(d1, lines(x = DateTime, y = Sub_metering_3, type="l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex = 0.8)

dev.off()


# plot 4

png(filename="Plots/plot4.png")

par(mfrow = c(2,2))

with(d1, plot(x = DateTime, y = Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(d1, plot(x = DateTime, y = Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

with(d1, plot(x = DateTime, y = Sub_metering_1, type="l", color = "black", xlab = "", ylab = "Energy sub metering"))
with(d1, lines(x = DateTime, y = Sub_metering_2, type="l", col = "red"))
with(d1, lines(x = DateTime, y = Sub_metering_3, type="l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n", cex = 0.8)

with(d1, plot(x = DateTime, y = Global_reactive_power, type="l", xlab = "datetime"))

dev.off()
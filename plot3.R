##Assumption: File household_power_consumption.txt has been downloaded to default directorty

##Step1: reads file from the default folder
        dt <- read.table ("./household_power_consumption.txt", header=TRUE, sep=";")

## Step2": subset two days 01/02/2007 and 02/02/2007 from the data table
        dt_two_days <- subset (dt, (as.Date (dt$Date, format="%d/%m/%Y") == as.Date ("01/02/2007", format="%d/%m/%Y")) | (as.Date (dt$Date, format="%d/%m/%Y") == as.Date ("02/02/2007", format="%d/%m/%Y")))

##step3: Store Global Active power column values into numeric vecor
        GlobalActivePower <- as.numeric (as.character (dt_two_days$Global_active_power))

##Step4: derive date-time variable from date and time data
        DateTimeClass <- strptime (paste (dt_two_days$Date, dt_two_days$Time), "%d/%m/%Y %H:%M:%S")

##step5: Store submetering values into numeric vecor
        Sub_Metering_1 <- as.numeric (as.character (dt_two_days$Sub_metering_1))
        Sub_Metering_2 <- as.numeric (as.character (dt_two_days$Sub_metering_2))
        Sub_Metering_3 <- as.numeric (as.character (dt_two_days$Sub_metering_3))

##Step6: Open PNG device file, render Submetering 1 line plot with approapriate lables and title 
## add Submetering 2 and 3 graphs with red and blue colors to the same plot
## add appropriate legendes
## close the device
        png ("plot3.png", width=480, height = 480)
        plot (DateTimeClass, Sub_Metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines (DateTimeClass, Sub_Metering_2, col='red')
        lines (DateTimeClass, Sub_Metering_3, col='blue')
        legend ("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lwd=2, lty=1)
        dev.off()
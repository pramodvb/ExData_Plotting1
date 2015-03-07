##Assumption: File household_power_consumption.txt has been downloaded to default directorty

##Step1: reads file from the default folder
        dt <- read.table ("./household_power_consumption.txt", header=TRUE, sep=";")

## Step2": subset two days 01/02/2007 and 02/02/2007 from the data table
        dt_two_days <- subset (dt, (as.Date (dt$Date, format="%d/%m/%Y") == as.Date ("01/02/2007", format="%d/%m/%Y")) | (as.Date (dt$Date, format="%d/%m/%Y") == as.Date ("02/02/2007", format="%d/%m/%Y")))

##step3: Store Global Active power column values into numeric vecor
        GlobalActivePower <- as.numeric (as.character (dt_two_days$Global_active_power))

##Step4: derive date-time variable from date and time data
        DateTimeClass <- strptime (paste (dt_two_days$Date, dt_two_days$Time), "%d/%m/%Y %H:%M:%S")

##Step5: Open PNG device file, render line plot with approapriate lables and title and close the device
        png ("plot2.png", width=480, height = 480)
        plot (DateTimeClass, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()
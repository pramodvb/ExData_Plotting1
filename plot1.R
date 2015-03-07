##Assumption: File household_power_consumption.txt has been downloaded to default directorty

##Step1: reads file from the default folder
        dt <- read.table ("./household_power_consumption.txt", header=TRUE, sep=";")

## Step2": subset two days 01/02/2007 and 02/02/2007 from the data table
        dt_two_days <- subset (dt, (as.Date (dt$Date, format="%d/%m/%Y") == as.Date ("01/02/2007", format="%d/%m/%Y")) | (as.Date (dt$Date, format="%d/%m/%Y") == as.Date ("02/02/2007", format="%d/%m/%Y")))

##step3: Store Global Active power column values into numeric vecor
        GlobalActivePower <- as.numeric (as.character (dt_two_days$Global_active_power))

##Step4: Open PNG device file, render histogram with approapriate lables and title and close the device
        png ("plot1.png", width=480, height = 480)
        hist (GlobalActivePower, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
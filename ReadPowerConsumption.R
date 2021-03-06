# Variable to read the data set from the power consumption txt file
PowerConsumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


# Setting the Time column of the dataset with the strptime function
PowerConsumption$Time <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), "%d/%m/%Y %H:%M:%S")


# Setting the Date column of the dataset with the as.Date function
PowerConsumption$Date <- as.Date(PowerConsumption$Date, "%d/%m/%Y")


# Setting a new variable with the filter to apply to the dataset to obtain only the desired observation dates
ObservationDates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")


# Getting the corresponding subset of observation for the specified dates
PowerObservation <- subset(PowerConsumption, Date %in% ObservationDates)

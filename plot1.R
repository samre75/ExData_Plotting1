setwd("D://Data//Personal//MachineLearning//ExploratoryAnalysis//exdata_data_household_power_consumption")
dataFile <- "household_power_consumption.txt"
#Read Data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dim(data)
head(data)

#Partition Data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot
hist(as.numeric(data$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

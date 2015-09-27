# Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "plot1.png",width = 480,height = 480)
data <- aggregate(list(Emissions = NEI$Emissions), list(Year = NEI$year), sum)
barplot(data$Emissions, names.arg = data$Year)
dev.off()

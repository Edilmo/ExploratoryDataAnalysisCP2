# Plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "plot2.png",width = 480,height = 480)
data <- subset(NEI, fips == "24510", select = c(Emissions, year))
data <- aggregate(list(Emissions = data$Emissions), list(Year = data$year), sum)
barplot(data$Emissions, names.arg = data$Year)
dev.off()

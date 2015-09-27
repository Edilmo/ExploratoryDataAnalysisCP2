# Plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "plot5.png",width = 480,height = 480)
sccComb <- SCC[which(grepl("Mobile - On-Road .*", SCC$EI.Sector)),c("SCC","Short.Name","EI.Sector")]
data <- subset(NEI, SCC %in% sccComb$SCC, select = c(Emissions, year, fips))
data <- subset(data, fips == "24510", select = c(Emissions, year))
data <- aggregate(list(Emissions = data$Emissions), list(Year = data$year), sum)
barplot(data$Emissions, names.arg = data$Year)
dev.off()

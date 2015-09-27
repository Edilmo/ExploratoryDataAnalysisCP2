# Plot 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == 06037). 
# Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "plot6.png",width = 480,height = 480)
sccComb <- SCC[which(grepl("Mobile - On-Road .*", SCC$EI.Sector)),c("SCC","Short.Name","EI.Sector")]
data <- subset(NEI, SCC %in% sccComb$SCC, select = c(Emissions, year, fips))
data <- subset(data, fips %in% c("24510","06037"), select = c(Emissions, year, fips))
data$fips <- factor(data$fips, levels = c("24510","06037"), labels = c("Baltimore City","Los Angeles County, California"))
data <- aggregate(list(Emissions = data$Emissions), list(Year = data$year, Fips = data$fips), sum)
g <- ggplot(data, aes(y = Emissions, x = Year))
g <- g + geom_bar(stat='identity')
g <- g + facet_grid(. ~ Fips)
g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
g
dev.off()

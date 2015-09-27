# Plot 4
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
# Upload a PNG file containing your plot addressing this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "plot4.png",width = 480,height = 480)
sccComb <- SCC[which(grepl("Fuel .* Coal", SCC$EI.Sector)),c("SCC","Short.Name","EI.Sector")]
data <- subset(NEI, SCC %in% sccComb$SCC, select = c(Emissions, year))
data <- aggregate(list(Emissions = data$Emissions), list(Year = data$year), sum)
barplot(data$Emissions, names.arg = data$Year)
dev.off()

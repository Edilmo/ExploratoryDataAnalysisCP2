# Plot 3
# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources 
# have seen decreases in emissions from 1999–2008 for Baltimore City? Which 
# have seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
# system to make a plot answer this question.

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
NEIf <- NEI
NEIf$type <- factor(NEI$type)
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = "plot3.png",width = 480,height = 480)
data <- aggregate(list(Emissions = NEIf$Emissions), list(Year = NEI$year, Type = NEIf$type), sum)
g <- ggplot(data, aes(y = Emissions, x = Year))
g <- g + geom_bar(stat='identity')
g <- g + facet_grid(. ~ Type)
g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
g
dev.off()

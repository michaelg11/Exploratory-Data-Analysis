#Plot 3
require(ggplot2)
baltimore=subset(NEI,fips=="24510")
baltimore$year=as.factor(baltimore$year)
baltimore$type=as.factor(baltimore$type)
png(filename="~/Documents/Exploratory Data Analysis/plot3.png")
ggplot(baltimore,aes(x=year,y=log10(Emissions))) + facet_grid(.~type) + geom_boxplot(aes(fill=type))+ ggtitle("Emissions in Baltimore by Type")
dev.off()

# Plot 1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year=as.factor(NEI$year)
summary(NEI)
total=aggregate(Emissions~year,NEI,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot1.png")
barplot(total$Emissions,names.arg = total$year,main="Change in PM2.5 over the years",xlab="Year",ylab="PM2.5")
dev.off()

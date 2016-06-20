#Plot 2
baltimore=subset(NEI,fips=="24510")
baltimore$year=as.factor(baltimore$year)
summary(NEI)
total1=aggregate(Emissions~year,baltimore,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot2.png")
barplot(total1$Emissions,names.arg = total1$year,main="Change in PM2.5 in Baltimore over the years",xlab="Year",ylab="PM2.5")
dev.off()

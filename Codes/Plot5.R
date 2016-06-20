#Plot 5
baltimore_road=subset(NEI,fips=="24510" & type=="ON-ROAD")
baltimore_road$year=as.factor(baltimore_road$year)
baltimore_road$type=as.factor(baltimore_road$type)
total2=aggregate(Emissions~year,baltimore_road,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot5.png")
barplot(total2$Emissions,names.arg = total2$year,main="Change in PM2.5 due to Motor Vehicles in Baltimore over the years",xlab="Year",ylab="PM2.5")
dev.off()

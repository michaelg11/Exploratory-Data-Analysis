# Plot 1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year=as.factor(NEI$year)
summary(NEI)
total=aggregate(Emissions~year,NEI,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot1.png")
barplot(total$Emissions,names.arg = total$year,main="Change in PM2.5 over the years",xlab="Year",ylab="PM2.5")
dev.off()

#Plot 2
baltimore=subset(NEI,fips=="24510")
baltimore$year=as.factor(baltimore$year)
summary(NEI)
total1=aggregate(Emissions~year,baltimore,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot2.png")
barplot(total1$Emissions,names.arg = total1$year,main="Change in PM2.5 in Baltimore over the years",xlab="Year",ylab="PM2.5")
dev.off()

#Plot 3
require(ggplot2)
baltimore=subset(NEI,fips=="24510")
baltimore$year=as.factor(baltimore$year)
baltimore$type=as.factor(baltimore$type)
png(filename="~/Documents/Exploratory Data Analysis/plot3.png")
ggplot(baltimore,aes(x=year,y=log10(Emissions))) + facet_grid(.~type) + geom_boxplot(aes(fill=type))+ ggtitle("Emissions in Baltimore by Type")
dev.off()

#Plot 4
require(ggplot2)
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
mrg=merge(NEI,SCC.coal,by="SCC")
mrg.total=aggregate(Emissions~year,mrg,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot4.png")
ggplot(mrg.total,aes(year,Emissions))+geom_point(aes(col=Emissions))+ggtitle("Change in emissions from Coal combustion related sources")+ geom_line(aes(group=1,col=Emissions))
dev.off()

#Plot 5
baltimore_road=subset(NEI,fips=="24510" & type=="ON-ROAD")
baltimore_road$year=as.factor(baltimore_road$year)
baltimore_road$type=as.factor(baltimore_road$type)
total2=aggregate(Emissions~year,baltimore_road,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot5.png")
barplot(total2$Emissions,names.arg = total2$year,main="Change in PM2.5 due to Motor Vehicles in Baltimore over the years",xlab="Year",ylab="PM2.5")
dev.off()

#Plot 6
baltimore_road=subset(NEI,fips=="24510" & type=="ON-ROAD")
baltimore_road$year=as.factor(baltimore_road$year)
baltimore_road$type=as.factor(baltimore_road$type)
total2=aggregate(Emissions~year,baltimore_road,sum)
cali_road=subset(NEI,fips=="06037" & type=="ON-ROAD")
cali_road$year=as.factor(cali_road$year)
cali_road$type=as.factor(cali_road$type)
total3=aggregate(Emissions~year,cali_road,sum)
total2$city=paste(rep("Baltimore",4))
total3$city=paste(rep("California",4))
comb=as.data.frame(rbind(total2,total3))
png(filename="~/Documents/Exploratory Data Analysis/plot6.png")
ggplot(comb,aes(x=year,y=Emissions))+geom_bar(stat="identity",aes(fill=year))+facet_grid(.~city)+guides(fill=F)+ ggtitle("Comparison between LA and Baltimore for motor vehicle emissions")
dev.off()


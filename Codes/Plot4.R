#Plot 4
require(ggplot2)
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
mrg=merge(NEI,SCC.coal,by="SCC")
mrg.total=aggregate(Emissions~year,mrg,sum)
png(filename="~/Documents/Exploratory Data Analysis/plot4.png")
ggplot(mrg.total,aes(year,Emissions))+geom_point(aes(col=Emissions))+ggtitle("Change in emissions from Coal combustion related sources")+ geom_line(aes(group=1,col=Emissions))
dev.off()

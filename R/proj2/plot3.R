library(ggplot2)
#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
#aggregating according to year and type
baltimore<-aggregate(Emissions~year+type,nei,sum)
#plotting emissions vs year for each type in png
png("plot3.png")
ggplot(data=baltimore,aes(year,Emissions,col=type))+geom_line()+geom_point()+ggtitle("Baltimore total Emissions per year by type")+ylab("Total Baltimore Emissions")
dev.off()
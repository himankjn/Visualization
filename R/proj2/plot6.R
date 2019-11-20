library(ggplot2)
#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
#subsetting for Baltimore & LA vehicles emissions
LAnBalt<-subset(nei,subset=(nei$fips=="06037"&nei$type=="ON-ROAD")|(nei$fips=="24510"&nei$type=="ON-ROAD"))
#aggregating for year and fips
#changing the fips to locations
motorLABalt<-aggregate(Emissions~year+fips,LAnBalt,sum)
motorLABalt$fips[motorLABalt$fips=="06037"]<-"LA"
motorLABalt$fips[motorLABalt$fips=="24510"]<-"Baltimore"
names(motorLABalt)[2]<-"City"
#plotting Emissions per year for LA and Baltimore in png
png("plot6.png")
ggplot(motorLABalt,aes(year,Emissions,col=City))+geom_point()+geom_line()+ggtitle("Emissions per year For baltimore and LA")
dev.off()

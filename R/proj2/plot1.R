#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
#aggregating sum of Emissions per year
PMperyear<-aggregate(Emissions~year,nei,sum)
#plotting Emissions total emissions per year in png file
png(filename="plot1.png")
plot(PMperyear$year,PMperyear$Emissions,main="TOTAL PM25 EMISSION PER YEAR",ylab="Pm total Emissions",type="o",col="red")
dev.off()
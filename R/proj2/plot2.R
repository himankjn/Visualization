#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
#subsetting maryland,Baltimore city data
nei_maryland<-subset(nei,subset=nei$fips=="24510")
#aggregating sum of emissions for baltimore city,maryland data
PMmaryland<-aggregate(Emissions~year,nei_maryland,sum)
#plotting emissions vs year in png file.
png(filename="plot2.png")
plot(PMmaryland$year,PMmaryland$Emissions,type="o",main="Baltimore City,Maryland PM25 Emissions",col="blue",ylab="Emissions",xlab="Year")
dev.off()
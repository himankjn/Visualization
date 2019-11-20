#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
##subsetting baltimore & on road data from nei
baltimore<-subset(nei,subset=nei$fips=="24510"&nei$type=="ON-ROAD")
#aggregating in sum for motor emissions
motorBalt<-aggregate(Emissions~year,baltimore,sum)
#plotting emissions over the years for baltimore vehicle pollution in png
png("plot5.png")
ggplot(motorBalt,aes(year,Emissions))+geom_point(col='purple')+geom_line(col='purple')+ggtitle("Baltimore Motor Emissions")
dev.off()
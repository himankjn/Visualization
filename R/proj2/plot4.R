library(ggplot2)
#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
#subsetting SCC with 'coal' word in short.name
coalSCC<-scc[grep("coal",scc$Short.Name,ignore.case = T),1]
#subsetting nei with only coal rows
coalnei<-nei[nei$SCC %in% coalSCC,]
#aggregating according to year and sum
pmcoal<-aggregate(Emissions~year,coalnei,sum)
#plotting coal emmision over the years in png
png("plot4.png")
ggplot(data=pmcoal,aes(pmcoal$year,pmcoal$Emissions,col="purple"))+geom_point(col="purple")+geom_line(col="purple")+ylab("Emissions")+
        xlab("Year")+ggtitle("Coal Emissions trend")
dev.off()
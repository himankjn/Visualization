library(ggplot2)
setwd("proj2")
#reading the Two data files
scc<-readRDS("Source_Classification_Code.rds")
nei<-readRDS("summarySCC_PM25.rds")
#exploratory Analysis
str(nei)
tapply(nei$Emissions,nei$year,summary)
#aggregating sum of Emissions per year
PMperyear<-aggregate(Emissions~year,nei,sum)
#plotting Emissions total emissions per year
plot(PMperyear$year,PMperyear$Emissions,main="TOTAL PM25 EMISSION PER YEAR",ylab="Pm total Emissions",type="o",col="red")

#subsetting maryland,Baltimore city data
nei_maryland<-subset(nei,subset=nei$fips=="24510")
#aggregating sum of emissions for baltimore city,maryland data
PMmaryland<-aggregate(Emissions~year,nei_maryland,sum)
#plotting emissions vs year 
plot(PMmaryland$year,PMmaryland$Emissions,type="o",main="Baltimore City,Maryland PM25 Emissions",col="blue",ylab="Emissions",xlab="Year")

#aggregating according to year and type
baltimore<-aggregate(Emissions~year+type,nei,sum)
#plotting emissions vs year for each type
ggplot(data=baltimore,aes(year,Emissions,col=type))+geom_line()+geom_point()+ggtitle("Baltimore total Emissions per year by type")+ylab("Total Baltimore Emissions")

#subsetting SCC with 'coal' word in short.name
coalSCC<-scc[grep("coal",scc$Short.Name,ignore.case = T),1]
#subsetting nei with only coal rows
coalnei<-nei[nei$SCC %in% coalSCC,]
#aggregating according to year and sum
pmcoal<-aggregate(Emissions~year,coalnei,sum)
#plotting coal emmision over the years
ggplot(data=pmcoal,aes(pmcoal$year,pmcoal$Emissions,col="purple"))+geom_point(col="purple")+geom_line(col="purple")+ylab("Emissions")+
        xlab("Year")+ggtitle("Coal Emissions trend")

##subsetting baltimore & on road data from nei
baltimore<-subset(nei,subset=nei$fips=="24510"&nei$type=="ON-ROAD")
#aggregating in sum for motor emissions
motorBalt<-aggregate(Emissions~year,baltimore,sum)
#plotting emissions over the years for baltimore vehicle pollution
ggplot(motorBalt,aes(year,Emissions,col="pink"))+geom_point()+geom_line()+ggtitle("Baltimore Motor Emissions")


#subsetting for Baltimore & LA vehicles emissions
LAnBalt<-subset(nei,subset=(nei$fips=="06037"&nei$type=="ON-ROAD")|(nei$fips=="24510"&nei$type=="ON-ROAD"))
#aggregating for year and fips
#changing the fips to locations
motorLABalt<-aggregate(Emissions~year+fips,LAnBalt,sum)
motorLABalt$fips[motorLABalt$fips=="06037"]<-"LA"
motorLABalt$fips[motorLABalt$fips=="24510"]<-"Baltimore"
names(motorLABalt)[2]<-"City"
#plotting Emissions per year for LA and Baltimore
ggplot(motorLABalt,aes(year,Emissions,col=City))+geom_point()+geom_line()+ggtitle("Emissions per year For baltimore and LA")

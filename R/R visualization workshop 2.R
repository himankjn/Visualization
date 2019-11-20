

library(qqplotr)
library(ggplot2)
di<- "exp"
dp<- list(rate = 2)
de<- TRUE
gg<- ggplot2::ggplot(data = airquality,mapping = aes(sample = Ozone))+
  stat_qq_band(distribution = di, dparams = dp, detrend = de)+
  stat_qq_line(distribution = di, dparams = dp, detrend = de)+
  stat_qq_point(distribution = di, dparams = dp, detrend = de)+
  labs(x = "theoretical qualities",y = "sample qualities")
gg              
data("barley",package = "lattice")          
gg<-ggplot(data=barley,mapping = aes(sample = yield,color = site,fill = site))+
  stat_qq_band(alpha=0.08)+
  stat_qq_line()+
  stat_qq_point()+
  facet_wrap(~ site)+
  labs(x="theoretical quality",y = "sample qualities")
gg




library(ggplot2)
 p<-ggplot(faithful,aes(x=eruptions,y=waiting))+ geom_point()
 p+annotate("text",x=3,y=48,label="group1")+ annotate("text",x=4.5,y=66,label="group2")
p<-ggplot(data.frame(x=c(-3,3)),aes(x=x))
r <- p+ stat_function(fun = dnorm)
r+annotate("text",x=2,y=0.3,parse=TRUE,
           label="frac(1,sqrt(2*pi))*e^{-x^2/2}")
r+annotate("text",x=0,y=0.05,parse=TRUE,size=4,label="'Function:'*y==frac(1,sqrt(2*pi))*e^{-x^2/2}")
library(gcookbook)
r<-ggplot(heightweight,aes(x=ageYear,y=heightIn,colour=sex))+geom_point()
r+geom_hline(yintercept=60)+geom_vline(xintercept=14)
r+geom_abline(intercept=37.4,slope=1.75)

r<-ggplot(subset(climate,Source=="Berkeley"),aes(x=Year,y=Anomaly10y))+geom_line()
r+annotate("segment",x=1950,xend=1980,y=-.25,yend=-.25)
library(grid)
r+annotate("segment",x=1850,xend=1820,y=-.8,yend=-.95,colour="blue",size=2,arrow=arrow())+
  annotate("segment",x=1950,xend=1980,y=-.25,yend=-.25,arrow=arrow(ends="both",angle=90,length=unit(.2,"cm")))
r+annotate("rect",xmin=1950,xmax=1980,ymin=-1,ymax=1,alpha=.1,fill="red")
pg<-PlantGrowth
pg$h<-"no"
pg$hl[pg$group=="trt2"]<-"yes"
ggplot(pg,aes(x=group,y=weight,fill=hl))+geom_boxplot()+
  scale_fill_manual(values=c("grey85","#FFDDCC"),guide=FALSE)
library('gcookbook')
ce<-subset(cabbage_exp,Cultivar=="c39")
ggplot(ce,aes(x=Date,y=Weight))+
geom_bar(fill="white",colour="black",stat='identity')+
geom_errorbar(aes(ymin=Weight-se,ymax=Weight+se),width=.2)
ggplot(ce,aes(x=Date,y=Weight))+
  geom_line(aes(group=1))+
  geom_point(size=4)+
  geom_errorbar(aes(ymin=Weight-se,ymax=Weight+se),width=.2)


View(cars)
library(ggplot2)
library(plyr)
with(airquality, {
  plot(Temp, Ozone)
  lines(loess.smooth(Temp, Ozone))
})
title("Ozone VS Temperature")


library(lattice)
xyplot(Ozone ~ Wind, data = airquality, 
       xlab = "Wind Speed(mph)", ylab = "Ozone Level(ppb)",
       main="Are Ozone Levels Correlated With Wind s peed?"
       )

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout=c(5,1))

fmonthNames <- factor(airquality$Month, labels = month.name[as.integer(levels(airquality$Month))])
airquality <- transform(airquality, Month = fmonthNames)
xyplot(Ozone ~ Wind | Month, data = airquality, layout=c(5,1))

ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()
plen <- ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width))
plen + geom_point() + coord_flip()

common_theme <- function() {
  ptcolor <- 'grey20'
  theme(
    plot.title = element_text(size = 14, lineheight = 0.8, color = ptcolor, hjust = 0.5),
    axis.title.x = element_text(color = ptcolor),
    axis.title.y = element_text(color = ptcolor)
  )
}



plen + 
  geom_point() +
  ggtitle("Iris Pertal Size Analysis\nData Source: And erson(1935)") +
  labs(x="Petal Length(cm)", y="Petal Width(cm)") +
  common_theme() +
  theme(plot.title = element_text(color="#2255DD"))

plen + 
  geom_point(shape=iris$Species) +
  ggtitle("Iris Pertal Size Analysis\nData Source: And erson(1935)") +
  labs(x="Petal Length(cm)", y="Petal Width(cm)") +
  common_theme() +
  theme(plot.title = element_text(color="#2255DD"))
install.packages("ggplotr",dependencies = TRUE,)
library(devtools)
install.packages("devtools")

library(ggplot2)

install.packages("qqplotr")
library(qqplotr)
di <- "exp"
dp <- list(rate=2)
de <- TRUE #enabling the detrend option
gg <- ggplot(data = airquality, mapping = aes(sample = Ozone)) +
      stat_qq_band(distribution = di, dparams = dp, detrend = de)+
      stat_qq_line(distribution = di, dparams = dp, detrend = de)+
      stat_qq_point(distribution = di, dparams = dp, detrend = de) +
      labs(x = "Theoretical Quantiles", y = "Sample Quantiles")

gg

library(installr)


data("barley", package = "lattice")
gg <- ggplot(data = barley, mapping = aes(sample = yield, color = site, fill = site)) +
  stat_qq_band(alpha=0.99) +
  stat_qq_line() +
  stat_qq_point() +
  facet_wrap(~ site) +
  labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg

library(lattice)
library(factoextra)
data("decathlon2")
decathlon2.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon2.active, scale = TRUE)
fviz_eig(res.pca)

install.packages("rgl")
library(rgl)
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg, type="s", size=0.7,lit = TRUE)
play3d(spin3d())

library(gcookbook)
c2 <- subset(countries, Year==2009)
c2 <- c2[complete.cases(c2), ]
set.seed(201)
c2 <- c2[sample(1:nrow(c2), 25), ]
c2
c2 <- c2[,4:7]
c2
c3 <- scale(c2)
c3
hc <- hclust(dist(c3))
plot(hc)
plot(hc)


# Annotations

p<-ggplot(data.frame(x=c(-3,3)),aes(x=x))+stat_function(fun=dnorm)+theme_bw()+
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())
p<-p+annotate('text',x=2,y=0.3,color='purple',size=5,parse=TRUE,label="'Function: ' * y==frac(1,sqrt(2*pi))*e^{-x^2/2}")
p
library(gcookbook)

#lines
p<-ggplot(heightweight,aes(x=ageYear,y=heightIn,colour=sex))+geom_point()
p+geom_smooth(method = 'lm',formula = y~x)

p+geom_hline(yintercept = 60)+geom_vline(xintercept = 14)

p+geom_abline(intercept=37.4,slope=1.75)

model=lm(data=heightweight,formula = heightIn~ageYear)
p+geom_abline(intercept = model$coefficients[1],slope = model$coefficients[2])
#rectangle 
p<-ggplot(subset(climate,Source='Berkeley'),aes(x=Year,y=Anomaly10y))+geom_line()
p
#arrows and segments and rectangles

library(grid)
p+annotate("segment",x=1950,xend=1980,y=-.25,yend=-.25)
p+annotate('segment',x=1850,xend=1820,y=-.8,yend=-.95,colour='blue',size=2,arrow=arrow())+
  annotate("segment",x=1950,xend=1980,y=-.25,yend=-.25,arrow=arrow(ends='both',angle=90,length=unit(.2,'cm')))
#p+geom_segment(x=1850,xend=1820,y=-.8,yend=-.95,colour='blue',size=2,arrow=arrow())
# geom_rect(xmin=1950,xmax=1980,ymin=-1,ymax=1,alpha=.1,fill='blue'))
p+annotate('rect',xmin=1950,xmax=1980,ymin=-1,ymax=1,alpha=.1,fill='blue')

pg<-PlantGrowth
pg$hl<-"no"
pg$hl[pg$group=='trt2']='yes'
pg


ggplot(pg,aes(group,y=weight,fill=hl))+geom_boxplot()+scale_fill_manual(values=c('red','blue'),guide=FALSE)






ce<-subset(cabbage_exp,Cultivar=='c39')
ggplot(ce,aes(x=Date,y=Weight))+geom_bar(stat='identity',fill="white",colour="black")+
  geom_errorbar(aes(ymin=Weight-se,ymax=Weight+se),width=.2)

ggplot(ce,aes(x=Date,y=Weight))+geom_line(aes(group=1))+
  geom_point(size=4)+
  geom_errorbar(aes(ymin=Weight-se,ymax=Weight+se),width=.2)


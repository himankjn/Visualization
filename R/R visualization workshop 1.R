library(ggplot2)

cars
g<-ggplot(cars,aes(dist,speed))+geom_point(col='red',pch=21)
g<-g+geom_smooth()+labs(x='distance',title='Dist vs Speed')
g


airquality
with(airquality,{
  plot(Temp,Ozone)
  lines(loess.smooth(Temp,Ozone))
})

library(lattice)
xyplot(Ozone~Wind,data=airquality,
       xlab='WindSpeed (mph)',ylab='Ozone level (ppb)',main='Ozone vs Wind')
data("airquality")
fmonthNames<-factor(airquality$Month,labels=month.name[as.integer(levels(factor(airquality$Month)))])
airquality<-transform(airquality,Month=fmonthNames)
ggplot(airquality,aes(Wind,Ozone))+geom_point(col='blue',fill='red',cex=3,pch=21)+facet_grid(cols=vars(airquality$Month))+
  theme_minimal()

ggplot(airquality,aes(Wind,Ozone))+geom_point(col='blue',fill='red',cex=3,pch=21)+facet_grid(rows=vars(airquality$Month))+
  theme_minimal()

?facet_grid
#creating own theme
common_theme<-function(){
  ptcolor<-'grey20'
  theme(plot.title = element_text(size=14,lineheight=0.8,color=ptcolor,hjust=0.5),
        axis.title.x=element_text(color=ptcolor),
        axis.title.y=element_text(color=ptcolor))
}


qplot(x=iris$Petal.Length,y=iris$Petal.Width,col=factor(iris$Species),shape=factor(iris$Species))+theme_bw(base_line_size = 0,base_family = 'pacific')+
  labs(x='Petal Length',y='Petal.Width',title='Petal Length vs Width')+theme(aspect.ratio = 1.3,plot.title = element_text(color='brown'),axis.title.x =element_text(color='brown'),axis.title.y = element_text(color='brown'),legend.text = element_text(color='black'),legend.title = element_text(color='brown') )


ggplot(data=iris,aes(x=factor(Species),y=Petal.Length,fill=Species))+geom_violin()

       
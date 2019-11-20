library(ggplot2)
mpg

qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
qplot(hwy,data=mpg,facets=drv~.)
str(mpg)
qplot(data=mpg,displ,hwy,facets=cyl~.,geom=c("point","smooth"),method="lm")
head(mpg)
##ggplots can be summarised as below
g<-ggplot(data=mpg,aes(displ,hwy))
print(g)
summary(g)
p<-g+geom_point()
p

ggplot(data=mpg,aes(displ,hwy))+geom_point()+geom_smooth()
y<- -100:100
x<-y^2/(4*2)
df<-data.frame(x,y)
df
ggplot(aes(x,y),data=df)+geom_point()+geom_smooth()

##theme is used for more general stuff like legends,themebg,etc.
##ggplot with cyl groups, smoothing with linear model not default leos and points.
ggplot(data=mpg,aes(displ,hwy))+geom_point(col="red ",size=2,alpha=1)+geom_smooth(size=2,linetype=1,method="lm")+facet_grid(cyl~.)+
        xlab("displacement")+ylab("highway mileage")+theme(legend.position ="topright")+theme_bw()

#we can also color points according to group like in qplot by aes in points() and labs() for labelling and stuff
ggplot(data=mpg,aes(displ,hwy))+geom_point(aes(color=cyl))+labs(x="displacement",
"highway mileage",title=expression("log "^pm2.5))
## not to confuse b/w coloring all points and coloring according to a factor var as above.

##we can plot based on third vairable if it is continuous by cutting into
#quantiles and then cutting it based on those quantiles.
#here based plotting 2 vars based on one cont var 'cty' and one factor var 'cyl'
cutpoints<-quantile(mpg$cty,seq(0,1,length.out = 5))
cty_inquants<-cut(mpg$cty,breaks=cutpoints)
cty_inquants

ggplot(data=mpg,aes(displ,hwy))+geom_point()+facet_wrap(cyl~cty_inquants,nrow=4,ncol=4)+
        geom_smooth(method="lm",col="blue")+
        theme_bw(base_family="Avenir",base_size=10)
        

## we can create line plot by not passing geom_point() but rather geom_line()
ggplot(data=mpg,aes(displ,hwy))+geom_line(col="red",size=1.2)+geom_smooth()

##we can limit the y and x limits using two methods: either remove it 
#completely from plot or neglect the extereme part.
#ylim() to remove it from plot
#coord_cartesian() to neglect extreme outliers.
ggplot(data=mpg,aes(displ,hwy))+geom_line()+coord_cartesian(ylim=c(10,30))
#ylim() to remove values above 30 or below 10.
ggplot(data=mpg,aes(displ,hwy))+geom_line()+ylim(10,30)



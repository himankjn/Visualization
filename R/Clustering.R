
set.seed(1234)
par(mar=c(4,4,4,4))
x<-rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y<-rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
dataframe<-data.frame(x,y)
#eucladian distance.
distxy<-dist(dataframe)
#hierarchical clustering using hclust()
hcluster<-hclust(distxy)
plot(hcluster,col="red")
heatmap(as.matrix(dataframe))


#K-means clustering using kmeans()
kmeansob<-kmeans(dataframe,centers=3)
names(kmeansob)
kmeansob$cluster
kmeansob$centers
plot(x,y,col=kmeansob$cluster,pch=19,cex=2)
points(kmeansob$centers,col=1:3,pch=3,cex=3,lwd=3)



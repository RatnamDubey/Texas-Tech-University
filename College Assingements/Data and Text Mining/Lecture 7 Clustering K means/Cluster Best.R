#loading package 
library(caret)
set.seed(123)
idx=createDataPartition(y=iris$Species,p=0.7,list=FALSE)
training=iris[idx,]
testing=iris[-idx,]

training.data=scale(training[-5])
summary(training.data)
#develop a mode=three clusters

iris.kmeans=kmeans(training.data[,-5],centers = 3,iter.max=1000)
iris.kmeans
iris.kmeans$centers

training$cluster=as.factor(iris.kmeans$cluster)
head(training)
table(training$Species, training$cluster)
library(NbClust)
#try to come out with the number of cluster and using the NBclust we apply to data
nc=NbClust(training.data, min.nc=2,max.nc=15,method="kmeans")
nc 
nc$Best.nc

#based on the number of clusters 

par(mfrow=c(1,1))
best=table(nc$Best.nc[1,])
barplot(best,xlab="# of cluster",ylab="criteria", main="Let's Go Home")

library(cluster)
library((fclust))


distance =dist(training.data)
sk = silhouette(iris.kmeans$cluster,distance)
plot(sk)


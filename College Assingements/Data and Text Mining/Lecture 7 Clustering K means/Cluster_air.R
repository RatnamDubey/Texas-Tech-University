library(caret)
set.seed(123)

air <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 7 Clustering K means/air.csv")

training.air=air

#develop a mode=three clusters

air.kmeans=kmeans(training.air[-3],centers = 3,iter.max=1000)
air.kmeans
air.kmeans$centers

cluster=as.factor(air.kmeans$cluster)

library(NbClust)
nc=NbClust(training.air, min.nc=2,max.nc=4,method="kmeans")

#based on the number of clusters 

par(mfrow=c(1,1))
best=table(nc$Best.nc[1,])
barplot(best,xlab="# of cluster",ylab="criteria", main="Let's Go Home")

library(cluster)



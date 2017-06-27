#Question no 1 

#a) 

# Importing the Data set 

Exam2 <- read.csv("C:/Users/dubey/Desktop/Exam2-Q1.csv")
#Checking the Data 
str(Exam2)

# This is for reducing the data set of the  Exam Data 
x = Exam2[1:10,2:5]
x

#Applying the Ward Method Clustering 

clust <- hclust(x , method = "ward.D")
plot( clust , main="ward linkage")

#It is giving us error that teh size cannot be NA or exceeded from 65536 but in the current problem we need to make
# i have tried several methods 1 have taken 10 rows for instance that the size must not exced from 65535 so i have taken 10 rows 
# Due to the machine issue i cannot move forward with it 
# As Prof Song approved with the machine and told to put a note on the same. 


#b) 
# Use the K means Cluster 
library(NbClust)
#try to come out with the number of cluster and using the NBclust we apply to data
nc=NbClust(Exam2, min.nc=2,max.nc=10,method="kmeans")
nc 
nc$Best.nc
# based on the NUmber of Cluster 

par(mfrow=c(1,1))
best=table(nc$Best.nc[1,])
barplot(best,xlab="# of cluster",ylab="criteria", main="Recommended Number of Cluster")
# The Best Number of Cluster that has been recommended by the Algorithm is 8
# In the 8 cluster most of the Diversity we can find in the Dat anad the appropriate number of clusters can be formed 
#taking more Clusters make the Machine Slow so keeping max number as 10 





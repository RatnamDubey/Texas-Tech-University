crime1 <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 7 Clustering K means/crime1.csv")
str(crime1)

x = crime1[,3:4]
x

dx = round(dist(x) , digits = 1)
dx

hc1 <- hclust(dx , method = "single")
plot(hc1 , main="Single linkage")


hc2 <- hclust(dx , method = "complete")
plot(hc2 , main="complete linkage")


hc3 <- hclust(dx , method = "average")
plot(hc3 , main="average linkage")


hc4 <- hclust(dx , method = "ward.D")
plot(hc4 , main="ward linkage")



cl.num <- 2 # Cluster name 
colnames(x) <-  c('murder' , 'rape')


hc1.result <-  cutree(hc1 , k=cl.num)
hc1.result

plot(x,pch=hc1.result)
text(x,labels = crime1$city)

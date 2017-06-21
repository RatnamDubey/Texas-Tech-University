crime2 <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 7 Clustering K means/crime2.csv")
str(crime2)

x = crime2[,3:4]
x

dx = round(dist(x) , digits = 1)
dx

hc1 <- hclust(dx , method = "average")
plot(hc1 , main="Avg linkage")


cl.num <- 5 # Cluster name 
#colnames(x) <-  c('murder' , 'rape')


hc1.result <-  cutree(hc1 , k=cl.num)
hc1.result

plot(x,pch=hc1.result)
text(x,labels = crime2$City , adj = 0 , cex = 0.7)
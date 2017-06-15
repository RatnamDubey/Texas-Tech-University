library("class")

#setwd("C:\Users\dubey\Documents\GitHub\Texas-Tech-University\College Assingements\Data and Text Mining\Lecture 2 KNN")
inclass <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 2 KNN/Lc02Ex01.csv")


normalize = function(x){return (x-min(x)/max(x)-min(x))}
inclass$ID <- NULL

inclass_x <- data.frame(lapply(inclass[2:31],normalize))


set.seed(2)

idx = sample(1:nrow(inclass),0.7*nrow(inclass_x),replace = FALSE)

train = inclass_x[idx,]
test = inclass_x[-idx,]


trainy= inclass[idx,1]
testy=inclass[-idx,1]



out = knn(train,test,trainy,k=4)






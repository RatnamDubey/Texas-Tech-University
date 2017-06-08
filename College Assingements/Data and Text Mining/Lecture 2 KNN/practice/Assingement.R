library("class")
library(compare)

inclass <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 2 KNN/practice/LC02InClass.csv")

plot(inclass$Income...000s.,inclass$Ownership.of.Car)

train_labels <- inclass[1:20,1:3]
test_labels <- inclass[20:24,1:3]

train_y_labels <- inclass[1:20,4]
test_y_labels <- inclass[20:24,4]

out = knn(train_labels,test_labels,train_y_labels,k=1)
out_1 = knn(train_labels,test_labels,train_y_labels,k=3)
out_2 = knn(train_labels,test_labels,train_y_labels,k=7)
out_3 = knn(train_labels,test_labels,train_y_labels,k=50)

print(out)
print(out_1)
print(out_2)
print(out_3)

comparison <- compare(test_y_labels,out,allowAll=TRUE)
 
final = knn(inclass[,c(2,3)],test=c(60,2000),inclass[,4],k=3)
print(final)



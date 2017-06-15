heart <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 5 Classification Bysian and Discrimnant/heart.csv")

library(e1071)
library(caret)

idx <- createDataPartition(y = heart$AHD , p = 0.7 , list = FALSE)

train <- heart[idx,]
test <- heart[-idx,]

summary(train)

model <- naiveBayes(AHD~. , data = train)
summary(model)

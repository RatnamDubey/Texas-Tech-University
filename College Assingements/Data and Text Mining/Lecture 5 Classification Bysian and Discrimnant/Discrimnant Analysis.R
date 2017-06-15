data <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 5 Classification Bysian and Discrimnant/Lc05.csv")
str(data)


m1 <- subset(data , City==1)
m2 <- subset(data , City==2)

library('MASS')

dts <- lda(City~., data = data)
dts 

pred <- predict(dts, data )
pred 


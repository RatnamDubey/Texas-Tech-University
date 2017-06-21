mower <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 5 Classification Bysian and Discrimnant/mower.csv")
str(mower)


m1 <- subset(mower , Ownership=='Owner')
m2 <- subset(mower , Ownership=='Nonowner')

library('MASS')
library(caret)

dts <- lda(Ownership~Income+Lot.Size, data = mower)
dts 

pred <- predict(dts, mower )
pred$class 

xtab <- table(mower$Ownership,pred$class)
confusionMatrix(xtab)


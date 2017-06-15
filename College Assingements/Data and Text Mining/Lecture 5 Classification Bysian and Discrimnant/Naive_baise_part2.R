delay2 <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 5 Classification Bysian and Discrimnant/delay2.csv")

delay2$Delayed <- factor(delay2$Delayed)

library(e1071)
library(caret)

idx <- createDataPartition(y = delay2$Delayed , p = 0.7 , list = FALSE)

train <- delay2[idx,]
test_001 <- delay2[-idx,]

summary(train)

model <- naiveBayes(Delayed~. , data = train )
summary(model)

model_pred <- predict(model, test_001 , type = "class")


actual <- test_001$Delayed


xtab <- table(actual,model_pred)
confusionMatrix(xtab)


test1 = data.frame( v1 = 7, v2='DH', v3='IAD',v4='EWR', v5=5)
colnames(test_001) <- colnames(delay2)

rats <- predict(model, test1,type = "raw")

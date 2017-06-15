wine <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 4 Neural Networks/wine.csv")
wine$C1 <- factor(wine$C1)

samp <- c(sample(1:70,60),sample(71:130,50),sample(141:178,30))
datatrain <- wine[samp,]
datatest <- wine[-samp,]



#LOading the Library 

library(nnet)
wine.net <- nnet(C1~., data=datatrain, size=10)
summary(wine.net)


# predicting the value 
pred <- predict(wine.net,datatest,type="class" )
pred 

#Value 
actual <- datatest$C1
confusion.matrix <- table(actual,pred)
confusion.matrix
round(prop.table((confusion.matrix)*100) , digits = 1)


library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

library(reshape)
plot.nnet(wine.net)

xtab <- table(actual,pred)
confusionMatrix(xtab)


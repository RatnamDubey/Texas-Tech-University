data("iris")

iris_scaled <- cbind(scale(iris[,-5]),iris[5])

samp <- c(sample(1:50,35),sample(51:100,35),sample(101:150,35))
datatrain <- iris_scaled[samp,]
datatest <- iris_scaled[-samp,]

head(datatrain)
head(datatest)

#Fitting the Neural Network 

library(nnet)
iris.net <- nnet(Species~., data=datatrain, size=2)
summary(iris.net)


# predicting the value 
pred <- predict(iris.net,datatest,type ="class" )
pred 

#Value 
actual <- datatest$Species
confusion.matrix <- table(actual,pred)
confusion.matrix
round(prop.table((confusion.matrix)*100) , digits = 1)


library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

library(reshape)
plot.nnet(iris.net)


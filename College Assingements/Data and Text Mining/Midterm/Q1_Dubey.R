s#Loading the libraries
library(tree)
library(rpart)
library(rpart.plot)
library(e1071)
library(caret)

#Loading the Data. 
Exam1 <- read.csv("C:/Users/dubey/Desktop/Exam1.csv")
#Checking the Chactersrics of the Data 
str(Exam1)
#Checking the null values in the Exam1 
is.null(Exam1)
#Partitioning the Data into train and Test 
idx <- createDataPartition(y = Exam1$AHD , p = 0.7 , list = FALSE)
#Creating the Train and Test Data based on the 70-30 ratio
train <- Exam1[idx,]
test <- Exam1[-idx,]
#Fitting the model based on the traing data set 
fit <- (rpart(AHD~. , data = Exam1))
#getting the summary of the fitted model 
summary(fit)
#Ploting the Fitted model with the text
plot(fit)
text(fit)
rpart.plot(fit)
#As we can see in the above graph we have devloped the tree model and in which the model is been devoloped by
#Based on the AHD is the there or not in the above scenario if the thal is normal and the chest pain is nonanginal then the AHD is not there
# where is the THAL normal is is no then the AHD is is there and thal normal with chest pain typical then there are more chance of AHD about 90%
# so under these observation we can devloped a prune tree which eliminated the unwanted or relatively low required estimes it is better for the model prediction
carttree <- prune(fit,cp=(fit$cptable[which.min(fit$cptable['xerror'])]))
plot(carttree)
text(carttree)
# As the prued tree we get the fit we find that the optimul tree which we have created and the pruned tree which we have devloped have the same result. 
# Predicting the model 
model_pred <- predict(fit, test , type = "class")
#Validating the Prediction 
actual <- test$AHD
xtab <- table(actual,model_pred)
confusionMatrix(xtab)
# as we can clearly see the Accuracy of the model is around 88% so this model is significatnly better for the model prediction. 

# Answers over the Analysis. 
#Ans 1 ) Tree is used for the Classification :- IN the tree classifiation every column has been divided and created the tree based on the same like in the current example 
# If the chest pain if u have chest pain and also ur ca is greater than 0.5 than u surely have AHD whereas if u  have Ca less than 0.5 then there will be another condition 
# so based on the varios factors tree decide to classify the output. there are various methods to split the records like Gini index, Information gain and etc
# various tecnique were used in the diving of the data. and based on the division we can check for the outcomes on each division. 
#ANd 2 )This rule is equivalent to all the decison trees every data can be divided based on the gropus of teh Data and in this way the 
# decision tree is the fast and gives the result  but as the decision tree is fast it creates the problem of overfitting 
#where every data been created as the single node which causes the problem. But that can ve avoided wusing the tuned parameters and avoiding the individual splitting of the data. 
#ANs 3)Advantages of using the Full tree is that it gives the better score in some cases where as it may also lead to the some uncertain result if we add insignificant data 
# as we try to remove the insignificant data we use the best pruned tree which provide the insight that wat data needs to used for the optinul result however it increase the analysis cost 
#but it is always the best practice to use the best pruned tree, It also helps in avaoiding the over fitting the result if the prediction will be better in comparision to the full tree. 








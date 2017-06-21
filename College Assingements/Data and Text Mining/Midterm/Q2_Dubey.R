#Loading the libraries
library(e1071)
library(caret)
#Loading the Data. 
Exam2 <- read.csv("C:/Users/dubey/Desktop/Exam2.csv")
#Checking the Chactersrics of the Data 
str(Exam2)
#Checking the null values in the Exam1 
is.null(Exam2)
#Converting the integer (Credit card) in factor 
Exam2$CreditCard <- factor(Exam2$CreditCard)
str(Exam2)
#Partitioning the Data into train and Test 
idx <- createDataPartition(y = Exam2$CreditCard , p = 0.65 , list = FALSE)
#Creating the Train and Test Data based on the 65-35 ratio
train <- Exam2[idx,]
test <- Exam2[-idx,]
#Checking the summary of teh model 
summary(train)
# as we can see majorly people got gejected for the credit card 0 as 2295 
#Creating the naive bais model based on the Data provided. 
model <- naiveBayes(CreditCard~. , data = train )
model
# Preding the values from the model 
model_pred <- predict(model, test , type = "class")
#Checking the accuracy of the model 
actual <- test$CreditCard
xtab <- table(actual,model_pred)
confusionMatrix(xtab)
# Model accuracy is around 75% 
# which can be considered for the model prediction 
# Checking the probablity 
#Calculating the Probablity of the Loan 
#P(Credit_card=1|LOan=1)
# Created a dummy record for the smae.
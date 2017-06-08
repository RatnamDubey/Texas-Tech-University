library(class)


#loading the Data
data <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 2 KNN/Lc02Ex01.csv")

#unwanted column is set to null 
data$ID <- NULL


# defining the function 
myfunction <- function(x){
  a <- min(x)
  b <- max(x)
  r <- x - b / b - a 
  return(r)
}



#Applying and normalizing the data through the function 
m <- data.frame(lapply(data[3:31], myfunction))


# diving the Data into 70/ 30 ratio
indexes = sample(1:nrow(data), size=0.3*nrow(data))
test = data[indexes,]
train = data[-indexes,]
dim(train)
dim(test)


summary(train)

test_y = data[indexes,1]
train_y = data[-indexes,1]


knn.1 <-  knn(train, test, train_y, k=1)







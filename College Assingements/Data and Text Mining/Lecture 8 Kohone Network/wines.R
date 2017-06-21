library(kohonen)

wine <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Leture 8 Kohone Network/wine.csv")

head(wine)

# Normalize the Data Usine Scale Function 
winedata <- scale(wine)
str(winedata)

index <- sample(1:dim(winedata)[1], 115)
train <- winedata[index,]
test <- winedata[-index,]


result <- som(train , grid=somgrid(5,5, "hexagonal"))
names(result)
result$unit.classif
result$codes

par(mfrow = c(2,2))
plot(result , type="property" ,  property = result$codes[[1]][,1] , main = colnames(result$codes[[1]])[1])
plot(result , type="property" ,  property = result$codes[[1]][,2] , main = colnames(result$codes[[1]])[2])
plot(result , type="property" ,  property = result$codes[[1]][,3] , main = colnames(result$codes[[1]])[3])
plot(result , type="property" ,  property = result$codes[[1]][,4] , main = colnames(result$codes[[1]])[4])
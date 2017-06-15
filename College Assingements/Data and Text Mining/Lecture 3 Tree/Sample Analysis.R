
library(tree)
library(rpart)
library(rpart.plot)

# Loading of the Data 
data(iris)

fit <- (rpart(Species~. , data = iris))
summary(fit)

plot(fit)
text(fit)

rpart.plot(fit)

prp(fit)

carttree <- prune(fit,cp=(fit$cptable[which.min(fit$cptable['xerror'])]))
plot(carttree)
text(carttree)

test = data.frame( v1 = 2.3, v2=1.2, v3=2.3,v4=1.8, v5='que')
colnames(test) <- colnames(iris)

rats <- predict(carttree, test[,-5],type = "class")


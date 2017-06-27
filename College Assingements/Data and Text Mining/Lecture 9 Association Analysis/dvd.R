dvd <- read.csv("~/GitHub/Texas-Tech-University/College Assingements/Data and Text Mining/Lecture 9 Association Analysis/dvd.csv")

library(arules)

head(dvd$id)

dvd.list <- split(dvd$Item, dvd$id)

# devloping rules 
rules = apriori(dvd.list)
# inspect 
inspect(rules)


# Rules 2 as there are too many items picked 

rules2 = apriori(dvd.list , parameter = list(support = 0.5 , conf = 0.8 ))
# inspect 
inspect(rules2)

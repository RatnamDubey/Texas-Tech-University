id<- c(1,2,3,4,5,6)
gender<- c("female","male","female","female","male","female")
age <- c(23,28,42,34,45,36)
child <-c("no","no","no","yes","no","yes")
mobile_app <- c("yes","yes","no","yes","no","yes")
reorder <- c("yes","no","no","yes","no","yes")

cust = cbind(id,gender,age,child,mobile_app,reorder)

# Creating the Data frame with Cust 
cust = transform(cust,
                 id = as.character(id),
#                 gender = as.character(gender),
                 age = as.character(age)
 #                child = as.character(child),
#                 mobile_app = as.character(mobile_app),
 #                reorder=as.character(reorder)
                 )
# Discreation on age data 

cust = within (cust,{
                age_ds =character(0)
               age_ds[age<=29] ="age_20"
               age_ds[age > 29 && age <= 30] = "age_30" 
                age_ds[age > 30] = "age_40"
            #   age_ds = as.factor(age_ds, level=c("age_20","age_30","age_40"))
                
                })
cust$age_ds <- as.factor(cust$age_ds)

custsub <- subset(cust , select = -c(id,age))

library(arules)

ruz = apriori(custsub , parameter = list(support = 0.3 , conf = 0.5 ))
inspect(ruz)


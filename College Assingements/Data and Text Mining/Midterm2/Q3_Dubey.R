library(arules)
library(arulesViz)
# Loading the Data 

data(Epub)
# Loading the Data and Inspecting 
#Inspecting the Data for first 10 items  
inspect(Epub[1:10])
#association rules using the Data keeping the Support aas 0.002 and Confidence as 0.02 
ruz = apriori(Epub , parameter = list(support = 0.002 , conf = 0.02 ) )



#plotting the Data based on the Interpreted Algorithm 
#Grouping the Support and Lift and Shading it with Confidence 
plot(ruz, measure=c("support", "lift"), shading="confidence")

#This representation focuses on how the rules are composed
#of individual items and shows which rules share items

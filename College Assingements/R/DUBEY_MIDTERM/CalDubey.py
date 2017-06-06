# Creating the Module name CalDubey

# Defining Function Gross Salary which takes Input as Hours worked and Hourly Rate 
def GrossSalary(hours_wkd , hourly_rte):
       #Gross Income calculated by multiplying hours worked and hourly rate 
       gross = hours_wkd * hourly_rte
       #Return Gross Income by Function
       return gross


#Defining function Tax which takes input as Gross Salary and calculate Tax 
def Tax(gross):
       # Calculating the tax , Tax is 15% of the Gross Salary 
       tax=gross*0.15
       #Return Tax 
       return tax

# Defining Net Income of the User by taking Gross Salary and Tax as Input
def NetIncome(gross,tax):
       # net Income is Gross salary - Tax 
       net=gross-tax
       #Return Net Income
       return net


       

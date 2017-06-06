
#Defining main Function 
def main():
       #Taking Input as Hours worked 
       hours_wkd = float(input("Enter hours worked"))
       #Taking Input of Hourly rate 
       hourly_rte = float(input("Enter hourly rate"))


       import CalDubey

       #Passing te Hours worked and Hourly rate to the Function and Taking Gross salary in a variable.
       gross=CalDubey.GrossSalary(hours_wkd,hourly_rte)
       #Passing the Calculated Gross salary to Function tax and Calculated the Tax
       tax=CalDubey.Tax(gross)
       #Calculated the Net income by passing gross sal and Tax to the Function and calculated the Net income 
       net=CalDubey.NetIncome(gross,tax)

       #Printing Gross Salary 
       print ("Your Gross Salary :" , format(gross, ',.2f'))
       #Printing Tax Calculated 
       print ("Your Tax :" , format(tax, ',.2f'))
       #Printing Net Income
       print ("Your Net Income : " , format(net, ',.2f'))



main()

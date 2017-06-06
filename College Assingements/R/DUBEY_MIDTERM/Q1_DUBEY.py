# Program to Calculate the Future Value of the Specific Months

# Creating a Function For getting Future Value 
def Future_value():
       #Taking the Input from the user of present value , Monthly intrest and Number of Months
       Present_Val = float(input("Enter the present value of the account in dollars : "))
       Intrest_rate = float(input("Enter the monthly intrest rate as a percentage : " ))
       Months_Time = float(input("Enter the number of months :"))


       #Print the User Input Information 
       print("The Information of the account is")
       print("Present value" ,Present_Val)
       print("Intrest Rate" , Intrest_rate)

       #Intrest Rate will be in precentage so converting the Percent value 
       Intrest_rate_per= Intrest_rate/100


       # Performing the Calculation by Extra Variables

       #Converted Intrest Rate  + 1 
       k = (1+Intrest_rate_per)
       # Calculating the power of Converted Intrest Rate  + 1
       r = k ** Months_Time
       # Generating the Future Value
       Future_val = Present_Val * r

       #Printing the Desired Output for the User 
       print ("After" ,int(Months_Time) , " months ,the value of your account will be $" , format(Future_val, ',.2f'))



#Creating main Function 
def main():
       #Calling Funtion 
       Future_value()


#Callling main function 
main()

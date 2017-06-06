#Assingement 7-1
#Need to calculate the Property Tax on the assesment value of the property


def AssesmentVal(value1):
   # Calculating the assesment Value of the Property Tax
    Assesment_val = value1*0.6
    return Assesment_val


    # Calculating the Property Tax of the assesment Value 

def PropertyTax(asses):
    Cal_tax = asses/100
    Fin_tax = Cal_tax*0.72
    return(Fin_tax)


# Defining main function and calling all the Other Function 

def main():
    Actual = float(input("Please enter the Actual Value of Property"))
    Asses_val = AssesmentVal(Actual)
    Property_tax = PropertyTax(Asses_val)
    print("Assessed Value $" ,format(Asses_val ,',.2f'))
    print("Property Tax $" , format(Property_tax ,',.2f'))


#Calling Main Function
main()    

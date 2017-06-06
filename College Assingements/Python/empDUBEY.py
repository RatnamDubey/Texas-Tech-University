import assign11DUBEY

#Defining main function

def main():
       name = input("Enter the name :")
       iden = input("Enter the identity :")
       shift = input("Enter the shift number :")
       pay = float(input("Enter the hourly pay rate :"))

#Passing the values to the class

       emp1 = assign11DUBEY.ProductionWorker(name,iden,shift,pay)

#Printing the values

       print('\nProduction worker information: \n')
       print('Name  ' + emp1.getName())
       print('ID Number: ',emp1.getIden())
       print('Shift: ',emp1.getShift())
       print('Hourly Pay Rate: ',format(emp1.getPay(),'.2f')) 



main()

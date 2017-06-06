import cellphone

def main():
       cell_man = input("Enter cell phone manufacture :")
       cell_name = input("Enterr cell phone name :")
       cell_price = float(input("Enter cell phone price"))


       #Creating the instance of Cell phone
       phone= cellphone.CellPhone(cell_man,cell_name,cell_price)



       print(phone.getManu())
       print(phone.getModel())
       print(phone.getPrice())



main()

class CellPhone:
       def __init__(self , manu , model, price):
              self.manufacture=manu
              self.__model=model
              self.retailprice=price

       def getManu(self):
              return self.manufacture
       def getModel(self):
              return self.__model
       def getPrice(self):
              return self.retailprice

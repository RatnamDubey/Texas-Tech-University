#Define Employee  as Sub Class

class Employee:
       def __init__(self,name,iden):
              self.name=name
              self.iden=iden

       def getName(self):
              return self.name
       def getIden(self):
              return self.iden
              
       
#Define Super Class As Production Worker 

class ProductionWorker(Employee):
       def __init__(self , name ,iden ,shift , pay):
              Employee.__init__(self,name,iden)
              self.shift=shift
              self.pay=pay

       def getShift(self):
              return self.shift
       def getPay(self):
              return self.pay
              

# The distance a vehicle travels 

# Taking the input from the user

Speed = float(input("Enter the spped of vehicle in Mph : "))
Hours = int(input ("Enter the number of hours travelled"))

#Calculating the Distance
#initialising i
i=0 
#Printing Header

print ("Hour \t  Distance Travelled")
print("-------------------------------")

for i in range(1, 1+Hours):
    Distance = Speed * i
    print (i ,"\t", Distance) 

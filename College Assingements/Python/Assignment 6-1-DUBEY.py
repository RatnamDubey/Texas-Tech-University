# Taking the Weight from the user

Weight = float(input("PLease enter your weight in pounds"))
Height = float(input ("Please enter your Height in inches"))

# Calculating BMI 

BMI = (Weight)*(703) /(Height*Height)
print(BMI)

# IF BMI is above 25 then it will tell overweight
#If it is between 18.5 to 25 it will show optimal
# Else it will update as under weight

if (BMI > 25):
    print ("Over weight")
elif(BMI > 18.5 and BMI < 25):
            print("Optimal Weight")
else:
    print ("Under Weight")

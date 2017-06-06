def FileData():
       #Define Variables 
       yearlyChange = []
       yearlyPopulation = []
       change = 0.0
       totalChange = 0.0
       greatestIncrease = 0.0
       smallestIncrease = 0.0
       greatestyear = 0
       smallestyear = 0
       #Define Base as 1990 
       Base = 1990

       #Open File Data 
       File_Data=open('D:\\College Assingements\\Data\\Data_9_1.txt' ,'r')
       print(File_Data)

       #Applying the Logic 
       population = File_Data.readlines()
       print (population)
       for i in range(1,len(population)):
            change = float(population[i]) - float(population[i-1])
            yearlyChange.append(change)

                  
            if i == 1:
                greatInc = change
                smallInc = change
            else:
                if change > greatInc:
                    greatInc = change
                    greatestyear = Base + i
                if change < smallInc:
                    smallInc = change
                    smallestyear = Base + i

       totalChange = float(sum(yearlyChange))
       averageChange = totalChange / len(yearlyChange)

       #Printing the values 
       print('The average annual change in population: ',averageChange)
       print('The year with the greatest ncrease in population was',greatestyear)
       print('The year with the smallest ncrease in population was',smallestyear)

       



def main():
        
           
           FileData()


main()

#Program to calculate the Program

def DataColl():
       i="y"
       Test_score=[]
       while (i=="y"):
              Test_val = float(input("Enter your test score :"))
              Test_score.append(Test_val)
              print("DO you want to add another score ")
              i = input("y = yes , anything else = no ")
       return Test_score


def DataCalc(Test_score):
       min_val = min(Test_score)
       Total_val=sum(Test_score)
       Count_val=len(Test_score)
       subs_val = Total_val - min_val
       Adj_count = Count_val - 1
       if(Adj_count == 0 ):
               print("Cannot Divide the value by 0  ")
               Final_score = 0 
       else:
              Final_score = subs_val / Adj_count
       return Final_score


def main():
       Test_score_1=DataColl()
       Total_score = DataCalc(Test_score_1)
       print("The average of the total is " , Total_score)


main()

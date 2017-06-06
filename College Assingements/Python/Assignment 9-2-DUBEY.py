#Creating the Data Dictionary



#Creating the Data Dict for courses
courses = {
       'ISQS5331':'231',
       'ISQS6337':'003',
       'ISQS3344':'105'
           }


#Creating the Data Dict for Instructors

Instructors = {
       'ISQS5331':'Song',
       'ISQS6337':'Song',
       'ISQS3344':'Flamm'
       }

#Creating the Data Dict for meeting

Meeting = {
       'ISQS5331':'11:00 a.m.',
       'ISQS6337':'2:00 p.m',
       'ISQS3344':'10:00 a.m'
       }
       


#Taking the input from the user and grabing the output

course_input = input("Enter the number :")
course_room = courses[course_input]
course_instruct=Instructors[course_input]
course_meeting=Meeting[course_input]

print("The details for course ",course_input ,"are")
print("Room",course_room)
print("Instructor",course_instruct)
print("Time",course_meeting)

# -*- coding: utf-8 -*-
"""
Spyder Editor
Script is Written bY Ratnam Dubey 
Data Bowl 2017 
This is a temporary script file.
"""
# Importing the Data set 
import numpy as np 
import pandas as pd 
from sklearn import preprocessing
import xgboost as xgb
le = preprocessing.LabelEncoder()


# Importing the Training Data 
train_1 = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Train_data\\1.csv')
train_2 = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Train_data\\2.csv')
train_3 = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Train_data\\3.csv')
train_4 = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Train_data\\4.csv')

# Dropping the Unnamed Colum from all the Files 

train_1 = train_1.drop('Unnamed: 0', 1)
train_2 = train_2.drop('Unnamed: 0', 1)
train_3 = train_3.drop('Unnamed: 0', 1)
train_4 = train_4.drop('Unnamed: 0', 1)

# Adding the All four Data frames into the one 

frames = [train_1, train_2,  train_3, train_4]
train_data = pd.concat(frames)

# Dropping the Data frame as to save memory 
del train_1
del train_2
del train_3
del train_4

#Importing the Labels Data 
train_labels = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Labels\\stage1_labels.csv')
#Naming the labels 
train_labels.columns = ['PatientID', 'cancer']

# Matching the Label Data with the Training Data 

traindata_full = train_data.merge(train_labels,on=['PatientID'],how='inner')

#Encoding the value of Image and PatientId (as the Training model didnt accept the String values)

traindata_full['PatientID_new'] =  le.fit_transform(traindata_full.PatientID)
traindata_full['image_id_new'] =  le.fit_transform(traindata_full.image_id)

# Dropping the PatientID and Image ID 
temp1 = traindata_full.drop('PatientID', 1)
traindata_temp = temp1.drop('image_id', 1)



# Dropping temp Tables 
del temp1
#del traindata_temp


# IMporing the Test Data 
test_1 = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Test Data\\test1_200.csv')
test_2 = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Test Data\\test201_all.csv')

# Dropping the Unnamed Colum from all the Files 
test_1 = test_1.drop('Unnamed: 0', 1)
test_2 = test_2.drop('Unnamed: 0', 1)

# Adding the All four Data frames into the one 

frames_test = [test_1 , test_2]
test_data = pd.concat(frames_test)

#Encoding the value of Image and PatientId (as the Training model didnt accept the String values)

test_data['PatientID_new'] =  le.fit_transform(test_data.PatientID)
test_data['image_id_new'] =  le.fit_transform(test_data.image_id)


# Dropping the PatientID and Image ID 
temp2 = test_data.drop('PatientID', 1)
testdata = temp2.drop('image_id', 1)

# Dropping temp Tables 
del temp2

# tAKING THE mean of every patient data and calculation be based on the same
traindata_temp = traindata_temp.groupby('PatientID_new').mean().reset_index()
test_final = testdata.groupby('PatientID_new').mean().reset_index()

# Storing the Cancer Data from the Data frame 
y_train = traindata_temp['cancer']
train_final = traindata_temp.drop('cancer', 1)

#Updating the Slice location with Mean in test data  
test_final = test_final.replace('NaN',-184.11)

# Applying Xgboost Regression 

#Modifing Data According to Xgboost for Train 
train_y = np.array(y_train)
train_X = np.array(train_final).astype('float')
xgtrain = xgb.DMatrix(train_X, label=train_y)


#Modifing Data According to Xgboost for Test 
xgtest_1 = np.array(test_final).astype('float')
xgtest = xgb.DMatrix(xgtest_1)

#Defining parameters 
params = {}
params["objective"] = "reg:linear"
params["eta"] = 0.05
params["max_depth"] = 10
params["seed"] = 0
plst = list(params.items())
num_rounds = 700

#model

model = xgb.train(plst, xgtrain, num_rounds)

# Predicting the Values 

pred_test = model.predict(xgtest)

#Submitting the File 
out_df = pd.DataFrame({"Cancer":pred_test})

# Taking the Submission File 
#D:\Kaggle Projects\Data One Bowl\Midterm_data\Sample SUbmission

Sample_Sub = pd.read_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Sample SUbmission\\stage2.csv')
bigdata = pd.concat([Sample_Sub, out_df],  axis=1)
#Final Output 
bigdata.to_csv('D:\Kaggle Projects\Data One Bowl\Midterm_data\Output\\Stage2_final.csv' ,index=False)



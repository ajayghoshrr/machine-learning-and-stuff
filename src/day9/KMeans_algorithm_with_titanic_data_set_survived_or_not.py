import matplotlib.pyplot as plt
from matplotlib import style
style.use('ggplot')
import numpy as np
from sklearn.cluster import KMeans
from sklearn import preprocessing
import pandas as pd

'''
Pclass Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)
survival Survival (0 = No; 1 = Yes)
name Name
sex Sex
age Age
sibsp Number of Siblings/Spouses Aboard
parch Number of Parents/Children Aboard
ticket Ticket Number
fare Passenger Fare (British pound)
cabin Cabin
embarked Port of Embarkation (C = Cherbourg; Q = Queenstown; S = Southampton)
boat Lifeboat
body Body Identification Number
home.dest Home/Destination
'''
#Reading Titanic data from the excel and make into an data frame.
df = pd.read_excel('titanic.xls')
#print(df.head())

#Removing body and name which is irrelevent for the prediction
df.drop(['body','name'], 1, inplace=True)
#pd.to_numeric(list(df))
#Converting all the values in dataframe to an numeric value
df.convert_objects(convert_numeric=True)
df.fillna(0, inplace=True)
#print(df.head())

#Function for handling non numeric data -
def handle_non_numerical_data(df):
    columns = df.columns.values

    for column in columns:
        text_digit_vals = {}
        def convert_to_int(val):
            return text_digit_vals[val]

        if df[column].dtype != np.int64 and df[column].dtype != np.float64:
            column_contents = df[column].values.tolist()
            unique_elements = set(column_contents)
            x = 0
            for unique in unique_elements:
                if unique not in text_digit_vals:
                    text_digit_vals[unique] = x
                    x+=1
            #Applying the convert_to_int to all the values in the column
            df[column] = list(map(convert_to_int, df[column]))
        # Dictionary for future reference - we can convert numeric value to real value if you want
        print(text_digit_vals)
    return df

df = handle_non_numerical_data(df)

#Dropping the SEX and BOAT for irrelevance(Trail and error - If you find more accuracy, continue with it)
#Using dropping for these, I found maximum accuracy.
df.drop(['sex','boat'], 1, inplace=True)
#Training data without LABEl
X = np.array(df.drop(['survived'], 1).astype(float))
#processing the data with additiong of decimals in numeric value to increase accuracy
X = preprocessing.scale(X)
#Label data - Survived or not
y = np.array(df['survived'])
#Applying the KMeans algorithm with clustor of 2(survived and non survived)
clf = KMeans(n_clusters=2)
#Process the model
clf.fit(X)

correct = 0
for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = clf.predict(predict_me)
    if prediction[0] == y[i]:
        correct += 1

print(correct/len(X))


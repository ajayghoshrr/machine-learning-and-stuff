import pandas as pd
#quandl package will give real time data to practice and testing the data related problems(ML models etc)
import quandl
import math
import numpy as np
from sklearn import preprocessing, svm, model_selection
from sklearn.linear_model import LinearRegression
import datetime
#matplotlib used to make graph for predictions of stocks!!!
import matplotlib.pyplot as plt
from matplotlib import style

style.use('ggplot')
#quandl.ApiConfig.api_key = 'kAu3Nj1A4zKXCfF1yfRG'
#df = quandl.get_table('WIKI/PRICES', date='1999-11-18', ticker='A')
#print (df.head())
#connected to a sample WIKI data set(For more details go through Quandl docs)
#WIKI is a share market stock proce data set.
df = quandl.get('WIKI/GOOGL')
#print (df.head())
df = df[['Adj. Open', 'Adj. High', 'Adj. Low', 'Adj. Close', 'Adj. Volume']]
#print (df)
#adding High Low percentage change - Start stock price and End stock price of the day. Finding the percentage
df['HL_PCT'] = (df['Adj. High'] - df['Adj. Close']) / df['Adj. Close'] * 100.0
#Percentage change to next day  open price.
df['PCT_change'] = (df['Adj. Close'] - df['Adj. Open']) / df['Adj. Open'] * 100.0

df = df[['Adj. Close', 'HL_PCT', 'PCT_change', 'Adj. Volume']]
#print (df.head())
forecast_col = 'Adj. Close'
df.fillna(-99999, inplace = True)

forecast_out = int(math.ceil(0.1*len(df)))
df['label'] = df[forecast_col].shift(-forecast_out)
df.dropna(inplace=True)
#print (df.head())
#print (df.tail())
X = np.array(df.drop(['label'], 1))
#y = np.array(df['label'])
X = preprocessing.scale(X)
#processed in the format of decimals for training the data.
y = np.array(df['label'])

X_train, X_test, y_train, y_test = model_selection.train_test_split(X, y, test_size=0.2)
#clf = svm.SVR()
#simple linear regression for finding the accuracy.

#n_jobs=-1  --------- can add any number of jobs.
# Linear regression should use only if a common line occurs betweeen training data, that is co-relation must be there
clf = LinearRegression()
clf.fit(X_train, y_train)
#print(X_test)
#print(y_test)
accuracy = clf.score(X_test, y_test)
print (accuracy)
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
#connected to a sample WIKI data set(For more details go through Quandl docs)
#WIKI is a share market stock proce data set.
df = quandl.get('WIKI/GOOGL')
df = df[['Adj. Open', 'Adj. High', 'Adj. Low', 'Adj. Close', 'Adj. Volume']]
#adding High Low percentage change - Start stock price and End stock price of the day. Finding the percentage
df['HL_PCT'] = (df['Adj. High'] - df['Adj. Close']) / df['Adj. Close'] * 100.0
#Percentage change to next day  open price.
df['PCT_change'] = (df['Adj. Close'] - df['Adj. Open']) / df['Adj. Open'] * 100.0
df = df[['Adj. Close', 'HL_PCT', 'PCT_change', 'Adj. Volume']]
forecast_col = 'Adj. Close'
df.fillna(-99999, inplace = True)

forecast_out = int(math.ceil(0.1*len(df)))
df['label'] = df[forecast_col].shift(-forecast_out)
X = np.array(df.drop(['label'], 1))
#y = np.array(df['label'])
X = preprocessing.scale(X)
#processed in the format of decimals for training the data.
X = X[:-forecast_out]
X_lately = X[:-forecast_out:]
df.dropna(inplace = True)
y = np.array(df['label'])

X_train, X_test, y_train, y_test = model_selection.train_test_split(X, y, test_size=0.2)
#clf = svm.SVR()
#simple linear regression for finding the accuracy.

#n_jobs=-1  --------- can add any number of jobs.
# Linear regression should use only if a common line occurs betweeen training data, that is co-relation must be there
clf = LinearRegression(n_jobs=-1)
clf.fit(X_train, y_train)
#print(X_test)
#print(y_test)
accuracy = clf.score(X_test, y_test)
#print (accuracy)
#-------------------------
# forecastset is the predicted value for the input X_lately.
forecast_set = clf.predict(X_lately)
print(forecast_set, accuracy, forecast_out)
df['Forecast'] = np.nan

last_date = df.iloc[-1].name
last_unix = last_date.timestamp()
oneday = 86400
next_unix = last_unix + oneday
#Giving date for each index in the data set.
for i in forecast_set:
    next_date = datetime.datetime.fromtimestamp(next_unix)
    next_unix +=oneday
    #df lo
    df.loc[next_date] = [np.nan for _ in range(len(df.columns)-1)] + [i]
print(df.head())
#ploting the predicted values with Date & Price.
df['Adj. Close'].plot()
df['Forecast'].plot()
plt.legend(loc = 4)
plt.xlabel('Date')
plt.ylabel('Price')
plt.show()

#print(df.tail())

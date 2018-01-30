#http://archive.ics.uci.edu/ml/datasets.html   - best data set repository for machine learning practice
#Link for the data set
'''
# Data information
7. Attribute Information: (class attribute has been moved to last column)

   #  Attribute                     Domain
   -- -----------------------------------------
   1. Sample code number            id number
   2. Clump Thickness               1 - 10
   3. Uniformity of Cell Size       1 - 10
   4. Uniformity of Cell Shape      1 - 10
   5. Marginal Adhesion             1 - 10
   6. Single Epithelial Cell Size   1 - 10
   7. Bare Nuclei                   1 - 10
   8. Bland Chromatin               1 - 10
   9. Normal Nucleoli               1 - 10
  10. Mitoses                       1 - 10
  11. Class:                        (2 for benign, 4 for malignant)

Missing attribute values: 16

   There are 16 instances in Groups 1 to 6 that contain a single missing
   (i.e., unavailable) attribute value, now denoted by "?".

'''

import numpy as np
#neighbors - K neighbors theorm classfier function
from sklearn import preprocessing, model_selection, neighbors
import pandas as pd

# Reading the csv file as csv format using pandas
df = pd.read_csv('breast-cancer-wisconsin.csv')
#print(df)
#replacing junk values with -999999
df.replace('?', -99999, inplace=True)
#deleting the IDs in the CSV
df.drop(['id'], 1, inplace=True)
#data without class column
X = np.array(df.drop(['class'],1))
#print(X)
#only class column
y = np.array(df['class'])
#print(y)
#spliting the train data and test data
X_train, X_test, y_train, y_test = model_selection.train_test_split(X,y,test_size=0.2)
#classifier KNeighbour algorithm

'''
In pattern recognition, the k-nearest neighbors algorithm (k-NN) is a non-parametric method used for classification and regression.[1] In both cases, the input consists of the k closest training examples in the feature space. The output depends on whether k-NN is used for classification or regression:
In k-NN classification, the output is a class membership. An object is classified by a majority vote of its neighbors, with the object being assigned to the class most common among its k nearest neighbors (k is a positive integer, typically small). If k = 1, then the object is simply assigned to the class of that single nearest neighbor.
In k-NN regression, the output is the property value for the object. This value is the average of the values of its k nearest neighbors.
k-NN is a type of instance-based learning, or lazy learning, where the function is only approximated locally and all computation is deferred until classification. The k-NN algorithm is among the simplest of all machine learning algorithms.
Both for classification and regression, a useful technique can be to assign weight to the contributions of the neighbors, so that the nearer neighbors contribute more to the average than the more distant ones. For example, a common weighting scheme consists in giving each neighbor a weight of 1/d, where d is the distance to the neighbor.[2]
The neighbors are taken from a set of objects for which the class (for k-NN classification) or the object property value (for k-NN regression) is known. This can be thought of as the training set for the algorithm, though no explicit training step is required.
A peculiarity of the k-NN algorithm is that it is sensitive to the local structure of the data.[citation needed] The algorithm is not to be confused with k-means, another popular machine learning technique.
'''

# In easy manner - just taking some standard point in data set and , from the finding the nearest data set or data point.
clf = neighbors.KNeighborsClassifier()
#training the the data which is from model selection
clf.fit(X_train, y_train)
# NOW CLF IS THE CLASSIFIER - YOU CAN STORE THE MODEL IN PICKLE AND USE MULTIPLE TIMES(NO NEED TO TRAIN AGAIN)

# Finding the accuracy with the test data.
accuracy = clf.score(X_test, y_test)
print(accuracy,'accuracy')
# simply giving the sample prediction values - 2 rows
example_measures = np.array([[4,2,1,1,1,2,3,2,1],[4,2,1,2,2,2,3,2,1]])
example_measures = example_measures.reshape(len(example_measures),-1)
#print(example_measures)
# just predicting with the sample values( the values are in the format of csv file)
prediction = clf.predict(example_measures)
#prediction will be the class value for two prediction samples
print(prediction,'prediction')

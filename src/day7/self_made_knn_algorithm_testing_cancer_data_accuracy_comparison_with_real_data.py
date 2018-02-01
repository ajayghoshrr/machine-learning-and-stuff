
import matplotlib.pyplot as plt
from collections import Counter
from matplotlib import style
import warnings
import pandas as pd
import random
#numpy having function for finding euclidean distance
import numpy as np
#Going to create our own K Nearest neighbours algorithm
style.use('fivethirtyeight')
#function is taking the dataset as input, predict or train data set as input, k is the accuracy parameter(You can give anything(3-7 recommended).
def k_nearest_neighbors(data, predict, k=3):
    #condition for less data
    if len(data) >= k:
        warnings.warn('K is set to a value less than total voting group!!')
    distances = []
    for group in data:
        for features in data[group]:
            #standard function for finding the euclidean distances from numpy
            #we are finding distance to the predict point from each point
            #disadvantage of k nearest neighbour algo is it will compare all the distances.
            euclidean_distance = np.linalg.norm(np.array(features) - np.array(predict))
            distances.append([euclidean_distance, group])
    #print(distances,'distances')
    #finding the most common distance and group
    votes = [i[1] for i in sorted(distances)[:k]]
    #print(votes)
    #print(Counter(votes).most_common(1))
    vote_result = Counter(votes).most_common(1)[0][0]
    confidence = Counter(votes).most_common(1)[0][1] / k
    # result will be the group
    return vote_result, confidence

#Function is ready.
#Now we have to test the KNN model which we created, For that using breast cancer data.
accuracies = []
for i in range(25):
    df = pd.read_csv('breast-cancer-wisconsin.csv')
    df.replace('?', -99999, inplace=True)
    df.drop(['id'], 1, inplace=True)
    full_data = df.astype(float).values.tolist()
    random.shuffle(full_data)
    #Test size - You can increase this , If you increase yu are sharing your data to test data.
    test_size = 0.2
    train_set = {2:[], 4:[]}
    test_set = {2:[], 4:[]}
    train_data = full_data[:-int(test_size*len(full_data))]
    test_data = full_data[-int(test_size*len(full_data)):]
    # the data to be trained
    #print(train_data,'traindata')
    #In cancer patient data, class have two types - 2 and 4
    for i in train_data:
        #appending the same class (2 or 4) value to the train set from train data
        train_set[i[-1]].append(i[:-1])
        #print(train_set, 'train_set')
    #print(train_set,'train_set - final')
    #test data for the classifier
    for i in test_data:
        #appending the test data to the respected class
        test_set[i[-1]].append(i[:-1])

    correct = 0
    total = 0

    for group in test_set:
        for data in test_set[group]:
            vote, confidence = k_nearest_neighbors(train_set, data, k=5)
            if group == vote:
                #counting the no of same classes from the model
                correct += 1
            else:
                #print(confidence)
                pass
            total += 1
    #print('Accuracy:', correct/total)
    accuracies.append(correct/total)
#Mean accuracy after 25 Iteration
print(sum(accuracies)/len(accuracies), 'MEAN - ACCURACY')


#If we compare our KNN Algorithm and SK-LEARN KNN algorithms, efficiency/accuracy is different.
#becoz In SKLEARN KNN , they are using Radius - which is a distance finding methodology by making a circle in each poijnt
#and they have N_JOBS which will run the classifier as many times parallelly....



'''
It can easily make decision for the large amount of data.

But it is not scalable for tera bites of data. 

It will work only for linear data. If the data is non linear we need to go with some other method
which is support vector machine.
Happy learning=----
'''
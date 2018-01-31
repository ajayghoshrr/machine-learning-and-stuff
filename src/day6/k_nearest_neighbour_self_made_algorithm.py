# for k Nearest finding the distance between the K point and neighbour is very much important
# the distance calculation done by euclidean distance formulae - square_root(summation i = 1 to n (ai-pi)^2)
#we can calculate any number of dimentional data
from math import sqrt
import matplotlib.pyplot as plt
from collections import Counter
from matplotlib import style
import warnings
#numpy having function for finding euclidean distance
import numpy as np

'''
# Distance formule - we are using predefined function from numpy instead of this code, that's y I commented
#sample points in the data set (X,Y)
plot1 = [1,3]
plot2 = [2,5]
#applying formulae
euclidean_distance = sqrt((plot1[0]-plot2[0])**2 + (plot1[1] - plot2[1])**2)
print(euclidean_distance)
'''
#Going to create our own K Nearest neighbours algorithm


style.use('fivethirtyeight')

dataset = {'k' : [[1,2],[2,3],[3,1]], 'r': [[6,5],[7,7],[8,6]]}
new_features = [5,7]

# [[plt.scatter(ii[0],ii[1], s=100, color = i) for ii in dataset[i]] for i in dataset]
# plt.scatter(new_features[0],new_features[1])
# plt.show()

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
    print(Counter(votes).most_common(1))
    vote_result = Counter(votes).most_common(1)[0][0]
    # result will be the group
    return vote_result

result = k_nearest_neighbors(dataset, new_features, k=3)
print(result,'result')

#Scattering the graph for predicted point 
[[plt.scatter(ii[0],ii[1], s=100, color = i) for ii in dataset[i]] for i in dataset]
plt.scatter(new_features[0],new_features[1], color = result)
plt.show()